# WFM Shift-Based Routing

**Category:** Workforce Engagement
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../wfm-enable-shift-based-routing](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/wfm-enable-shift-based-routing)

## What it does
Integrates WFM shift schedules with unified routing. When enabled, the routing engine checks a rep's active shift booking before assigning work — preventing assignment to reps who are off-shift, on break, or on approved time off.

## Key facts
- Requires WFM package installed, user management configured, and **shift schedules published** — without active shift bookings, enabling the toggle has no effect
- **Approved time-off blocks routing eligibility** for that period automatically — no manual queue membership adjustment required
- Shift availability becomes an eligibility condition alongside presence, capacity, queue membership, and skills
- Single enable toggle: Copilot Service admin center → Operations → Workforce management → Shift & Schedule Management → **Shift-based routing**
- **Standalone only**

## When to use / skip
Enable as part of the WFM go-live — this is what makes WFM schedules operationally meaningful for routing. Without it, shift schedules are visible to reps but have no effect on work assignment. No value in enabling before shift schedules are published.

## Configuration decisions
None beyond the enable toggle — routing behaviour derives from published shift bookings and approved time-off records.

## Gotchas
- **Enable only after shift schedules are published.** If you enable before schedules exist, representatives with no active shift booking may be excluded from routing entirely. Validate at least one complete week of shift bookings is published before enabling in production.
- **Test with a single rep first.** Enable for a test user with a known shift, verify work is blocked outside shift hours, then roll out to the full population.
- **Time-off auto-blocking is the most demonstrable benefit.** Show the workflow end-to-end during WFM handover: approve time-off → rep removed from routing eligibility during that period automatically.

---

*Source last updated: 2025-04-14 | Review when: Shift-based routing becomes available in embedded deployment, or routing integration with WFM expands*
