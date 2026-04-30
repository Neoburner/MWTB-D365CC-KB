# WFM Setup and Installation

**Category:** Workforce Engagement
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../wfm-package-installation](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/wfm-package-installation)

## What it does
Workforce Management is a separate installable Dynamics 365 App, not included in the base Contact Center install. This covers the installation and user configuration steps that are prerequisites for all WFM features.

## Key facts
- Installed via Power Platform admin center → Environments → Resources → Dynamics 365 Apps → **Workforce Management for Customer Service**
- After installation, **Workforce management** section appears in Copilot Service admin center under Operations
- **Standalone only** — not available in embedded deployments
- User setup sequence: assign Omnichannel roles (Supervisor or Agent) → create/assign skills → create **Bookable Resource** per rep → configure work hours
- **One Bookable Resource record required per representative** — without it, scheduling, shift assignment, and shift-based routing won't function
- Bookable resource time zone must match the rep's actual working time zone — critical for distributed teams

## When to use / skip
Required for any deployment that includes WFM scheduling, forecasting, capacity planning, or shift-based routing. Skip if the client has no WFM scope — the package adds no value without active use.

## Configuration decisions
- **Bookable resource time zone** — must reflect the rep's real working time zone, not server time zone
- **Skills configuration** — must be done before scheduling is meaningful; skills drive shift activity matching

## Gotchas
- **WFM is not included in base Contact Center.** Clients sometimes assume it is. Confirm licensing and scope this as a deliberate installation step in the project plan.
- **Bookable Resource is the most commonly missed prerequisite.** It is separate from having a D365 user account. Every rep who will be scheduled needs one. Build bookable resource creation into the onboarding runbook.
- **All other WFM features depend on this setup being complete first.** Forecasting, schedule management, shift-based routing — none work without the WFM package and correct user configuration in place.

---

*Source last updated: 2026-04-27 | Review when: WFM package becomes available in embedded deployment, or installation process changes*
