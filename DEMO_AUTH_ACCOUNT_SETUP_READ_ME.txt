CO PILOT COLLECTIONS MANAGER — DEMO ONE-CLICK AUTH SETUP

This file is for the DEMO owner only. Do not send these credentials to prospects.
The app's one-click buttons use them automatically.

In DEMO Supabase -> Authentication -> Users, confirm these users exist:

Admin Demo
Email: demo-admin@copilotdemo.com
Password: DemoAdmin123!

Employee Demo
Email: demo-employee@copilotdemo.com
Password: DemoEmployee123!

If either account already exists with a different password, reset it to the password above.
Then run:
SQL_TO_RUN_IN_SUPABASE/RUN_THIS_DEMO_ONE_CLICK_LOGIN_IMPORT_GUARD_R8N2.sql

The SQL approves the profiles and enforces the public-demo account import/create/delete guard.
Never create these accounts or run this SQL in LIVE.


R8N10 ADMIN + EMPLOYEE GUIDED TOURS
- Demo-only guided product tour automatically starts once per browser for Admin Demo and Employee Demo.
- A permanent Tour button appears beside Help after login.
- Help also contains a Start Tour card.
- Completion is stored locally in the visitor browser; no database table or SQL is required.
- Browser-console reset for testing: resetCpcmDemoTours(); then log out and enter the desired demo role again.
- Never copy the public demo tour/login module into LIVE.
