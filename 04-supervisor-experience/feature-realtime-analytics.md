# Real-Time Analytics Reports

**Category:** Supervisor Experience
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../enable-realtime-analytics-dashboard-administrator](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-realtime-analytics-dashboard-administrator)

## What it does
Live metrics for supervisors showing the current state of the contact centre: conversations in progress, queue backlogs, agent availability, bot activity. Reports are continuously updated and accessed from Copilot Service workspace. Enabled by default — no setup required for OOB roles.

## Key facts
- **Enabled by default** for System Administrator, Omnichannel Administrator, Omnichannel Supervisor, Analytics Reports author, CSR Manager
- Reports available: Summary, Voice, Bot, Agent, Ongoing conversation, Backlog conversation
- **Intent group** and **User group** reports: Contact Center only (not Customer Service)
- Voice real-time analytics is a **separate checkbox** — not enabled automatically when you configure the voice channel
- Bot report requires a bot/AI agent to be configured first
- **Customised Copilot Service workspace apps** require manual App Designer navigation steps — reports don't appear automatically in customised apps

## When to use / skip
Standard in any supervisor deployment. Real-time analytics gives supervisors the visibility to use the conversation controls (monitor, assign, transfer) effectively. Visibility and action are separate — enabling reports doesn't grant conversation control permissions; see `feature-supervisor-controls.md`.

## Configuration decisions
- Which add-on options to activate: voice analytics, intent group (CC only), bot analytics — activate all that are relevant to deployed channels
- Custom role access — if non-standard roles need report access, configure via analytics and dashboards user access settings

## Gotchas
- **Voice real-time analytics must be explicitly enabled** even after the voice channel is configured. It's a separate checkbox in Operations → Insights → Real-time Analytics. Easy to miss at go-live.
- **Customised app navigation.** If the Copilot Service workspace app has been customised at all, the reports won't appear in the nav without the App Designer steps. Check whether the app has been customised before go-live testing.

---

*Source last updated: 2026-02-19 | Review when: New report types added, or Contact Center-specific reports change*
