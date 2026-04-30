# Bot-to-Agent Escalation (Context Transfer)

**Category:** Self-Service / Integration
**Applies To:** Standalone / Embedded / Both
**Source:** [Integrate a Copilot agent in Dynamics 365 Contact Center - Microsoft Learn](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-bot-virtual-agent)

## What it does
Bot-to-agent escalation transfers a conversation from an automated bot (Copilot Studio, Azure Bot Service, or third-party) to a live human agent in D365 Contact Center, preserving the conversation history, collected variables, and context summary. The agent sees what the bot learned about the customer and can pick up the conversation seamlessly without requiring the customer to repeat information.

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
**Use bot escalation** when you want to filter simple issues through automation first (reduce agent load) while ensuring complex issues reach a specialist without friction. Example: bot collects account info and issue summary, escalates account disputes directly to specialists. **Skip it** if your bot rarely needs escalation (then why use a bot?), or if your contact center needs synchronous, turn-by-turn co-control (agent and bot both active in same conversation—D365 doesn't support that; the bot must hand off completely).

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
- Variable name mismatches: If bot variable names don't exactly match D365 field names, the data won't transfer; validate mapping during testing
- Conversation history not searchable in agent transcript by bot variable: Agent sees bot transcript but cannot filter by bot-collected data; ensure key info is in the summary
- Escalation queues can back up: If bots escalate too eagerly, agents get swamped; monitor escalation rate and adjust bot confidence thresholds
- No automatic re-escalation to bot: Once an agent takes over, the agent owns the conversation; the bot cannot resume if the agent steps away temporarily
- Third-party bot lag: Escalation latency may be higher if the bot runs on external infrastructure; test SLA compliance before production
- Customer context persistence: If the customer's session times out or browser closes during escalation, they may lose their context; ensure graceful reconnection
- Agent availability signal delays: Agent presence status (Available/Busy/Away) can lag 30+ seconds in Contact Center; escalation might reach an unavailable agent, triggering queue delays
- Handoff transcript may be incomplete: If bot crashes or loses connection mid-conversation, parts of the transcript may not reach the agent

---

*Source last updated: 2026-04-30 | Review when: Bot escalation rate exceeds 30% of bot interactions, agent Handle Time increases after escalation, or if queue SLAs are breached*
