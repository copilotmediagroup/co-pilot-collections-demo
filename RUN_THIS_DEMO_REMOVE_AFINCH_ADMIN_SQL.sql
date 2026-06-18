
-- DEMO REMOVE LIVE ADMIN / AFINCH CLEANUP
-- Run this in DEMO Supabase only:
-- https://nixqpmgkmrzjsaqhqqew.supabase.co

-- 1) Remove live/admin email from demo app profile table.
delete from public.app_users
where lower(email)=lower('afinch2678@gmail.com');

-- 2) Unassign demo accounts that somehow got assigned/imported under the live admin email.
update public.accounts
set assigned_to_email = null,
    assigned_by_email = null,
    updated_at = now()
where lower(coalesce(assigned_to_email,''))=lower('afinch2678@gmail.com')
   or lower(coalesce(assigned_by_email,''))=lower('afinch2678@gmail.com')
   or lower(coalesce(imported_by_email,''))=lower('afinch2678@gmail.com');

-- 3) Clean demo chat/presence records for live admin email if tables exist.
do $$
begin
  if exists (select 1 from information_schema.tables where table_schema='public' and table_name='team_presence') then
    delete from public.team_presence where lower(user_email)=lower('afinch2678@gmail.com');
  end if;

  if exists (select 1 from information_schema.tables where table_schema='public' and table_name='team_messages') then
    delete from public.team_messages
    where lower(coalesce(from_email,''))=lower('afinch2678@gmail.com')
       or lower(coalesce(to_email,''))=lower('afinch2678@gmail.com')
       or lower(coalesce(created_by_email,''))=lower('afinch2678@gmail.com');
  end if;

  if exists (select 1 from information_schema.tables where table_schema='public' and table_name='team_typing_status') then
    delete from public.team_typing_status
    where lower(coalesce(user_email,''))=lower('afinch2678@gmail.com')
       or lower(coalesce(to_email,''))=lower('afinch2678@gmail.com');
  end if;

  if exists (select 1 from information_schema.tables where table_schema='public' and table_name='payment_promises') then
    update public.payment_promises
    set employee_email = null,
        assigned_to_email = null,
        created_by_email = null,
        processed_by_email = null,
        updated_at = now()
    where lower(coalesce(employee_email,''))=lower('afinch2678@gmail.com')
       or lower(coalesce(assigned_to_email,''))=lower('afinch2678@gmail.com')
       or lower(coalesce(created_by_email,''))=lower('afinch2678@gmail.com')
       or lower(coalesce(processed_by_email,''))=lower('afinch2678@gmail.com');
  end if;
end $$;

-- 4) Make sure demo users are the only intended demo users.
insert into public.app_users
  (email, role, approval_status, is_approved, is_active, created_at, updated_at, last_seen_at)
select
  'demo-admin@copilotdemo.com', 'admin', 'approved', true, true, now(), now(), now()
where not exists (
  select 1 from public.app_users where lower(email)=lower('demo-admin@copilotdemo.com')
);

update public.app_users
set role='admin',
    approval_status='approved',
    is_approved=true,
    is_active=true,
    updated_at=now()
where lower(email)=lower('demo-admin@copilotdemo.com');

insert into public.app_users
  (email, role, approval_status, is_approved, is_active, created_at, updated_at, last_seen_at)
select
  'demo-employee@copilotdemo.com', 'employee', 'approved', true, true, now(), now(), now()
where not exists (
  select 1 from public.app_users where lower(email)=lower('demo-employee@copilotdemo.com')
);

update public.app_users
set role='employee',
    approval_status='approved',
    is_approved=true,
    is_active=true,
    updated_at=now()
where lower(email)=lower('demo-employee@copilotdemo.com');

notify pgrst, 'reload schema';

-- Verification:
select email, role, approval_status, is_approved, is_active
from public.app_users
order by email;
