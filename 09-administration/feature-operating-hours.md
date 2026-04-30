# Operating Hours

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../create-operating-hours](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/create-operating-hours)

## What it does
Defines when support is available. Attached to queues, chat widgets, and SMS channels to control when they accept work. Outside defined hours, overflow conditions trigger. Also controls AI agent vs. human rep staffing transitions.

## Key facts
- **Operating hours records cannot be migrated via export/import** (Calendar entity limitation) — must be manually recreated per environment
- When attached to a queue: system auto-creates an "Out of operation hours" overflow condition with action "Assign to queue anyway" — **this condition cannot be deleted**, only its action changed
- Daylight saving handled automatically per the selected time zone
- Holidays must be entered individually — no bulk tool
- Chat widget: "Show widget during operation hours" toggle controls visibility; a separate "Show widget outside of operation hours" toggle can display widget with different messaging off-hours

## When to use / skip
Use on any deployment where the contact centre doesn't operate 24/7 or needs to handle off-hours differently. Required for any voice overflow configuration. Skip only for 24/7 operations with no business hours differentiation.

## Configuration decisions
- **One record per distinct schedule** — don't try to merge multiple schedule patterns into one record; global team, regional team, and specialist team each need separate records
- **Chat widget behaviour off-hours** — hide the widget entirely, or show it with an alternative message/self-service option; discuss with client before defaulting to "hide"
- **Holidays** — define the governance process for who maintains the calendar and how public holidays get added each year

## Gotchas
- **Calendar entity cannot be migrated.** This is one of the few Contact Center configurations that must be manually recreated in each environment. Include it explicitly in the UAT-to-production migration checklist.
- **The "Out of operation hours" queue overflow condition is created automatically and cannot be deleted** — only the action can be changed. If you see this condition appearing unexpectedly, it's because operating hours were attached to the queue.
- **Holidays are easy to miss post-go-live.** Without an established process, agents will receive calls on bank holidays because nobody configured the date. Establish ownership during operational handover.

---

*Source last updated: 2026-03-18 | Review when: Calendar entity export/import support added, or operating hours relocated in admin center*
