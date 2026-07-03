# Proactive Engagement Dashboard

**Category:** Analytics & Reporting
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/use/proactive-engagement-dashboard

## What it does
A real-time analytics dashboard in Omnichannel that gives supervisors a live view of proactive outbound activity — what's pending, what's in flight, how fast work is clearing, and whether agents are available to take it. It sits alongside the other real-time analytics dashboards, not in historical reporting.

## Key facts

- Lives in Omnichannel real-time analytics, reached from Customer Service workspace — not the historical/outbound analytics area where `feature-voice-analytics.md` lives.
- Needs real-time analytics enabled for proactive engagement, proactive engagement configured, and the Omnichannel Supervisor role.
- Filters: Proactive engagement, QueueName, Time zone, Business unit.
- KPI tiles: total unique engagements pending, total in progress, throughput (deliveries processed in the last hour), time remaining to clear the pending workload at current pace, total completed, abandoned rate, average handle time, connect rate.
- Charts: pending engagements by attempt number, pending per queue, agent availability status (donut), conversation time, and completed engagements broken down by attempt outcome (1st/2nd/3rd attempt, Unreachable).
- Real-time data — no 24-hour lag, unlike the historical proactive outbound analytics.

## When to use / skip
Turn this on if you're running proactive outbound at any scale and a supervisor needs to manage pacing and staffing live. It's the operational counterpart to the historical outbound analytics: this one tells you what to do right now, the historical one tells you how yesterday went. Skip it if you don't run proactive outbound, or if your proactive volume is low enough that a live pacing view adds nothing.

## Configuration decisions

- Decide who gets access — it's Supervisor-role gated, so confirm your supervisors actually hold the Omnichannel Supervisor role and not just a custom variant.
- Set the default time zone and business unit filters to match how the operation is run, so supervisors aren't re-scoping every time they open it.
- Work out where this fits against the historical proactive outbound dashboard in your reporting story, and make sure supervisors know which one answers which question.

## Gotchas

- It's a different dashboard from the historical proactive outbound analytics, and both mention "proactive" — supervisors will confuse them. This is the live one; the throughput and "time remaining" tiles are the giveaway.
- Real-time analytics has to be enabled for proactive engagement specifically. Having general real-time analytics on doesn't light this up.
- "Time remaining" is a pacing estimate at the current rate, not a commitment. Don't let ops treat it as an SLA.
- No data appears until proactive engagement is actually configured and running deliveries, so there's nothing to demo on a cold environment.

## Consultant notes

- The two proactive dashboards catch clients out constantly. During UAT, walk the supervisor team through this live dashboard against the historical one side by side and be explicit that this is the "manage the queue right now" view. If you don't, you'll get support tickets asking why yesterday's completed numbers don't match.
- Enable real-time analytics for proactive engagement early — ideally during UAT — so the dashboard is populated before go-live. Turning it on cold on day one, when proactive volume is highest and supervisors are most stressed, is the wrong time to discover the enablement toggle is separate.
- The abandoned rate and connect rate tiles are the ones operations will actually act on. If proactive is voice-heavy, agree with the client what "good" looks like for those two before go-live, otherwise the first week is spent arguing about whether the numbers are bad or just normal for outbound.

---

*Source last updated: 2026-07-01 | Check this if: real-time analytics changes, or Microsoft consolidates the proactive dashboards*
