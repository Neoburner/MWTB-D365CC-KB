# Agent Orchestration & Copilot Control Plane

**Category:** AI Agents (Autonomous)
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/agent-orchestration

## What it does
Agent orchestration is the layer in D365 Contact Center that coordinates multiple AI agents, Customer Assist Agent, Quality Evaluation Agent, Service Operations Agent, and determines how they interact with each other and with human agents. The Copilot control plane is the underlying infrastructure that manages agent state, context passing between agents, and the rules for when each agent activates. Rather than each AI agent operating independently, orchestration allows them to work in a coordinated pipeline: a Customer Assist Agent handles the customer, hands off to a human, and the Quality Evaluation Agent then scores the conversation automatically.

## Key facts
- Orchestration is configured in Copilot Studio and the Copilot control plane in D365 Contact Center admin centre
- Defines which AI agents are active for which workstreams and channels: not every channel needs every agent
- Controls the handoff sequence: customer-facing AI agent → human agent → post-conversation AI processing (QA scoring, summary generation)
- Context preservation: conversation context (customer intent, entity values, bot conversation summary) passes through each handoff point via the orchestration layer
- The control plane tracks agent state: which AI agent is currently "in control" of the conversation at any point, and what triggers a handoff
- Human-in-the-loop configuration (see `feature-human-in-the-loop.md`) is part of the orchestration design: defining when human approval or oversight is required before an AI agent takes an action
- Orchestration telemetry flows into the Agent Insights Dashboard (`feature-agent-insights-dashboard.md`) for monitoring AI agent performance
- This is a maturing capability: the specific configuration surface and extent of what's orchestratable is expanding across 2025–2026 release waves

## When to use / skip
Relevant for any deployment where more than one AI agent is active, Customer Assist Agent handling conversations AND Quality Evaluation Agent scoring them, for example. Single-agent deployments (just the Quality Evaluation Agent for QA scoring, no autonomous customer-facing agent) don't need orchestration design, each agent operates independently.

Orchestration design becomes important when AI agents interact with each other or when the sequence and context transfer between AI agents and human agents needs to be controlled deliberately.

## Configuration decisions
- Map out the AI agent pipeline before configuration: which agents are active, in what sequence, for which workstreams, and what context needs to pass between them
- Configure trigger conditions for each agent activation: when does the Customer Assist Agent kick in? When does it hand off to human? When does QA scoring run?
- Define context payload content at each handoff: what the receiving agent (human or AI) needs to know from the preceding agent; more is not always better; focus on what's actionable
- Test the full pipeline end-to-end in UAT: individual agent testing doesn't catch orchestration failures (context not passing, wrong agent activating at the wrong time)
- Monitor via the Agent Insights Dashboard after go-live to detect orchestration issues: missed handoffs, context loss, agents activating unexpectedly

## Gotchas
- Orchestration failures are hard to diagnose because they span multiple systems (Copilot Studio, D365 Contact Center, ACS). If context isn't passing between agents correctly, the problem could be in any of the handoff points. Structured end-to-end logging from the start is the mitigation.
- Multiple AI agents operating simultaneously on the same conversation (if mis-configured) can produce conflicting actions. The orchestration layer should ensure only one agent "owns" the conversation at any point: verify this is enforced in configuration.
- Agent orchestration configuration is a newer capability and the UI and configuration options are still evolving. What's documented in pre-GA materials may differ from what's available in a specific environment or release. Check the current state of configuration options at the time of the project.
- Context preservation relies on structured data passing. If the Customer Assist Agent collects customer intent as unstructured text, the receiving human agent gets the text; if it passes it as a structured entity (intent name + confidence + collected fields), the receiving agent gets actionable data. Agree the context schema upfront.

## Consultant notes

- The orchestration design conversation happens at the whiteboard, not in the admin centre. Before anyone opens a configuration screen, map the full AI agent pipeline: which agents, in what order, for which channel/workstream, with what context passing at each transition. This design artefact should be agreed with the client before build starts: it drives both the Copilot Studio configuration and the D365 workstream setup.
- "AI agents coordinate automatically" is not true: orchestration requires deliberate configuration. The AI agents don't discover each other and self-organise. Each connection and context pass is configured explicitly. Set this expectation with clients who assume AI agent integration is plug-and-play.
- This is a maturing capability and its exact feature surface shifts between release waves. If the client's project is 6+ months away from this design decision, plan to re-verify the orchestration capabilities at that time rather than locking the design to current documentation.

---

*Source last updated: 2026-04-30 | Revisit at each release wave: orchestration capability is actively expanding in 2026*
