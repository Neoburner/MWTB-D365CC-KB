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
Turn this on as part of WFM go-live — it's what makes schedules actually matter for routing. Without it, schedules exist but don't affect work assignment. Wait until shift schedules are published before enabling.

## Configuration decisions
None beyond the enable toggle — routing behaviour derives from published shift bookings and approved time-off records.

## Gotchas
- **Don't enable before schedules are published.** Enable too early and reps with no shift booking get locked out of routing entirely. Publish at least one full week of shifts in production before you flip the toggle.
- **Test with one rep first.** Pick a test user with a known shift, verify work blocks outside shift hours, then roll out.
- **Time-off auto-blocking is the win here.** Show this in the handover: approve time-off → rep automatically disappears from routing for that period.

---

*Source last updated: 2025-04-14 | Check this if: Shift-based routing rolls out to embedded, or WFM routing integrations expand*
