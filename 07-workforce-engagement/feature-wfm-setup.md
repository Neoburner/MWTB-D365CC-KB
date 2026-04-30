# WFM Setup and Installation

**Category:** Workforce Engagement
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../wfm-package-installation](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/wfm-package-installation)

## What it does
WFM is a separate installable app — not bundled with Contact Center. You'll need to install it explicitly and configure user access before any WFM features work.

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
- **WFM doesn't ship with Contact Center.** Clients usually assume it does. Confirm licensing and add installation as a line item in the project plan.
- **Bookable Resource is the killer gotcha.** It's separate from a D365 user account. Every scheduled rep needs one. Bake it into your user onboarding runbook.
- **Everything else depends on this setup working first.** Forecasting, scheduling, shift-based routing — none of it runs without the WFM package and proper user config.

---

*Source last updated: 2026-04-27 | Check this if: WFM becomes available for embedded, or the installation flow changes*
