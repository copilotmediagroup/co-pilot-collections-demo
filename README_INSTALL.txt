Co Pilot Collections Manager - DEMO Package

Repo target: co-pilot-collections-demo
Supabase project: https://nixqpmgkmrzjsaqhqqew.supabase.co

This DEMO package includes the clean reporting upgrade plus the existing chat/online-status/payment-desk system.

Included upgrade:
- Admin Reports modal
- Collected dollars today / week / month
- Promises created, promises kept, broken promises
- Collector ranking
- Liquidation rate
- Contact rate and right-party-contact rate
- Portfolio performance
- Employee activity
- CSV export
- Print / Save PDF report

Run in Bolt:
npm install
npm run dev

Important:
- This package is for DEMO only.
- Do not upload this ZIP to the LIVE repo.
- Config URLs use the base Supabase URL only, no /rest/v1/.


COMPLIANCE GUARD UPDATE:
- Run SQL_TO_RUN_IN_SUPABASE/RUN_THIS_COMPLIANCE_GUARD_SQL.sql in the matching DEMO Supabase project.
- The app now adds Compliance Guard / Call Rules: DNC, cease & desist, disputed/frozen, bankruptcy, deceased, attorney represented, wrong number, manager review, consent, call-window checks, daily call limit warnings, and admin override logging.
