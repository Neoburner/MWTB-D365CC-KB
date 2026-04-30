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
Use callbacks in high-traffic periods, seasonal spikes, or when average hold time exceeds 2 minutes. Callbacks improve CSAT by reducing abandonment and freeing queue space. Skip if your contact centre operates on-demand (always agents available) or if callback infrastructure (outbound calling capacity) is not available.

## Configuration decisions
- **Wait-time threshold:** Set the minimum hold time before offering callback (30 sec to 10 min range typical)
- **Callback slot capacity:** Limit the number of pending callbacks to avoid overwhelming outbound calling (common: 50–200 per queue)
- **Callback message:** Customize what the customer hears when offered a callback
- **Scheduled callback window:** Define business hours and allowed slots (e.g., next business day, 10am–5pm only)
- **Retry logic:** If callback fails, decide whether to retry once, multiple times, or abandon
- **Callback priority:** Decide if new callbacks queue ahead of new inbound calls or go to the back of the queue
- **Agent assignment:** Route callbacks to the agent who took the original request or use standard queue assignment

## Gotchas
- Callback requests are lost if the customer hangs up before confirming; no partial confirmation logic
- Scheduled callbacks must be confirmed *during* the call; customers cannot pre-book via self-service without Power Automate custom logic
- Callback dialling fails silently if the customer number is invalid; no error notification to agents or supervisors
- Callback slots are per-queue; if you have 10 queues, each gets its own callback pool (total 10x the configured limit)
- Callback messages are played from text-to-speech; custom audio for callback prompts requires ACS recording configuration
- If an agent is assigned to a callback and goes unavailable, the callback may be orphaned or automatically reassigned—clarify agent-to-callback binding
- Callback analytics (abandonment, callback completion rate) must be tracked via custom reporting; not surfaced in standard dashboards

---

*Source last updated: 2026-04-30 | Review when: Callback automation features expand or callback integration with Copilot Agent launches*
