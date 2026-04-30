# Customer Intent Agent

**Category:** AI Agents
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../manage-customer-intent-agent](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/manage-customer-intent-agent)

## What it does
Uses generative AI to discover customer intents from historical conversation data and build an intent library. That library feeds Copilot agent deflection (self-service) and rep-facing guidance (guided questions, suggested solutions). Also enables intent-based routing.

## Key facts
- **Requires pay-as-you-go Copilot credits** — not included in standard licensing
- Requires **Intent Manager** role (to manage instructions) plus CSR Manager role
- First discovery run analyses up to 2 months of historical data; subsequent runs are daily
- **Simulation uses last 1,000 records only** — use it to preview intent granularity before committing to a full discovery run
- Three granularity levels for intent groups: Low / Medium / High — determines how many distinct intents are generated
- For Copilot agent integration, intents must have **Use in AI Agent = Yes** and the Intent-based suggestions component collection must be added and published in Copilot Studio
- **Lines of business** partition intents, users, workstreams, and queues for large multi-team deployments; chat workstreams must have the workstream name specified in line of business rules or chats may be misattributed
- Custom connector changes take up to 15 minutes to propagate
- Pre-chat survey data can be passed via `Global.EnrichmentContext` to give the agent customer context before the conversation starts

## When to use / skip
Use on any deployment where the client wants automated deflection, intent-based routing, or rep guidance from discovered intents. High-value for high-volume contact centres where manual intent tagging isn't feasible. Skip if the client doesn't have meaningful historical conversation data to run discovery against.

## Configuration decisions
- Intent group granularity (Low/Medium/High) — validate with simulation before running full discovery; right choice depends on how many distinct contact reasons the client actually has
- Which intents to mark **Use in AI Agent = Yes** — only approved, high-confidence intents should feed the Copilot agent
- Whether to use lines of business — required for large enterprise deployments routing different business units through the same Contact Center instance
- Instructions at organisation, intent group, or intent level — the main tuning mechanism for improving intent accuracy post-deployment

## Gotchas
- **Intent library quality affects both deflection and routing simultaneously.** If the client uses intent-based routing AND Copilot agent self-service, both depend on the same library. Poor intents degrade both. Build approval governance into the process — don't leave intents in Pending status.
- **Copilot agent integration requires a Copilot Studio deployment step**, not just a D365 toggle. Plan this as a development task: open Copilot Studio, find the Intent-based suggestions component collection, add it to the agent, publish. Allow time for this.
- **Chat workstreams and lines of business mismatch silently.** If chat chats are routing to the wrong line of business, check whether the workstream name is specified in the line of business rules.

---

*Source last updated: 2026-04-14 | Review when: Cases added as an intent discovery source, or intent-based routing expands*
