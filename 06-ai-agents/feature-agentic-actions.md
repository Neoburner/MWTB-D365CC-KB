# Agentic Actions (CRM Read/Write)

**Category:** AI Agents (Autonomous)
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/agentic-actions

## What it does
Agentic actions are the CRM operations that an autonomous AI agent can perform on behalf of the customer during a conversation — without a human agent in the loop for that specific action. Examples: looking up an order status (Dataverse read), updating a customer's address (Dataverse write), creating a service case, or querying an external API for real-time product availability. Agentic actions are what differentiate an autonomous AI agent (which can do things) from a simple chatbot (which can only provide information).

## Key facts
- Agentic actions are configured in Copilot Studio as Power Automate flows or Dataverse connector operations called within an AI agent topic
- Read actions (query Dataverse, call an external API, look up a record): low-risk, typically executed autonomously without human confirmation
- Write actions (create record, update record, process transaction): higher-risk; whether they require human confirmation is a design decision (see `feature-human-in-the-loop.md`)
- The AI agent must have a Dataverse service account or system user with the minimum required security roles to perform the actions it needs — principle of least privilege applies
- Power Automate flows can extend agentic actions to external systems (ERP, order management, billing platforms) via connectors or custom HTTP actions
- Actions are defined at the Copilot Studio topic level — each topic in the agent's conversation flow can trigger specific actions based on intent and collected entities
- Failed actions (Dataverse unavailable, API timeout, permission denied) need explicit error handling in the topic — unhandled failures produce unhelpful responses to the customer
- Agentic action audit trail: actions taken by the AI agent are logged in the conversation transcript and in Dataverse audit logs (if audit is enabled)

## When to use / skip
Agentic read actions (look up account balance, check order status, retrieve appointment details) are appropriate for almost any AI agent deployment — they're low-risk and high-value. Agentic write actions (update records, process transactions) require more careful design and stronger HITL controls.

Start with read-only agentic actions in the first deployment and add write actions in subsequent phases once the agent's performance is validated. This is the conservative but sustainable approach.

## Configuration decisions
- Create a dedicated Dataverse system user (service account) for the AI agent with only the roles required for its specific actions — don't use an admin account for agent actions
- Map each agentic action to the Dataverse tables and fields it touches — this becomes the basis for the security role design for the agent service account
- For external system actions (APIs outside Dataverse): configure the connection in Power Automate, handle authentication (API keys, OAuth), and test error responses before enabling in the AI agent topic
- Build explicit error handling for each action: what does the AI agent say if the Dataverse lookup fails? If the API returns a 429 rate limit? If the record isn't found? These are conversation design decisions, not just technical ones
- Decide the confirmation pattern for write actions: agent can act autonomously, agent presents the proposed action and asks the customer to confirm, or agent proposes and a human agent approves (see `feature-human-in-the-loop.md`)

## Gotchas
- The AI agent's service account permissions are the ceiling of what the agent can do. If the service account doesn't have update access to the Order entity, the agent can't update orders — even if the topic is configured to try. Map security role requirements during design, not after getting access errors in testing.
- Agentic actions that call external APIs are subject to that API's rate limits, availability, and authentication expiry. An AI agent that works perfectly in UAT can fail in production if the external API has stricter rate limits at production volume. Load test any external API actions before go-live.
- Customer-confirmed write actions (the AI agent proposes, the customer says yes) still require the agent to handle cases where the customer changes their mind mid-confirmation, or where the customer's "yes" is actually responding to something else in the conversation. Voice AI agent action confirmation is particularly tricky — natural language "yes" can be ambiguous.
- Audit logging of agentic actions requires Dataverse audit to be enabled (see `feature-audit-logging.md`). If audit is not enabled, AI write actions leave no audit trail. For any write action deployment, audit should be enabled from day one.
- Power Automate flows triggered by agentic actions run in the context of the Dataverse connection configured in the flow — not the AI agent's service account. Verify that the Power Automate connection accounts have the right permissions, separately from the agent service account.

## Consultant notes

- The agentic actions design session should happen with both the technical team and a business representative who can authorise which actions the AI is allowed to take. "The AI can update a customer's address" is a business authorisation decision, not just a technical one. Document which actions are in scope, who approved them, and what the human oversight requirement is for each. This becomes the agentic action register — a project artefact that's useful for both the build and the post-go-live governance.
- Start with read actions and prove value before adding write actions. A first deployment that queries order status and provides account information is already valuable and low-risk. Adding write actions (update, create, process) in phase 2, once the agent's intent accuracy and customer experience are validated, is safer than building all capabilities at once and discovering quality issues after write actions have already executed on production data.
- The external API integration work is often underscoped. "The AI agent will look up order status from our order management system" sounds simple but involves: API authentication design, error handling for the API's many possible failure modes, latency testing (the API response time is part of the AI response time), and what happens when the API returns data in an unexpected format. Each external system integration deserves its own scoping conversation.

---

*Source last updated: 2026-04-30 | Revisit as the agentic action capability set expands — Microsoft is actively broadening the connectors and action types available in 2026*
