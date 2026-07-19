CO PILOT COLLECTIONS MANAGER — DEMO PACKAGE

Upload this ZIP only to GitHub repo:
co-pilot-collections-demo

Supabase project locked to:
https://nixqpmgkmrzjsaqhqqew.supabase.co

Before testing, run ALL SQL files in this order:
1. SQL_TO_RUN_IN_SUPABASE/RUN_THIS_MESSENGER_STAFF_NAMES_SQL.sql
2. SQL_TO_RUN_IN_SUPABASE/RUN_THIS_CLIENT_PORTAL_MVP_SQL.sql
3. SQL_TO_RUN_IN_SUPABASE/RUN_THIS_STAFF_APPROVAL_ACTIONS_FIX_SQL.sql
in the matching DEMO Supabase SQL Editor.

Do not upload this package to the LIVE repo.
This package does not alter or point to the LIVE Supabase project.

DOCUMENT PDF + SIGNATURE R3:
- Download PDF creates the receipt/letter from the visible Preview.
- Electronic signature supports mouse, trackpad, stylus, or touch.
- PDF libraries are embedded directly in index.html; no CDN or separate vendor-file request is required.
- No additional Supabase SQL is required for this PDF/signature feature.

R3 BOLT PREVIEW FIX:
- Fixes “The PDF engine did not load” in Bolt preview.
- The PDF engine is decoded from the app itself, so preview does not depend on /vendor paths.

R4 document update: saved app branding is used on receipts/letters; customer-facing Created By is the brand name; typed electronic signature chooser replaces freehand signing. No new SQL is required.


R5 CLIENT / PORTFOLIO OWNER PORTAL MVP:
- Client role and approval workflow.
- Admin assigns portfolio names to client users.
- Client-safe dashboard, accounts, payments, performance, CSV, and PDF report.
- Clients cannot enter collector queue, notes, Messenger, scorecards, compliance, or admin tools.


R7 STAFF ACCESS FIX:
- Approve, Hold/Pending, Reject, Activate/Pause, and Remove now use an admin-only Supabase RPC.
- Fixes action buttons that were blocked by direct table PATCH/RLS behavior.
- Staff controls are compact, status-aware, and display success/error feedback.
- Remove returns assigned accounts to the unassigned queue.

R7 REQUIRED INCREMENTAL SQL:
SQL_TO_RUN_IN_SUPABASE/RUN_THIS_CLIENT_PORTAL_LEDGER_SCHEMA_FIX_R7.sql
Run it in this package's matching Supabase project before client portal testing.


R8 CLIENT REMITTANCE + AGENCY FEE ACCOUNTING:
Run SQL_TO_RUN_IN_SUPABASE/RUN_THIS_CLIENT_REMITTANCE_AGENCY_FEE_R8.sql in this matching DEMO Supabase project before testing.
This release adds fee schedules, remittance batches, batch payment detail, client statements, branded PDF/CSV exports, and processor-fee capture.
Build marker: STABLE_SINGLE_FILE_QA_LOCK_2026_07_19_R8N1


NETLIFY DEPLOYMENT FIX:
- package-lock.json uses only https://registry.npmjs.org/
- .npmrc forces the public npm registry
- netlify.toml sets npm run build and publishes dist


R8N1 SILENT LOGIN STARTUP FIX:
- Removes the duplicate startup boot that could race against an expired or cleared session.
- The logged-out login page no longer displays 'Could not load accounts: Not logged in.'
- Real account-loading errors still display after authentication.
- No Supabase SQL is required for this fix.
