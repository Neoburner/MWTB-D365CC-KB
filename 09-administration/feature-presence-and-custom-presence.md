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
- **Review Allowed Presences on workstreams alongside custom presence.** Creating a custom "Busy – Admin" status mapped to Busy means nothing if the workstream excludes Busy from Allowed Presences.
- **Capacity profile Assignment Blocking forces Busy-DND automatically.** If supervisors see unexpected Busy-DND on a rep, check whether a capacity profile limit was hit.

## Consultant notes

- Agree the custom presence taxonomy with the client's operations team before building anything — and confirm the base status mapping for each one is correct. "Training", "Admin", "Break", and "Lunch" as custom labels all have clear intended routing behaviour, but that mapping needs to be explicit, not assumed. A training status mapped to Available is the kind of mistake that surfaces in the first week of go-live when agents in training keep receiving work items.
- Review custom presence statuses alongside workstream Allowed Presences in the same session. Both settings affect routing eligibility and they interact directly. Creating a full set of meaningful custom statuses without checking whether the relevant base statuses are permitted on each workstream produces a presence model that looks correct but doesn't behave as expected.
- The custom presence taxonomy needs to be documented in the operational handover, not just the technical build guide. Supervisors need to understand what each custom status means for routing eligibility — particularly for statuses like "Busy – Wrap-up" or "Busy – Admin" where the intent is to temporarily block assignment without the rep being formally unavailable.

---

*Source last updated: 2025-06-11 | Check this: New base statuses added or presence API behaviour changes*
