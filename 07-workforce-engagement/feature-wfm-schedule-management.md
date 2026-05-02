# WFM Schedule Management

**Category:** Workforce Engagement
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../wfm-enable-schedule-management](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/wfm-enable-schedule-management)

## What it does
Suite of WFM scheduling features: schedule creation and publishing, shift bidding, shift swapping, shift activity types, representative calendar, and time-off request management. Each sub-feature is enabled independently via toggle.

## Key facts
- All features require WFM package installed and user management configured (`feature-wfm-setup.md`)
- **Standalone only**
- **Schedule acceptance deadline:** if a rep doesn't accept/reject within the configured days, the schedule auto-rejects: set this generously for initial rollouts
- **Shift activity types require Duration to be set** or they won't appear in shift plans
- **Shift swapping:** configurable expiry (days) after which swap requests lapse
- **Time-off requests:** reps must be assigned to the correct manager before requests work
- **Representative calendar:** single unified view of all shift activities: enable early so reps can orient to WFM-managed scheduling from day one

## When to use / skip
Turn on the full suite if the client wants self-service scheduling. You can roll it out in phases, base scheduling first, then shift bidding/swapping once the rhythm is established.

## Configuration decisions
- **Schedule acceptance deadline (days)**: how long reps have to accept their schedule; shorter = more supervisor interventions; 3–5 business days is a reasonable starting point
- **Shift swap expiry**: how long a swap request can sit open before lapsing; align with shift planning cadence
- **Shift activity type library**: define the standard types (customer-facing, break, training, admin) before building the first shift plan; renaming types after use is disruptive
- **Time-off request types**: must align with the client's HR leave categories; define in consultation with HR before creating records

## Gotchas
- **Activity types need a Duration or they won't show in the planner.** Common headache when building the first shift plan.
- **Time-off requests silently break if manager isn't assigned.** Reps need a manager on their user record. Catch this during user setup, not at go-live.
- **Auto-reject on the acceptance deadline is a snare.** If reps aren't accepting schedules, they auto-reject and supervisors have to re-publish. Watch acceptance rates closely in the first weeks.

## Consultant notes

- Define the shift activity type library before building the first schedule. Customer-facing, break, training, and admin are the standard four: agree these with the client's operations lead and lock them down. Activity type names are visible to reps in the calendar, so "Admin" means something different to a contact centre than it does to corporate IT.
- The acceptance deadline default is aggressive for initial rollouts. Reps who haven't used WFM scheduling before will miss the notification. Set it longer in the first cycle (7+ days), communicate explicitly via their usual channel (Teams, email), and monitor acceptance rates before tightening it.
- Phased rollout works well here: base scheduling first, then add shift bidding and swapping once supervisors are comfortable with the core workflow. Turning everything on at once creates a training overhead that typically results in half the features being ignored.

---

*Source last updated: 2026-04-27 | Check this if: New scheduling features ship, or the UI changes*
