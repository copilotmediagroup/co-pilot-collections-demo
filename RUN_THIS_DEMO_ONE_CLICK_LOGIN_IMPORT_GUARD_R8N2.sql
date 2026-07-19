-- CO PILOT COLLECTIONS MANAGER — DEMO PUBLIC ACCESS GUARD R8N2
-- RUN ONLY IN THE DEMO SUPABASE PROJECT:
-- https://nixqpmgkmrzjsaqhqqew.supabase.co
-- NEVER RUN THIS IN LIVE.
--
-- This SQL does not create Supabase Auth passwords. The two Auth users must exist:
-- demo-admin@copilotdemo.com / DemoAdmin123!
-- demo-employee@copilotdemo.com / DemoEmployee123!
--
-- It approves/labels the demo profiles and blocks the public demo identities from
-- inserting or deleting account/import data at the database level. Antonio's
-- private admin login remains able to maintain and refresh the demo database.

insert into public.app_users
  (email, full_name, role, approval_status, is_approved, is_active, created_at, updated_at, last_seen_at)
values
  ('demo-admin@copilotdemo.com','Demo Administrator','admin','approved',true,true,now(),now(),now()),
  ('demo-employee@copilotdemo.com','Demo Collector','employee','approved',true,true,now(),now(),now())
on conflict (email) do update
set full_name=excluded.full_name,
    role=excluded.role,
    approval_status='approved',
    is_approved=true,
    is_active=true,
    updated_at=now();

create or replace function public.cpcm_is_public_demo_user()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select lower(coalesce(auth.jwt() ->> 'email','')) in (
    'demo-admin@copilotdemo.com',
    'demo-employee@copilotdemo.com'
  );
$$;

revoke all on function public.cpcm_is_public_demo_user() from public;
grant execute on function public.cpcm_is_public_demo_user() to authenticated;

create or replace function public.cpcm_block_public_demo_account_create_delete()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if public.cpcm_is_public_demo_user() then
    raise exception using
      errcode = '42501',
      message = 'DEMO_UPGRADE_REQUIRED: Importing, creating, or deleting accounts is disabled in the public demo.';
  end if;
  if tg_op = 'DELETE' then return old; end if;
  return new;
end;
$$;

drop trigger if exists cpcm_public_demo_account_guard on public.accounts;
create trigger cpcm_public_demo_account_guard
before insert or delete on public.accounts
for each row execute function public.cpcm_block_public_demo_account_create_delete();

-- Import batch protection is installed only when the table exists.
do $$
begin
  if to_regclass('public.import_batches') is not null then
    execute 'drop trigger if exists cpcm_public_demo_import_batch_guard on public.import_batches';
    execute 'create trigger cpcm_public_demo_import_batch_guard before insert or delete on public.import_batches for each row execute function public.cpcm_block_public_demo_account_create_delete()';
  end if;
end $$;

notify pgrst, 'reload schema';

select email, full_name, role, approval_status, is_approved, is_active
from public.app_users
where email in ('demo-admin@copilotdemo.com','demo-employee@copilotdemo.com')
order by email;
