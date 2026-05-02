# Holiday Configuration

**Category:** Administration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/create-holiday-schedule

## What it does
Holiday schedules define dates when your contact centre is closed or operating under modified hours, overriding standard Operating Hours. When a holiday is active, routing rules treat the queue as "closed" and overflow conversations to alternate queues or escalate to supervisors. Each Operating Hours record gets one holiday schedule; holidays must be re-entered annually.

## Key facts
- Holiday schedules are linked to Operating Hours records; you cannot apply a holiday globally across all queues
- A holiday date disables all normal queue operations for that day; conversations are routed to overflow queues only
- Holiday schedules support partial-day closures (e.g., 8 AM–12 PM closed, 1 PM–5 PM open) via multiple Holiday Entry records
- Holidays must be manually entered each year; there is no recurring holiday automation
- If you have multiple Operating Hours records for different regions or languages, you must link a separate holiday schedule to each
- A conversation that arrives at 4:59 PM on a holiday-closing day will be routed normally; holiday rules apply to NEW conversations, not in-flight ones
- Holiday schedules do not adjust agent schedules or time off; they only affect customer-facing routing

## When to use / skip
Use holiday schedules for all public holidays and company-specific closures. Define them at queue creation to avoid routing gaps. Don't hardcode holiday overflow in routing rules, use the holiday schedule + routing combination. Re-enter holidays annually; build it into Q4 planning to avoid Jan 1 surprises.

## Configuration decisions
- Create one master holiday schedule per region/timezone and link it to all Operating Hours in that region
- Define holiday entries as full-day closures for standard holidays; use partial-day entries for half-day closures or early closes
- Link holiday schedule to the "primary" Operating Hours record; ensure alternate hours (e.g., night shift) have a separate holiday schedule if they differ
- Set overflow queues for each holiday (e.g., Thanksgiving -> Senior Supervisor queue) or use a triage rule to redistribute conversations
- For multi-timezone deployments, create separate holiday schedules for each timezone (US Holidays, EU Holidays, APAC Holidays)
- Document the annual holiday-entry deadline (e.g., last day of October for next calendar year)

## Gotchas
- Holiday schedules link to ONE Operating Hours record. Five queues with five different Operating Hours means five separate holiday schedules.
- Changing a holiday schedule after a holiday date has passed doesn't re-process conversations routed on that holiday.
- Partial-day holidays (8 AM–12 PM closed) require manual entry of all time blocks; there's no recurrence option.
- If a holiday schedule isn't linked to an Operating Hours record, it has no effect. Common routing misconfiguration.
- Deleting a holiday schedule doesn't delete the Operating Hours record, but removing the link disables holiday routing for that queue.
- Holiday schedules apply only to customer-facing routing. Agent shift management and scheduling tools don't auto-recognize holidays.

## Consultant notes

- The one-schedule-per-Operating-Hours-record rule creates more maintenance overhead than clients expect in multi-region deployments. An EMEA client with separate UK, German, and French holiday calendars needs three separate holiday schedules maintained annually. Make sure the client's operations team understands this at handover: the volume of manual entry required is not obvious from the configuration screen.
- Establish the annual update deadline in the handover documentation rather than leaving it as a general reminder. "Update before end of October for the following year" gives whoever inherits the system a concrete target. Without it, the update happens in mid-December under time pressure or gets missed entirely.
- If the client uses WFM scheduling, note explicitly that holiday schedules only affect customer-facing routing: they don't automatically feed into WFM shift plans or agent scheduling. If a public holiday means reduced staffing, the WFM side still needs to be updated separately. This is particularly relevant for deployments where both routing and WFM are in scope.

---

*Source last updated: 2026-04-30 | Check this: Your organisation adds new public holidays or changes calendar structure*
