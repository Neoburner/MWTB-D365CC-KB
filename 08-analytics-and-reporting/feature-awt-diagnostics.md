# Average Wait-Time Diagnostics

**Category:** Analytics and Reporting
**Applies To:** Standalone / Embedded / Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/use-average-wait-time-diagnostics-wait-time-predictions

## What it does
Adds diagnostic logging, historical analytics, and real-time queue-level visibility for how average wait time (AWT) is computed in Dynamics 365 Contact Center. Supervisors and administrators can troubleshoot incorrect or missing wait-time values without needing Microsoft support.

## Key facts
- Logs AWT diagnostic events to Application Insights at two moments: when a conversation starts and when the availability API returns an AWT value
- Each event includes: channel type, org ID, conversation ID, calculated AWT in seconds, whether AWT was shown to the customer, and the reason if not shown
- Uses an exponential moving average algorithm — more weight to recent conversations, abandoned conversations excluded automatically
- Historical analytics available for AWT accuracy review over time
- Supervisor dashboard gains real-time queue-level AWT values
- Enabled automatically for administrators and supervisors (no opt-in required)
- GA May 2026

## When to use / skip
Reach for this when a client is questioning why AWT values aren't appearing in their chat widget or IVR, or when wait times seem inconsistent. It's also useful if you're setting up overflow rules based on AWT and need to validate that the thresholds are firing correctly. Skip if AWT isn't configured or isn't being surfaced to customers — there's nothing to diagnose.

## Configuration decisions
- Application Insights must be connected to the Contact Center environment to receive diagnostic logs — confirm this is in scope during the analytics architecture conversation
- Decide whether supervisors need the historical AWT accuracy reports and build that into your reporting/training plan

## Gotchas
- The diagnostic logs go to Application Insights, not to the standard analytics dashboards. If the client doesn't have an Application Insights workspace connected, they get nothing — this is a common oversight on implementations that skip the observability setup.
- AWT is computed from the exponential moving average of recently connected conversations. In low-volume queues, the AWT can behave oddly during ramp-up. The diagnostics will show you this happening, but it doesn't fix the underlying thin-data problem.
- The feature surfaces the *reason* AWT wasn't shown to a customer. Make sure you review those reason codes during UAT — clients sometimes configure AWT display logic and then forget they restricted it.

## Consultant notes

- This fills a genuine gap: AWT debugging was previously a black box and required a support ticket. Having the Application Insights events means you can resolve most AWT complaints yourself during hypercare.
- If the client has overflow rules triggered by AWT thresholds, validate them against the diagnostic data in the first week post-go-live. AWT warm-up behaviour catches people out — the queue needs a baseline of conversations before the EMA stabilises.
- Worth including in the Operations Handover Guide: tell the operations team what to search for in Application Insights when AWT goes missing.

---

*Revisit after GA (May 2026) to check whether the historical analytics land in the standard Contact Center reports or require a separate Power BI workspace.*
