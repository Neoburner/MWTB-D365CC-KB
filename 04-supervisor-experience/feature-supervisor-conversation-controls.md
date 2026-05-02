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
- **Both steps are required.** Toggles without dashboard access = can't reach the controls. Dashboard without toggles = can see conversations but can't act. Both must be done.
- **Direct role assignment, not teams.** The Omnichannel supervisor role must be assigned directly to each user — team membership doesn't work here. Catches out deployments that assign roles via teams or security groups.
- **QA programmes need Monitor enabled explicitly.** Supervisor Monitor is the enabler for live call listening and chat monitoring. If you have a QA team, confirm this is on as part of the QA workflow design — it's a separate toggle.

## Consultant notes

- Both steps being required is the most common supervisor control gap. Toggles alone without dashboard access means supervisors can't reach the controls. Dashboard access without toggles means they can see conversations but can't act. Verify both during UAT as a single test scenario.
- Document the operational use case for each control type before go-live, not just the configuration. Supervisors who force-close a live call without understanding the customer impact are a real risk. A one-page "when and how to use each control" guide saves headaches.
- This doc and `feature-supervisor-controls.md` cover the same feature from different angles — they exist as a combined reference precisely because the two-step setup is where implementations go wrong. Use both during handover.

---

*Source last updated: 2026-01-28 | Check this after supervisor controls expand to embedded deployment or new control types are added*
