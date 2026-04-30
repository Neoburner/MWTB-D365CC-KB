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
Enable on any Customer Service deployment. Pairs with Omnichannel historical analytics — CS historical covers case performance; Omnichannel covers conversation performance. Both should be enabled.

## Configuration decisions
- No meaningful configuration beyond the enable toggle; topic clustering runs on default settings automatically

## Gotchas
- **Topics report is underutilised.** AI-discovered topic clustering from cases identifies recurring issues without manual tagging. No extra configuration required — just point the knowledge/ops team at it.
- **Custom app deployments need the App Designer navigation step.** Without it, the reports won't appear in the workspace menu.
- **Enable on day one.** Historical analytics depends on accumulated data — enabling at go-live starts from zero.

---

*Source last updated: 2026-01-23 | Review when: New CS historical analytics report types added*
