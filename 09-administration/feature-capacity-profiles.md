# Capacity Profiles

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../capacity-profiles](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/capacity-profiles)

## What it does
Controls how much work of a given type a rep can be assigned — by work item count, reset timing, and whether hitting the limit blocks all further assignment. Profiles are assigned to reps and linked to workstreams. Recommended over the older capacity units model.

## Key facts
- **Reset frequency cannot be changed after creation** — Immediate (releases on close) or End of day (resets after shift); must delete and recreate to change
- **Assignment blocking (Busy-DND):** when a profile's limit is reached, the rep's presence shifts to Busy-DND and no new work is assigned from any channel
- Multiple profiles can be combined on one rep to enforce type-specific and total-volume limits simultaneously
- **Capacity is not automatically released for record routing activities/emails** — must deactivate the queue item or remove the rep from Worked By field manually
- Custom per-rep limits settable via Enhanced User Management (up to 15 minutes to sync)
- **Do not mix capacity profiles and capacity units** in the same environment
- Out-of-the-box **escalation profile** (for chat-to-voice escalation) cannot be edited or deleted
- Supervisors can override capacity limits for manual assignments
- Negative capacity values can occur from force-assigned or manually picked work items — expected behaviour

## When to use / skip
Use on any deployment with unified routing. Capacity profiles are the standard approach for controlling rep workload. The only reason to use capacity units instead is a legacy migration that hasn't been modernised.

## Configuration decisions
- **Immediate vs. End of day reset** — End of day is better for case routing (prevents unlimited daily assignment); Immediate is better for conversation routing (releases capacity as soon as the chat closes)
- **Assignment blocking (Yes/No)** — mandatory for voice workstreams; a rep on a call must not receive new work
- **Multiple profile combinations** — required for multi-priority or type-tiered workloads; design the combination before building

## Gotchas
- **Reset frequency is permanent.** Get it right at creation — if you don't, you're rebuilding the profile.
- **Record routing capacity doesn't auto-release.** For email/task/record routing, reps accumulate stale items that count against capacity indefinitely. Document the queue item deactivation process in your operational runbook.
- **Assignment blocking forces Busy-DND automatically.** Supervisors and reps may not understand why a rep's status changed without manual action. Brief supervisors on this behaviour before go-live.

---

*Source last updated: 2026-02-03 | Check this: Capacity profile reset options expanded, or automatic capacity release added for record routing*
