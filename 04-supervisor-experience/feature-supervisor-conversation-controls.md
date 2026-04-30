# Supervisor Conversation Controls — Full Setup Reference

**Category:** Supervisor Experience
**Applies To:** Standalone only
**Sources:** [enable-monitor-assign-transfer-conv](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-monitor-assign-transfer-conv) | [configure-ongoing-conversations-dashbaord](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-ongoing-conversations-dashbaord)

## What it does
Combined reference for the full supervisor intervention capability: enabling the four permission toggles (Monitor, Assign, Transfer, Force Close) **and** configuring access to the Ongoing Conversations dashboard through which supervisors exercise those controls. Both pieces are required — neither alone is sufficient.

## Key facts
- Permission toggles: Supervisor Monitor, Supervisor Assign, Supervisor Transfer, Force Close — all off by default, enabled at Operations → Insights → Ongoing conversation insights
- Dashboard: **Omnichannel Ongoing Conversations** in Copilot Service workspace — the only surface for exercising these controls
- **Omnichannel supervisor role must be directly assigned** — not via team; team-based assignment doesn't satisfy the requirement
- Force Close: ends voice calls and messaging conversations; no channel-specific scoping; single global toggle
- For Unified Service Desk deployments: users must also be added to supervisor configuration in home session app tab settings

## When to use / skip
Required for any deployment where supervisors need to actively manage live conversations — not just observe historical reports. Pair with real-time analytics (see `feature-realtime-analytics.md`) so supervisors can both see the queue state and act on it.

## Configuration decisions
- Permission scope for Force Close — global toggle; if the client wants to restrict it to senior supervisors, that's done via operational policy, not system config
- Document the operational use cases for each control before go-live — assign, transfer, and force close each carry operational risk if used incorrectly

## Gotchas
- **Both steps are required.** Permission toggles without dashboard access = supervisors can't get to the controls. Dashboard access without permission toggles = supervisors see conversations but can't act. Both must be configured.
- **Direct role assignment.** The Omnichannel supervisor role must be assigned directly to each supervisor user record — team membership doesn't work here. This catches out any deployment that assigns roles via teams or security groups.
- **QA programmes need Monitor enabled explicitly.** Supervisor Monitor is the enabler for live call listening/chat monitoring. If the client has a quality assurance team, confirm this is enabled as part of the QA workflow design — it's a separate toggle from everything else.

---

*Source last updated: 2026-01-28 | Review when: Supervisor controls expand to embedded deployment or new control types added*
