# Ongoing Conversations Dashboard

**Category:** Supervisor Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/ongoing-conversations-dashboard

## What it does
The Ongoing Conversations dashboard is the supervisor's live view of every active conversation in the contact centre. It shows all conversations currently in progress, who's handling them, which queue and channel they came through, how long they've been active, and current sentiment. Supervisors can filter, search, assign, and transfer conversations directly from this view without interrupting the agent.

## Key facts
- Shows all conversations with status "Active" or "Waiting" across all queues the supervisor has access to
- Columns: agent name, customer name/ID, queue, channel, status (Active/Waiting), conversation duration, current sentiment, skill tags
- Supervisors can filter by queue, channel, agent, and date: filters persist for the session but reset on page reload
- Assign button on any row lets a supervisor reassign the conversation to a different agent or queue without the agent taking any action
- "Monitor" action opens a supervisor shadow view of the conversation: read-only access to the chat transcript or call (whisper/barge not from this view; use the Real-Time Monitoring dashboard for that)
- Sentiment column shows the most recent sentiment score (positive/neutral/negative) updated in near-real-time
- Refresh is manual (F5 or the refresh button): there is no auto-refresh; supervisors who need a live-updating view should use the Real-Time Monitoring dashboard instead
- Conversation count shown at the top of the grid updates only on manual refresh
- Supervisors see only conversations in queues they have access to via their security role queue membership

## When to use / skip
Use for queue management tasks that need conversation-level granularity: reassigning a specific stalled conversation, checking on a long-duration chat, or pulling up a specific customer interaction. It's not a real-time operations tool, the lack of auto-refresh makes it unsuitable for live floor management. Use the Real-Time Monitoring dashboard (feature-realtime-analytics.md) for live queue KPIs and Intraday Insights for volume trending.

## Configuration decisions
- Grant supervisors access to the relevant queues via the Omnichannel Administrator security role queue assignments: without queue access, supervisors won't see those conversations in the dashboard
- Consider whether all supervisors should see all queues or just their own team's queues: the dashboard doesn't have a per-team view out of the box; scope is defined by queue security
- If supervisors need to assign conversations to specific agents, make sure those agents are members of the target queue: the assign UI only shows agents within the conversation's current queue
- Train supervisors on the difference between this dashboard and Real-Time Monitoring: they serve different purposes and should be used in combination, not interchangeably

## Gotchas
- No auto-refresh. This is the most common supervisor complaint about this dashboard. The conversation list does not update in the background: a conversation that ends won't disappear until the page is refreshed. For fast-moving environments, this is a real limitation. Supervisors who need a live-updating view should use Real-Time Monitoring for the overview and drop into Ongoing Conversations only for individual conversation actions.
- Assign and transfer are different. Assign moves the conversation to a different agent in the same queue. Transfer (if available) re-routes it through routing rules. If the supervisor needs the conversation to go through bot logic or re-queue, transfer is the right action; if they just need a different agent to take it, assign is faster.
- Sentiment is a snapshot, not a trend. The sentiment column shows the current score, not whether it's been declining. A conversation might show as neutral now but have been negative for the last five minutes. For sentiment trending, use the Sentiment Alerts feature (feature-sentiment-alerts.md).
- Supervisors can see conversations but not join them from this view. Read-only monitoring is available via the Monitor action, but whisper or barge requires opening the conversation from the Real-Time Monitoring dashboard. This split-view workflow confuses supervisors who expect to escalate directly from wherever they spot the issue.
- Queue access is governed by security role queue membership, not by the supervisor's team assignment. If a supervisor's team covers multiple queues but their role only includes one, they'll see an incomplete picture. Review queue security assignments as part of go-live readiness.
- The dashboard shows conversations in "Waiting" status (assigned but not yet accepted by the agent) as well as active ones. Supervisors sometimes mistake waiting conversations for a system error when they're actually just unaccepted incoming contacts.

## Consultant notes

- The Ongoing Conversations dashboard is where supervisors spend a lot of time in the first weeks of live operation, usually because they're babysitting the queue while agents find their feet. Set expectations in the supervisor training that it needs a manual refresh: supervisors who don't know this will conclude the dashboard is broken when they see stale data. This is the first thing to show in the supervisor walkthrough: refresh behaviour, what each status means, and where to go for a live-updating view.
- The split between this dashboard and Real-Time Monitoring is a genuine UX gap in the product. Supervisors who want to see a live queue overview and also intervene in individual conversations have to work across two screens. Frame this in handover documentation as "use Real-Time Monitoring for the big picture, Ongoing Conversations for individual conversation management": give them the mental model explicitly rather than leaving them to figure it out.
- Queue access configuration for supervisors is regularly missed in go-live readiness checks. The usual pattern: supervisor can log in, dashboard loads, but shows fewer conversations than expected. Almost always a queue assignment issue. Add "supervisor queue membership verification" to the go-live checklist and test it with a logged-in supervisor account, not just admin confirmation that the role is assigned.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds auto-refresh or real-time update capability to the Ongoing Conversations dashboard*
