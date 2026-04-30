# Presence and Custom Presence

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../presence-custom-presence](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/presence-custom-presence)

## What it does
Controls rep availability for work assignment. Each presence status has a **base status** (routing-relevant) and **presence text** (label shown to the rep). Routing only assigns work to reps whose base status matches the workstream's Allowed Presences. Custom presence statuses can be created for operational labels that map to standard base statuses.

## Key facts
- Base statuses: Available, Busy, Busy-DND (Do Not Disturb), Away, Offline
- **Only base statuses can be configured in Allowed Presences on a workstream** — custom statuses route through their mapped base status
- **Inactive** status is system-managed (set when rep misses notifications with missed-notifications feature enabled) — not manually selectable
- OOB statuses (Available, Away, Busy, Busy-DND, Offline) cannot be edited or deleted
- **Busy-DND** is automatically set when a capacity profile's Assignment Blocking limit is reached — overrides manual rep selection
- Default presence is set per user on the Omnichannel tab; if not configured, defaults to **Available**

## When to use / skip
Always relevant — presence is core to routing. Custom presence statuses are useful for operations teams that want meaningful labels (e.g. "Away – Training", "Away – Lunch") for supervisor dashboards without changing routing behaviour.

## Configuration decisions
- **Custom status base status mapping** — the most critical decision; must logically reflect the intended routing behaviour; "Away – Training" should map to Away, not Available
- **Which custom statuses to create** — define the complete taxonomy before building; ad-hoc additions over time create inconsistent presence data
- **Default presence per user type** — Available for standard reps, Busy for supervisors who manage their own availability

## Gotchas
- **Wrong base status mapping is silent and harmful.** A "Training" status mapped to Available will route work to agents in training. Review every mapping before go-live.
- **Allowed Presences on workstreams must be reviewed alongside custom presence.** Creating a custom "Busy – Admin" status mapped to Busy means nothing if the workstream excludes Busy from Allowed Presences.
- **Capacity profile Assignment Blocking forces Busy-DND automatically.** Supervisors seeing unexpected Busy-DND on a rep's status should check whether a capacity profile limit was hit, not assume a system error.

---

*Source last updated: 2025-06-11 | Review when: New base statuses added or presence API behaviour changes*
