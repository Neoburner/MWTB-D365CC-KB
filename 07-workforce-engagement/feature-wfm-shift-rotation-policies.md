# Shift Rotation Policies

**Category:** Workforce Engagement Management
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/use/workforce-management-shift-rotation-policies

## What it does
Rotates representatives across a set of recurring time slots on a fixed cadence, so the auto-scheduler pulls people from whichever cohort matches the booking time. It's how you get fair, predictable rotation through nights, weekends, and other unpopular slots without hand-building every roster.

## Key facts
- A policy needs between 2 and 24 slots. Each slot has a start/end time and a list of assigned representatives.
- Cadence is set in days — the number of days in one rotation cycle.
- The activation date sets the start of the first cycle and can't be changed once saved. Pick it carefully.
- A representative belongs to only one rotation policy at a time, but can sit in multiple slots within that one policy.
- A shift plan takes one rotation policy; a single policy can be assigned to many shift plans.
- Only the auto-scheduler honours rotation policies. Manual assignments on the schedule board ignore them entirely.
- Edits apply on the next scheduler run — already-generated schedules don't retroactively change.
- Pausing freezes everyone in their current slot; the scheduler keeps drawing from those frozen positions until you resume.

## When to use / skip
If you run 24/7 or extended-hours coverage and want equitable rotation through the graveyard and weekend slots, this is the mechanism you want. Skip it if your coverage is a straightforward fixed-shift pattern — you'll get there faster with standard shift plans and bookings, and rotation policies just add moving parts you don't need.

## Configuration decisions
- Slot count and boundaries — how finely you carve the day drives how often activities get split across cohorts.
- Cadence length — how many days before a representative rotates to the next slot.
- Activation date — locked after save, so agree it before you commit.
- Which representatives sit in the cohort versus stay in the flexible workforce (unassigned to any policy).
- Timezone for the policy — slot times are read in that zone, which matters for multi-region teams.

## Gotchas
- The activation date is immovable once saved. Get it wrong and your only fix is deleting and rebuilding the policy — after first removing it from every shift plan it's attached to, because you can't delete an assigned policy.
- Removing someone from a policy doesn't cancel their existing bookings. They drop into the flexible workforce straight away and only future scheduler runs reflect it — so you'll see a period where old bookings and new rotation coexist.
- When an activity crosses a slot boundary the scheduler splits it into segments, each staffed from that slot's cohort. Supervisors reviewing the board will see one logical shift show up as several tiles.
- Manual board assignments silently bypass the whole policy. If a supervisor drags people around by hand and then wonders why rotation "isn't working", that's why.

## Consultant notes

- The immovable activation date is the thing clients trip over in UAT. Teams treat it like any other editable field, set it during testing, and then can't move it for go-live without a rebuild. Call it out in design and don't let anyone create the "real" policy until the go-live date is locked.
- Scope conversations tend to assume rotation policies replace shift bidding — they don't. Bid-locked representatives sit ahead of the rotating cohort in the scheduler's fill order, so bids and rotation coexist and you need to explain the precedence (bid-locked, then cohort, then flexible, then cross-policy borrow) or supervisors won't trust the roster.
- The "only the auto-scheduler honours this" rule is the post-go-live operational risk. Any site that habitually hand-tweaks the schedule board will erode the rotation without realising it. Set the expectation early that once you're on rotation policies, manual overrides are the exception, not the daily habit.
- Sequencing: this depends on shift plans and the auto-scheduler already being configured and trusted. Don't introduce rotation on a site that's still doing everything manually — get the scheduler bedded in first, then layer rotation on top.

---

*Public preview capability at time of writing — worth revisiting after the next release wave to confirm GA status and whether the pool-resolution and booking-source-visibility behaviours ship as documented.*
