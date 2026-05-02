# Real-Time Analytics Reports

**Category:** Supervisor Experience
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../enable-realtime-analytics-dashboard-administrator](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-realtime-analytics-dashboard-administrator)

## What it does
Live metrics on queue state, agent availability, active conversations, and bot activity. Reports refresh continuously in Copilot Service workspace. Enabled by default for out-of-the-box roles, no setup needed.

## Key facts
- **Enabled by default** for System Administrator, Omnichannel Administrator, Omnichannel Supervisor, Analytics Reports author, CSR Manager
- Reports available: Summary, Voice, Bot, Agent, Ongoing conversation, Backlog conversation
- **Intent group** and **User group** reports: Contact Center only (not Customer Service)
- Voice real-time analytics is a **separate checkbox**: not enabled automatically when you configure the voice channel
- Bot report requires a bot/AI agent to be configured first
- **Customised Copilot Service workspace apps** require manual App Designer navigation steps: reports don't appear automatically in customised apps

## When to use / skip
Standard in any supervisor deployment. Real-time analytics gives supervisors the visibility to use the conversation controls (monitor, assign, transfer) effectively. Visibility and action are separate, enabling reports doesn't grant conversation control permissions; see `feature-supervisor-controls.md`.

## Configuration decisions
- Which add-on options to activate: voice analytics, intent group (CC only), bot analytics: activate all that are relevant to deployed channels
- Custom role access: if non-standard roles need report access, configure via analytics and dashboards user access settings

## Gotchas
- **Voice real-time analytics must be explicitly enabled** even after you've set up the voice channel. It's a separate checkbox in Operations → Insights → Real-time Analytics. Easy to miss at go-live.
- **Customised apps need manual nav setup.** If the Copilot Service workspace app has been customised, the reports won't appear in navigation without the App Designer steps. Check before go-live testing.

## Consultant notes

- Voice real-time analytics as a separate checkbox is the one to add to your go-live verification checklist. It's not enabled by default when you configure voice, and supervisors sitting in front of a blank voice report section is a common post-go-live surprise.
- Customised workspace apps needing manual App Designer nav setup is the one that bites projects with heavily customised apps. Verify reports appear in the custom app navigation during UAT: don't assume they will.
- Give supervisors training on what the metrics mean, not just where to find them. "High AHT" or a sentiment drop doesn't tell a supervisor what to do. Train the interpretation and the intervention, not just the feature.

---

*Source last updated: 2026-02-19 | Check this after new report types are added or Contact Center-specific reports change*
