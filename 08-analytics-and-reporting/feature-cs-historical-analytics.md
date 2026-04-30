# Customer Service Historical Analytics

**Category:** Analytics and Reporting
**Applies To:** Standalone + embedded (Customer Service)
**Source:** [learn.microsoft.com/.../configure-cs-historical-analytics-csh](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-cs-historical-analytics-csh)

## What it does
Case-centric analytics reports: Summary, Agent, and Topics. AI-discovered topic clustering groups related cases automatically. Accessible from both Copilot Service workspace and Customer Service Hub. Separate from Omnichannel historical analytics, which covers conversation/channel data.

## Key facts
- Three reports: **Summary** (case volume/resolution KPIs), **Agent** (agent-level case handling), **Topics** (AI-discovered topic clusters)
- Default access: System Administrator and CSR Manager roles; custom roles need Read privilege on `msdyn_dataanalyticsreport_csrmanager` table (see `feature-omnichannel-historical-analytics.md` for role configuration procedure)
- Enabling also activates AI topic clustering from cases with default settings
- Custom/modified Copilot Service workspace apps require manual App Designer navigation entry to expose the reports

## When to use / skip
Turn this on for any Customer Service deployment. Use it alongside Omnichannel historical analytics — CS historical is for case data, Omnichannel is for conversations. Enable both.

## Configuration decisions
- No meaningful configuration beyond the enable toggle; topic clustering runs on default settings automatically

## Gotchas
- **Topics report gets ignored.** AI auto-clusters cases into recurring issues — no tagging needed. Point the ops team at it.
- **Custom apps need App Designer nav.** Without it, reports won't show in the workspace menu.
- **Enable at day one.** Waiting to enable at go-live means zero historical data. Start early.

---

*Source last updated: 2026-01-23 | Check this if: New CS analytics report types ship*
