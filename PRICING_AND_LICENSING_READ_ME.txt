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
