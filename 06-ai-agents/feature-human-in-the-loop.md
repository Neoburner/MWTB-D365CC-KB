# Human-in-the-Loop Oversight & Escalation

**Category:** AI Agents (Autonomous)
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/human-in-loop-oversight

## What it does
Human-in-the-loop (HITL) refers to the design patterns and configuration controls that keep human agents or supervisors in the decision chain for autonomous AI agent actions. In D365 Contact Center, this covers: escalation from AI to human agents (the customer-facing handoff), supervisor approval requirements for AI-initiated CRM actions, and the ability for human agents to review, override, or reject AI agent actions before they execute. HITL is not a single toggle — it's a set of design and configuration decisions that define where humans remain in control.

## Key facts
- Customer-facing HITL: the AI agent (Customer Assist Agent) escalates to a human agent based on configured triggers — customer request, intent not recognised, sentiment threshold, or defined failure conditions
- CRM action approval: agentic actions that write to Dataverse (create case, update record, issue refund) can be configured to require human agent confirmation before execution
- Supervisor oversight: supervisors can monitor AI-handled conversations in the Ongoing Conversations dashboard and intervene (take over, escalate, terminate the AI session)
- Escalation context: when the AI agent hands off to a human, conversation context (intent summary, collected entities, bot conversation history) passes to the human agent's Customer Summary
- Agent-facing transparency: human agents can see which AI actions were taken in the conversation transcript before they joined — this is the "explain what the AI did" part of HITL
- Feedback loop: agents can flag AI actions or suggestions that were incorrect — this feeds the AI improvement cycle (see responsible AI feedback in `feature-responsible-ai.md`)
- In Copilot Studio, topic-level outcomes can be configured to require human review before the bot proceeds — this is a bot-side HITL control, separate from the D365 routing layer

## When to use / skip
HITL design is required for every AI agent deployment — not optional. The question is where in the interaction flow the human checkpoints sit and what level of autonomy the AI agent has between them. A fully supervised AI agent (human approves every action) is safe but provides no automation benefit. A fully autonomous AI agent (no human checkpoints) is efficient but creates risk.

The right HITL design depends on the action type: informational AI actions (answer a question, look up account status) need minimal oversight; transactional AI actions (process a return, update a billing record) warrant human confirmation before execution.

## Configuration decisions
- Define the escalation triggers in the AI agent conversation flow — at minimum: explicit customer request, repeated misunderstanding (2–3 turns without resolution), sentiment threshold, and any high-risk topic detection
- For agentic actions: categorise each action by risk level and configure confirmation requirements accordingly — read-only lookups can be autonomous; write actions should have a human confirmation step for the first deployment
- Configure the escalation context payload — what the human agent sees when they inherit a conversation from the AI (intent summary, conversation history, entities collected)
- Set supervisor monitoring capability for all AI-handled queues — supervisors should be able to see and intervene in any live AI-handled conversation
- Document the HITL design as part of the solution design deliverable — each AI action should have a stated autonomy level and the justification for it

## Gotchas
- Escalation trigger design is the most consequential decision in the AI agent build. Triggers that are too sensitive produce high escalation rates (defeating the automation purpose); triggers that are too permissive let the AI handle conversations it shouldn't, risking bad customer outcomes. Test escalation triggers against a representative sample of real historical conversations during design, not just with synthetic test cases.
- Context passing at escalation is configured but often under-tested. The human agent inheriting a conversation needs to see meaningful context, not raw JSON or a blank Customer Summary. Test what the agent actually sees at handoff before training agents on what to expect.
- HITL for agentic actions (AI writing to Dataverse) requires agent training on the approval UI. If agents don't know they need to approve an AI-proposed action, or if the approval prompt is easy to ignore, the HITL control is illusory. Include approval workflow in agent training for all agentic action deployments.
- Regulatory considerations: in financial services, any AI system making or recommending decisions that affect customers may be subject to FCA, SEC, or other regulatory requirements for explainability and human oversight. The client's legal team should review the HITL design against applicable regulations, not just internal risk appetite.
- Supervisor intervention in AI-handled conversations interrupts the AI session — the conversation transitions to human handling. Make sure supervisors understand that intervening terminates the AI agent's involvement for that conversation.

## Consultant notes

- The autonomy level decision for agentic actions is a risk conversation with the client, not a technical conversation. For each action the AI agent can take (update address, process refund, create case), ask the client: "if the AI does this incorrectly, what's the worst case outcome and how easily is it corrected?" That answer drives the HITL requirement. Irreversible or high-impact actions warrant human confirmation; low-impact, easily reversible actions can be autonomous.
- Escalation rate monitoring post-go-live is essential HITL quality control. If the AI agent escalates 80% of conversations to human agents, the HITL design has the autonomy calibrated wrong — either the triggers are too sensitive or the AI agent's capability doesn't match the conversation scope it was given. Track escalation rates from day one and build adjustment into the post-go-live support plan.
- The "human agent transparency" part of HITL — what the agent sees when they take over an AI conversation — is often overlooked in the build. The focus goes to making the AI work; the handover UX gets tested late. Include the agent handover experience as a first-class UAT scenario: agent accepts an AI-escalated conversation, reviews the context, and proceeds. Make sure it makes sense from the agent's perspective.

---

*Source last updated: 2026-04-30 | Revisit as autonomy capabilities expand in 2026 Wave 1 and Wave 2*
