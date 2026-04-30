# Supervisor Conversation Controls (Monitor, Assign, Transfer, Force Close)

**Category:** Supervisor Experience
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../enable-monitor-assign-transfer-conv](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-monitor-assign-transfer-conv)

## What it does
Grants supervisors the ability to directly act on live conversations: silently monitor, reassign to another rep, transfer to a queue or rep, or force-close a stuck conversation. Each capability is an independent toggle. Supervisors exercise these controls via the Ongoing Conversations dashboard in Copilot Service workspace.

## Key facts
- Four independent toggles: **Supervisor Monitor**, **Supervisor Assign**, **Supervisor Transfer**, **Force Close**
- All are **off by default** — must be explicitly enabled
- Enabled at: Copilot Service admin center → Operations → Insights → Ongoing conversation insights → Manage
- **Omnichannel supervisor role must be directly assigned to the user** — team-based role assignment does not work for these permissions
- Force Close applies to both voice and messaging — no channel-specific scoping
- Dashboard access (Ongoing Conversations) is a separate configuration from the permission toggles — both must be done

## When to use / skip
Enable all four for supervisor roles unless there is a specific operational reason not to. Force Close is the most sensitive — scope it to senior supervisors if the client wants tighter control.

## Configuration decisions
- Whether to enable Force Close for all supervisors or restrict it to senior roles — note: this is a global toggle, not per-role; restriction is done via process/policy rather than system config

## Gotchas
- **Role must be directly assigned, not via team.** Team-based role assignments work for most D365 features but not for Omnichannel supervisor permission inheritance. Verify direct role assignment during UAT.
- **Enabling the toggles alone is not enough.** Supervisors also need access to the Ongoing Conversations dashboard to use these controls. Both the toggles and the dashboard access must be configured — see `feature-supervisor-conversation-controls.md` for the combined setup.
- **Force Close has no confirmation prompt** in some channel contexts — supervisors should be trained on when and how to use it before go-live.

---

*Source last updated: 2025-06-17 | Review when: New supervisor action types added, or Force Close becomes per-channel configurable*
