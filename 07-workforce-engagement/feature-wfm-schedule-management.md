# WFM Schedule Management

**Category:** Workforce Engagement
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../wfm-enable-schedule-management](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/wfm-enable-schedule-management)

## What it does
Suite of WFM scheduling features: schedule creation and publishing, shift bidding, shift swapping, shift activity types, representative calendar, and time-off request management. Each sub-feature is enabled independently via toggle.

## Key facts
- All features require WFM package installed and user management configured (`feature-wfm-setup.md`)
- **Standalone only**
- **Schedule acceptance deadline:** if a rep doesn't accept/reject within the configured days, the schedule auto-rejects — set this generously for initial rollouts
- **Shift activity types require Duration to be set** or they won't appear in shift plans
- **Shift swapping:** configurable expiry (days) after which swap requests lapse
- **Time-off requests:** reps must be assigned to the correct manager before requests work
- **Representative calendar:** single unified view of all shift activities — enable early so reps can orient to WFM-managed scheduling from day one

## When to use / skip
Enable the full suite on any deployment where the client wants WFM-managed scheduling with rep self-service. Individual toggles allow phased rollout — schedule management first, shift bidding/swapping once the base scheduling cadence is established.

## Configuration decisions
- **Schedule acceptance deadline (days)** — how long reps have to accept their schedule; shorter = more supervisor interventions; 3–5 business days is a reasonable starting point
- **Shift swap expiry** — how long a swap request can sit open before lapsing; align with shift planning cadence
- **Shift activity type library** — define the standard types (customer-facing, break, training, admin) before building the first shift plan; renaming types after use is disruptive
- **Time-off request types** — must align with the client's HR leave categories; define in consultation with HR before creating records

## Gotchas
- **Activity types must have Duration set.** A named activity type with no duration won't appear in the shift planner. Commonly causes confusion during first shift plan build.
- **Time-off requests silently don't work if manager assignment is missing.** Reps must have a manager assigned on their user record. Check this during user management setup, not after go-live.
- **Auto-reject on acceptance deadline is easy to miss.** If reps are not responding to schedule notifications, schedules will auto-reject and require supervisor re-publication. Monitor acceptance rates in the first weeks post-go-live.

---

*Source last updated: 2026-04-27 | Review when: New WFM scheduling features added, or schedule management UI redesigned*
