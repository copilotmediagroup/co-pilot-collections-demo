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
Build marker: STABLE_SINGLE_FILE_QA_LOCK_2026_07_19_R8N2


NETLIFY DEPLOYMENT FIX:
- package-lock.json uses only https://registry.npmjs.org/
- .npmrc forces the public npm registry
- netlify.toml sets npm run build and publishes dist


R8N1 SILENT LOGIN STARTUP FIX:
- Removes the duplicate startup boot that could race against an expired or cleared session.
- The logged-out login page no longer displays 'Could not load accounts: Not logged in.'
- Real account-loading errors still display after authentication.
- No Supabase SQL is required for this fix.


R8N2 DEMO ONE-CLICK ACCESS + IMPORT GUARD:
- Admin Demo button signs in demo-admin@copilotdemo.com automatically.
- Employee Demo button signs in demo-employee@copilotdemo.com automatically.
- Public demo users cannot import CSVs, create new accounts, clear the database, rollback imports, or hard-delete import batches.
- Upgrade dialog explains that portfolio importing requires the full version.
- Run SQL_TO_RUN_IN_SUPABASE/RUN_THIS_DEMO_ONE_CLICK_LOGIN_IMPORT_GUARD_R8N2.sql in DEMO Supabase.
- Confirm both Auth users exist with the passwords documented in that SQL file.
- This feature is DEMO ONLY and must never be copied into LIVE.


========================================================================
PRICING, LICENSING, AND NETLIFY FORM NOTES
========================================================================
CO PILOT COLLECTIONS MANAGER - DEMO IN-APP PRICING + LICENSING LEAD FORM R8N7

This DEMO-only release keeps pricing inside the authenticated demo experience:
- No View Pricing, Pricing PDF, Contact, or sales buttons appear on the public login page
- A highlighted Private Agency Licensing banner appears inside Admin Demo and Employee Demo
- The banner opens the full pricing and licensing screen inside the app
- Starter, Agency, Agency Plus, and Enterprise request buttons open a professional inquiry form
- Contact Sales opens the same form with Contact Sales selected
- The selected plan and listed price are filled automatically
- The form collects agency name, contact name, business email, phone, staff size, account volume, client logins, current software, contact preference, best contact time, and notes
- A honeypot field helps reduce automated spam
- A static hidden Netlify form blueprint is included so Netlify detects the form during deployment
- Successful submissions are stored by Netlify Forms and appear in the Netlify dashboard
- The pricing PDF remains available from the internal pricing page
- The Full Version upgrade dialog still links to the internal pricing page

IMPORTANT - ONE-TIME NETLIFY EMAIL NOTIFICATION SETUP
The form code is already built and named: co-pilot-licensing-inquiry
Netlify requires the site owner to choose the notification email in the Netlify dashboard. This cannot be securely hard-coded into the public website.

After deploying R8N7:
1. Open the DEMO project in Netlify.
2. Trigger a clear-cache production deploy, then open Forms and confirm "co-pilot-licensing-inquiry" appears under Active forms.
3. Go to Project configuration -> Notifications -> Emails and webhooks.
4. Under Form submission notifications, choose Add notification.
5. Select Email notification.
6. Choose the form "co-pilot-licensing-inquiry" or all form submissions.
7. Enter: datamarkethouse@gmail.com
8. Use a subject such as: New Co Pilot Licensing Inquiry
9. Save the notification.
10. Submit one test inquiry from the deployed demo and confirm it appears in Netlify Forms and in datamarkethouse@gmail.com.

No Supabase SQL is required for this feature.
Do not copy DEMO pricing/login scripts or demo credentials into LIVE.
Pricing effective July 2026 and subject to final written agreement.


========================================================================
R8N11 DYNAMIC ACTIVITY + STATISTICS NOTES
========================================================================
CO PILOT COLLECTIONS MANAGER — DEMO R8N11

DYNAMIC ACTIVITY + LIVE STATISTICS UPDATE

WHAT CHANGED
- Clicking any debtor phone number now saves one Call Attempt before the phone application opens.
- The attempt immediately counts in Calls, Call Intelligence, Reports, Monitor, and Scorecards.
- Saving a call outcome updates the same attempt instead of creating a second call.
- Rapid double-click protection prevents duplicate attempts.
- Account opens are logged as Account Opened activity with a 10-minute per-account dedupe window.
- Open analytics screens automatically refresh after saved activity.
- Open analytics screens poll every 12 seconds while visible so admin can see activity from other users.
- Notes, statuses, payment promises, plans, settlements, payments, communications, and other database changes trigger a shared statistics refresh.

REQUIRED SQL
Run this file once in the matching DEMO Supabase project:
SQL_TO_RUN_IN_SUPABASE/RUN_THIS_DYNAMIC_ACTIVITY_STATS_CALL_DEDUPE_R8N11.sql

The SQL is safe to run more than once. It adds atomic call-attempt functions, call counters, dedupe keys, and supporting indexes.

UPLOAD RULE
This package is for DEMO only. Do not mix LIVE and DEMO files or Supabase credentials.

SMOKE TEST
1. Login as an employee.
2. Open an account and click one phone number once.
3. Confirm Call Intelligence shows 1 Call Attempt.
4. Save No Answer or another outcome.
5. Confirm the call total remains 1 and the result changes from Call Attempt to the saved outcome.
6. Open Admin Monitor, Reports, and Scorecards and verify the same call is counted once.
7. In a second browser, create activity and confirm an open admin analytics screen refreshes within about 12 seconds.
