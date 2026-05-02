# Queue Health Metrics (Real-Time)

**Category:** Supervisor Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/realtime-reports-summary

## What it does
Queue health metrics are the real-time KPIs that show supervisors the current state of each queue — how many conversations are waiting, how long the longest wait is, how many agents are available, and what the current service level looks like. These metrics appear in the Real-Time Analytics dashboards and are the primary operational signal for whether queues are healthy or need intervention.

## Key facts
- Key queue metrics: conversations waiting (queue depth), average wait time, longest wait time, conversations active, available agents, agents at capacity, abandon rate (if configured)
- Metrics are displayed in the Omnichannel Real-Time Analytics dashboard — separate from the Ongoing Conversations dashboard (which shows individual conversations rather than aggregate queue KPIs)
- Refresh interval: near-real-time with a short polling lag (typically 15–30 seconds)
- Queue metrics are filterable by channel type, date range (today's shifts only — these are real-time, not historical), and specific queue
- Service level metric (% of conversations answered within the target time) appears here if SLA tracking is configured at the queue level
- Queue health metrics feed into the Intraday Insights dashboard for trend analysis within the current operating day
- Historical queue performance (yesterday, last week) lives in the Omnichannel Historical Analytics reports, not here
- Supervisors can drill from queue-level metrics to the list of individual waiting conversations (which opens the Ongoing Conversations view, filtered by that queue)

## When to use / skip
Queue health metrics are the core tool for real-time contact centre management. Any deployment with live channel traffic should have supervisors using this view actively during operating hours. The value is in spotting problems early — a wait time that has doubled in the last 10 minutes, a queue depth that's building while agents are in wrap-up — and intervening before SLAs are breached.

For very low-volume deployments (e.g., internal service desk with 5 agents and 20 contacts a day), formal queue health monitoring is less critical. But it's still useful to have visible.

## Configuration decisions
- Set the default dashboard view to show the queues each supervisor owns — seeing all queues in a large contact centre is overwhelming; scope the view per supervisor team
- Configure threshold indicators or colour-coded alerts if the platform supports them — visual red/amber/green on queue wait time helps supervisors prioritise attention without reading numbers
- Define what "healthy" looks like for each queue — the target wait time, acceptable queue depth, and minimum available agent count — and document these as the operational standards supervisors monitor against
- Enable SLA tracking at the queue level if real-time service level % is needed — this is a separate configuration step in SLA rules (see `feature-sla-tracking.md`)
- Ensure the Real-Time Analytics bot add-on licence is provisioned — without it, bot conversation metrics don't appear and the queue data is incomplete for bot-active deployments

## Gotchas
- Real-time queue metrics and historical analytics are different systems with different data refresh rates and storage. Supervisors who try to use the real-time dashboard to look at yesterday's performance will find they can't — they need to switch to historical analytics for that.
- Queue depth only shows conversations in the queue, not conversations in wrap-up. An agent in a 10-minute wrap-up after a call is not consuming queue capacity but is also not taking new contacts. High wrap-up rates make queue health look better than it is — available agents ≠ agents actively working.
- The longest wait time metric can be misleading if there's a single outlier — one conversation that's been waiting 30 minutes while all others wait less than 2 minutes will show a worst-case "longest wait" that doesn't represent typical queue experience. Supplement with average wait time for a more useful picture.
- Abandon rate is only meaningful if abandonment is tracked. For voice, ACS tracks call abandonment natively. For digital channels, abandonment (customer closes the chat before an agent connects) tracking depends on the channel configuration. If abandon rate shows zero for digital channels, confirm the tracking is actually enabled, not that customers never abandon.
- Queue health metrics don't show why a queue is unhealthy — they show that it is. A building queue could mean not enough agents, high handle time, unexpected volume spike, or agents in the wrong presence state. Interpreting the metric requires supervisors who understand what levers to pull.

## Consultant notes

- Define the operational response matrix for queue health states during the supervisor training. "Queue depth hits X conversations waiting — supervisor does Y" should be documented, not improvised. Without this, different supervisors respond differently to the same queue signal and the contact centre operates inconsistently. The matrix can be simple (three or four scenarios with defined responses) but it needs to exist before go-live.
- The real-time analytics bot add-on licensing catch affects a lot of deployments and isn't obvious until you try to look at bot conversation data in the real-time view and it's blank. Check the licence configuration during the provisioning phase, not at go-live.
- "Healthy queue" definitions should be agreed with the client's operations team in the design phase, not after go-live. The conversation is: "what wait time is acceptable for each queue?" and "at what point should the supervisor escalate?" Without those reference points, supervisors watch numbers change without knowing whether they're looking at a problem or normal variation.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds configurable threshold alerts to the real-time queue dashboard*
