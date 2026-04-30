# Capacity Profiles

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../capacity-profiles](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/capacity-profiles)

## What it does
Defines how many and what type of work items a rep can hold simultaneously. Profiles replace the older unit-based capacity model. Multiple profiles can be assigned to a single rep (e.g. separate daily caps for high-priority and normal-priority work, plus an overall total cap).

## Key facts
- Settings per profile: work item limit, reset frequency (Immediate or End of day), assignment blocking (Yes/No)
- **Reset frequency cannot be changed after creation** — must delete and recreate to change it
- Assignment blocking = Yes sets the rep's presence to Busy-DND when limit is reached; blocks all further auto-assignment including unit-based
- Custom per-rep limits override the profile default — set via Enhanced User Management → Update user attributes; changes take **up to 15 minutes** to sync
- Profile attaches to work items via workstream default or via classification ruleset output (enables multi-profile matching)
- **Escalation profile:** system-managed, activates automatically when a chat is escalated to voice/video; cannot be edited
- Capacity release timing: conversation — when rep closes and ends session; case — when resolved/cancelled or removed from Worked By; record/activity — **not automatic**, must deactivate queue item or clear Worked By
- Supervisor can manually assign beyond capacity; negative capacity values are valid

## When to use / skip
Use capacity profiles for all new implementations. Unit-based capacity is the legacy model — don't mix them in the same org.

## Configuration decisions
- Reset frequency: **Immediate** for real-time channels (chat, voice) where throughput matters; **End of day** for case-based work where daily volume caps are meaningful
- Whether to use multi-profile matching (Total + Specific profiles) — powerful for tiered service but adds setup complexity; worth it if the client has VIP/Standard or different case complexity levels
- Custom per-rep limits — useful for ramp-up/onboarding scenarios without creating separate profiles per tier

## Gotchas
- **Reset frequency is permanent at creation.** If the client confirms the wrong type and you don't catch it, you'll be recreating profiles, reassigning users, and retesting. Confirm in UAT before assigning to live agents.
- **Record/activity capacity doesn't release automatically.** Reps and supervisors must know to deactivate the queue item or clear the Worked By field — this is rarely intuitive and often missed in training.
- **Don't mix capacity profiles and capacity units in the same org.** Behaviour becomes unpredictable.

---

*Source last updated: 2026-02-03 | Review when: Reset frequency becomes editable or new capacity management options released*
