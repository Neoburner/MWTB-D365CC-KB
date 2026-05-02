# Customer Assist Agent (AI-Powered Self-Service)

**Category:** Self-Service / AI Agent
**Applies To:** Standalone / Embedded / Both
**Source:** [Configure Customer Intent Agent - Microsoft Learn](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-customer-intent-agent)

## What it does
Autonomous AI agent in Contact Center that handles entire customer interactions without a human. Copilot Studio powered, resolves end-to-end across voice and digital, escalates when needed.

## Key facts
- Built on Copilot Studio with generative AI (not the older isolated bot integration model)
- Consumes Copilot credits per interaction (or session-based licensing option depending on tenant configuration)
- Supports voice (IVR-like) and digital channels (chat, social, SMS, Teams, email)
- Handles intent recognition, entity extraction, and contextual responses automatically
- Can collect customer information, verify identity, and resolve common scenarios
- Escalates to human agents with full conversation context and collected variables
- Distinct from Customer Intent Agent feature—this agent provides end-to-end resolution, not just intent classification
- Requires Copilot Studio environment provisioned and connected to Contact Center
- Agent performance and resolution rates visible in analytics/reporting dashboard
- Supports skill-based routing rules for intelligent escalation decisions
- Conversation history and AI-generated summaries passed to human agent on handoff

## When to use / skip
Use the agent for high-volume repetitive work—password resets, balance checks, appointment scheduling, simple billing. It cuts first-contact resolution and agent load. Skip it if the use case needs deep compliance review, complex reasoning over sensitive data, or frequent agent interruptions. Also avoid it where customers expect human-only experience—complaint escalations, complex account disputes, high-touch segments.

## Configuration decisions
- **Intent recognition scope**: Define which customer intents the agent can resolve independently vs. escalate immediately (e.g., billing questions escalate, password resets resolve)
- **Escalation triggers**: Time-out threshold, sentiment threshold (if enabled), repeated failure to understand customer input, or explicit customer request
- **Skill routing on escalation**: Route to agent queues based on issue type, language, or priority level
- **Conversation sampling for training**: Which conversations are logged and reviewed to improve the agent's accuracy over time
- **Copilot credit allocation**: Set monthly or per-call budgets to manage licensing costs
- **Channel enablement priority**: Start with lower-friction channels (chat) before adding voice interactions
- **Fallback behavior**: Define canned messages when the agent cannot connect to escalation queue or cannot resolve

## Gotchas
- Escalation delay: If agents are busy, customers queue behind escalations and wait times climb.
- Generative AI hallucination: In rare cases, the agent gives plausible-sounding but wrong info. Mitigate with guardrails and escalation thresholds.
- Conversation context loss: If the escalation queue times out, the agent restarts the conversation instead of resuming. Set timeouts appropriately.
- Voice sessions don't persist: A dropped and reconnected call creates a new session; customer has to identify themselves again.
- Language model updates: Microsoft updates Copilot Studio's model periodically, which may change agent behavior without warning. Test after major updates.
- Cost visibility is aggregated-only, not per-call. Hard to calculate ROI per customer.
- Custom logic limits: The agent can't call legacy APIs or do complex multi-step transactions. Escalate those to humans with context.

## Consultant notes

- Scope the "intents the agent can resolve independently" list very carefully in discovery. Clients almost always want the agent to do more than it reliably can on day one. A short, high-confidence intent list that works well is worth more than a broad one that escalates 70% of the time and frustrates customers.
- Copilot credit consumption needs a cost estimate in the solution design. It's easy to underestimate at scale — check the per-interaction cost against expected volumes before the client commits to the business case.
- Model updates from Microsoft changing agent behaviour without warning is the operational risk to cover in the handover. The client's ops team needs a periodic review process for agent accuracy, not just a one-time go-live sign-off.

---

*Source last updated: 2026-04-30 | Revisit after Copilot Studio model updates, if escalation queue performance changes, or agent resolution drops below target*
