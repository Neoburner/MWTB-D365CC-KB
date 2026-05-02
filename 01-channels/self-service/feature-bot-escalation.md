# Bot-to-Agent Escalation (Context Transfer)

**Category:** Self-Service / Integration
**Applies To:** Standalone / Embedded / Both
**Source:** [Integrate a Copilot agent in Dynamics 365 Contact Center - Microsoft Learn](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-bot-virtual-agent)

## What it does
Hand off conversations from an automated bot to a live agent in Contact Center, preserving history, variables, and context. The agent sees what the bot learned and picks up seamlessly without the customer repeating themselves.

## Key facts
- Supports handoff from Copilot Studio, Azure Bot Service, and third-party bots via standard escalation patterns
- Conversation transcript automatically passed to agent's Customer Summary
- Custom variables collected by the bot (e.g., account number, issue type, sentiment) mapped to D365 Contact Center records
- Escalation can be triggered by: customer request, bot intent not matched, failure threshold, sentiment threshold, or explicit bot logic
- Agent receives desktop notification indicating bot escalation and sees bot's last interaction
- Queue assignment for escalated conversations can use skill-based routing, priority, or agent availability
- Conversation context preserved in transcript; no need for customer to re-authenticate or re-explain
- Fallback handling: If escalation queue is full or no agents available, bot can retry, queue for callback, or offer self-service alternatives
- Post-escalation: Agent can close the case, reopen with bot, or transfer to another agent
- Handoff latency typically 2-5 seconds depending on network and queue congestion

## When to use / skip
Use escalation to filter simple issues through automation first (reduce agent load) while routing complex issues to specialists without friction. Example: bot collects account info and issue summary, escalates disputes directly. Skip it if the bot rarely escalates (pointless bot), or if you need synchronous co-control where agent and bot both act in the same conversation—D365 doesn't support that. The bot must hand off completely.

## Configuration decisions
- **Escalation trigger logic**: Define bot conditions that mandate escalation vs. those that allow the bot to attempt resolution again
- **Skill routing after escalation**: Map issue type/intent to agent skill groups or queues (e.g., billing issues → billing queue, sales questions → sales queue)
- **Variable mapping**: Specify which bot variables (e.g., customer_id, issue_category) map to D365 Contact Center attributes for agent context
- **Priority boosting on escalation**: Escalated conversations may receive higher priority; configure priority level by issue type
- **Callback options if queue full**: Should bot offer callback, hold in queue, or suggest self-service alternatives?
- **Sentiment threshold**: If available, set confidence level at which negative sentiment triggers automatic escalation
- **Conversation summary template**: Define what info the bot must provide in the handoff summary (e.g., issue, attempts made, recommended resolution)
- **Re-queue threshold**: How many times can an agent reject/requeue the escalation before it goes to supervisor review?

## Gotchas
- Variable name mismatches break data transfer. Bot variables must exactly match D365 field names; validate during testing.
- Bot transcript isn't searchable by bot variables. Agents see transcript but can't filter by collected data; put key info in the summary.
- Escalation queues back up if bots escalate too eagerly. Monitor rate and adjust bot confidence thresholds.
- No automatic re-escalation to bot. Once an agent takes over, they own it; the bot can't resume if the agent steps away.
- Third-party bot lag inflates escalation latency. Test SLA compliance before production.
- Customer context can drop if their session times out during escalation. Design graceful reconnection.
- Agent presence status lags 30+ seconds in Contact Center. Escalations might reach unavailable agents and cause queue delays.
- Handoff transcript can be incomplete if the bot crashes or loses connection mid-conversation.

## Consultant notes

- Variable name mismatch breaking data transfer is the integration defect that's entirely avoidable with a 30-minute mapping exercise. Define the variable-to-D365-field mapping in the design document and verify it with a test transfer in a non-production environment before UAT.
- Escalation rate monitoring is worth building into the client's operational runbook from go-live. If the bot escalates too eagerly, it adds queue load without providing deflection value. If it escalates too rarely, customers get stuck in dead-end loops. Both are fixable once you have the data, but you need monitoring to see it.
- Bot-to-agent handoff UX matters. A smooth escalation where the agent can see what the bot discovered is materially different from a cold transfer where the customer repeats everything. Make sure the handoff summary template is designed and tested as part of UAT, not treated as optional.

---

*Source last updated: 2026-04-30 | Revisit if escalation rate exceeds 30% of bot interactions, agent Handle Time climbs after escalation, or queue SLAs breach*
