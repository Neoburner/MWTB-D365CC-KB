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

## Consultant notes

- The Topics report is underused on almost every deployment. Most clients focus on the Summary and Agent dashboards, which are straightforward KPI views. Topics clusters cases by AI-identified theme without any tagging effort from the team — point the operations or knowledge manager at it explicitly and show them what it produces. It's the fastest way to find recurring issue patterns that should either be resolved upstream or turned into knowledge articles.
- If the client has built a custom Copilot Service workspace app (common for branding or simplified layouts), the App Designer navigation step is easy to miss. Check whether reports appear in the workspace menu during UAT for each custom app, not just the default workspace.
- Enable this alongside Omnichannel historical analytics from the start. They cover different data (cases vs. conversations) and neither replaces the other. Clients who think they only need one typically realise mid-deployment that they need both to see the full picture.

---

*Source last updated: 2026-01-23 | Check this if: New CS analytics report types ship*
