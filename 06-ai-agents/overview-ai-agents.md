# Overview: AI Agents in Dynamics 365 Contact Center

**Category:** AI Agents
**Filename:** `overview-ai-agents.md`
**Sources:**
- [learn.microsoft.com/en-us/dynamics365/contact-center/administer/overview-contact-center-agents](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/overview-contact-center-agents)
- [learn.microsoft.com/en-us/dynamics365/contact-center/administer/autonomous-agents-overview](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/autonomous-agents-overview)
**Doc Last Updated:** 2026-04-27
**Applies To:** Dynamics 365 Contact Center (standalone), Dynamics 365 Customer Service (some agents)

---

## Description

Dynamics 365 Contact Center uses a unified architecture of specialized AI agents, each mapped to a critical outcome in the contact center — customer self-service, representative productivity, interaction quality, and operational management. Two overlapping taxonomies are used by Microsoft documentation: the **contact center agent** taxonomy (Customer Assist, Quality Assurance, Service Operations) and the **autonomous service agent** taxonomy (Customer Intent, Case Management, Customer Knowledge Management, Quality Evaluation). Understanding both is necessary to navigate the configuration surface.

---

## Contact Center Agent Taxonomy

These three agents are the primary operational AI components of Dynamics 365 Contact Center, accessible from Copilot Service admin center.

### Customer Assist Agent

Handles customer interactions through autonomous self-service and real-time representative assistance.

- Understands customer intents and resolves issues autonomously
- Assists representatives during live interactions in real time
- Supports proactive outbound customer contact

### Quality Assurance Agent

Monitors interactions and provides quality, compliance, and coaching insights.

- Monitors conversations for quality issues in real time
- Evaluates net conversation quality after conversation closes
- Enables supervisors to monitor and act on quality alerts

### Service Operations Agent (Preview)

Supports contact centre configuration and operational governance via natural language.

- Provisions contact centre components
- Configures settings using natural language prompts
- Orchestrates conversations in real time

---

## Autonomous Service Agent Taxonomy

These agents automate specific service workflows. Some are available in Contact Center; some are Customer Service-only.

| Agent | Availability | Purpose |
|-------|-------------|---------|
| **Customer Intent Agent** | Contact Center + Customer Service | Uses generative AI to discover intents from cases/conversations; recommends knowledge articles |
| **Case Management Agent** | Customer Service only | Automates case lifecycle (create, update, resolve, close) |
| **Customer Knowledge Management Agent** | Customer Service | Extracts knowledge from closed cases and manages knowledge articles in real time |
| **Quality Evaluation Agent** | Contact Center + Customer Service | Autonomous and AI-assisted quality assessments of interactions against evaluation criteria |

---

## Primary Use Cases

- Deploying AI-first customer self-service via the Customer Assist Agent
- Reducing supervisor manual quality review overhead with the Quality Assurance Agent
- Discovering what customers are contacting for (intent discovery) without manual tagging
- Automating case creation and follow-up with the Case Management Agent
- Continuously improving knowledge base coverage post-interaction

---

## Implementation Notes

> *Consultant perspective — add your own notes here*

- **The naming taxonomy is genuinely confusing.** Microsoft uses "contact center agents" (Customer Assist, QA, Service Operations) as the macro framework, but the documentation also covers "autonomous agents" (Customer Intent, Case Management, KM, Quality Evaluation) which sit in a different area of the admin center. Map this out for the client as a visual before the feature walkthrough — otherwise they'll conflate the two taxonomies.
- **Availability varies significantly.** Case Management Agent and Customer Knowledge Management Agent are Customer Service only. Service Operations Agent is in preview. Quality Evaluation Agent and Customer Intent Agent are available in Contact Center. Don't promise capabilities that are CS-only in a Contact Center standalone deployment.
- **These agents work best as a layered stack, not as point solutions.** Customer Intent discovers what customers ask about → Knowledge Management keeps articles current → Quality Evaluation assesses interaction quality → Agent Insights measures the outcomes. Positioning them together as a continuous improvement loop resonates better with clients than explaining each one in isolation.

## Consultant notes

- The taxonomy map is genuinely necessary before any client walkthrough of this area. "Contact center agents" and "autonomous service agents" are overlapping labels in Microsoft's documentation that describe different but related things. Produce a one-page visual before the first feature demo or the client will spend the session confused about which "agent" they're looking at.
- Availability gaps catch people: Case Management Agent and Customer Knowledge Management Agent are Customer Service-only. Service Operations Agent is Preview. Don't promise Contact Center capabilities that live in Customer Service or Preview without explicitly flagging it during scoping.
- The continuous improvement loop framing (Intent → Knowledge → Quality → Insights) resonates better with clients than explaining each agent individually. Use it in discovery to position the full picture before diving into individual features.

---

*Generated: 2026-04-30 | Review when: Service Operations Agent exits preview, or new agent types added to the taxonomy*
