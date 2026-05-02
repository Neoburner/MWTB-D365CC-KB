# Callback (In-Queue & Scheduled)

**Category:** Voice Features
**Applies To:** Standalone / Embedded
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-callback-number

## What it does
Callback allows customers waiting in a voice queue to request a callback instead of staying on hold. The system can trigger an in-queue callback automatically when wait time exceeds a threshold, or customers can request a scheduled callback for a future time. When it's time to call back, D365 dials the customer and connects them to an available agent.

## Key facts
- Callback workstream must be enabled and configured in the inbound call flow before customers can request it
- In-queue callbacks trigger automatically based on a configurable wait-time threshold (e.g., after 3 minutes)
- Scheduled callbacks let customers choose a date and time; the system must have capacity available
- Callback requests consume a "callback slot" (configurable limit per queue); exceeding the limit queues additional callbacks
- Outbound callback calls count against agent capacity and concurrent call limits just like inbound
- Callback dialling uses the main DID (cannot be agent extension) for caller ID
- If the customer doesn't answer the callback, the system leaves no voicemail; callback is considered failed and not retried automatically
- Callback integration with voice workstreams requires Power Automate trigger and agent assignment logic

## When to use / skip
Use callbacks if you've got traffic spikes, seasonal peaks, or average hold time over 2 minutes. They cut abandonment and CSAT improves. Skip if you always have agents ready or don't have outbound dialling capacity to spare.

## Configuration decisions
- **Wait-time threshold** — When do you offer callback? (30 sec to 10 min typical).
- **Callback slot limit** — How many pending callbacks before you stop accepting them per queue? (50–200 common).
- **Callback message** — What does the customer hear when offered a callback.
- **Scheduled callback window** — Business hours and slot availability (next day, 10am–5pm only, etc.).
- **Retry logic** — Does callback retry once, multiple times, or just abandon if the customer doesn't answer.
- **Priority** — Do new callbacks jump ahead of new inbound calls or queue at the back.
- **Agent assignment** — Route back to the original agent or use standard queue assignment.

## Gotchas
- **Callback requests die if the customer hangs up before confirming.** No partial confirmation recovery.
- **Scheduled callbacks only happen during the call.** Customers can't pre-book self-service without custom Power Automate.
- **Invalid customer numbers fail silently.** No error alert to agents or supervisors.
- **Slots are per-queue.** 10 queues with a 100-slot limit = 1,000 total callbacks possible. Easy to not realise you've blown past capacity.
- **Callback prompts use text-to-speech.** Custom audio requires ACS recording setup.
- **Agent unavailability orphans callbacks.** If the assigned agent goes unavailable, the callback may hang or auto-reassign. Clarify how this works.
- **Callback reporting is custom.** Abandonment rates, completion rates — not in the standard dashboards. You'll build them yourself.

## Consultant notes

- Callback reporting requirements always surface in UAT, usually as a surprise. Scope them during requirements — standard dashboards don't cover abandonment or completion rates, so if the client wants those, it's a custom Power BI build. Better to know that in advance.
- The invalid number silent failure is worth a specific mention during client handover. They need a process for validating customer numbers before they hit the queue — otherwise failed callbacks just disappear with no visibility.
- Callback slot limits are per-queue, which means the mental model of "we've got capacity" can be wrong if you've got multiple queues all sharing assumptions. Worth walking through the maths with the client during design.

---

*Source last updated: 2026-04-30 | Worth revisiting if callback automation expands or Copilot Agents integrate with callback*
