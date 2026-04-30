# Holiday Configuration

**Category:** Administration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/create-holiday-schedule

## What it does
Holiday schedules define dates when your contact center is closed or operating under modified hours, overriding the standard Operating Hours configuration. When a holiday is active, routing rules treat the queue as "closed" and overflow conversations to alternate queues, or escalate to supervisor queues, depending on your routing rules. Each Operating Hours record can have one associated holiday schedule; holidays must be re-entered annually.

## Key facts
- Holiday schedules are linked to Operating Hours records; you cannot apply a holiday globally across all queues
- A holiday date disables all normal queue operations for that day; conversations are routed to overflow queues only
- Holiday schedules support partial-day closures (e.g., 8 AM–12 PM closed, 1 PM–5 PM open) via multiple Holiday Entry records
- Holidays must be manually entered each year; there is no recurring holiday automation
- If you have multiple Operating Hours records for different regions or languages, you must link a separate holiday schedule to each
- A conversation that arrives at 4:59 PM on a holiday-closing day will be routed normally; holiday rules apply to NEW conversations, not in-flight ones
- Holiday schedules do not adjust agent schedules or time off; they only affect customer-facing routing

## When to use / skip
Use holiday schedules for all public holidays and company-specific closures (e.g., annual maintenance, training days). Define holidays at the time of queue creation to avoid surprise routing gaps. Skip hardcoding holiday overflow in routing rules—use the holiday schedule + routing combination. Re-enter holidays annually; build this into your Q4 planning process to avoid Jan 1 surprises.

## Configuration decisions
- Create one master holiday schedule per region/timezone and link it to all Operating Hours in that region
- Define holiday entries as full-day closures for standard holidays; use partial-day entries for half-day closures or early closes
- Link holiday schedule to the "primary" Operating Hours record; ensure alternate hours (e.g., night shift) have a separate holiday schedule if they differ
- Set overflow queues for each holiday (e.g., Thanksgiving -> Senior Supervisor queue) or use a triage rule to redistribute conversations
- For multi-timezone deployments, create separate holiday schedules for each timezone (US Holidays, EU Holidays, APAC Holidays)
- Document the annual holiday-entry deadline (e.g., last day of October for next calendar year)

## Gotchas
- Holiday schedules are linked to ONE Operating Hours record; if you have 5 queues with 5 different Operating Hours, you need 5 separate holiday schedules
- Changing a holiday schedule after it has already passed a holiday date does not re-process conversations routed on that holiday
- Partial-day holidays (e.g., 8 AM–12 PM closed) require manual entry of all time blocks; there is no "recurrence" option
- If a holiday schedule is not linked to an Operating Hours record, the holiday has no effect; this is a common source of routing misconfiguration
- Deleting a holiday schedule does not delete the Operating Hours record, but removing the link disables holiday routing for that queue
- Holiday schedules apply only to customer-facing routing; agent shift management and scheduling tools do not auto-recognize holidays

---

*Source last updated: 2026-04-30 | Review when: Your organization adds new public holidays or changes calendar structure*
