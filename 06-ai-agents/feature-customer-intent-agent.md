# Customer Intent Agent

**Category:** AI Agents
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../manage-customer-intent-agent](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/manage-customer-intent-agent)

## What it does
Uses generative AI to discover customer intents from historical conversation data and build an intent library. That library feeds Copilot agent deflection (self-service) and rep-facing guidance (guided questions, suggested solutions). Also enables intent-based routing.

## Key facts
- **Requires pay-as-you-go Copilot credits**: not included in standard licensing
- Requires **Intent Manager** role (to manage instructions) plus CSR Manager role
- First discovery run analyses up to 2 months of historical data; subsequent runs are daily
- **Simulation uses last 1,000 records only**: use it to preview intent granularity before committing to a full discovery run
- Three granularity levels for intent groups: Low / Medium / High: determines how many distinct intents are generated
- For Copilot agent integration, intents must have **Use in AI Agent = Yes** and the Intent-based suggestions component collection must be added and published in Copilot Studio
- **Lines of business** partition intents, users, workstreams, and queues for large multi-team deployments; chat workstreams must have the workstream name specified in line of business rules or chats may be misattributed
- Custom connector changes take up to 15 minutes to propagate
- Pre-chat survey data can be passed via `Global.EnrichmentContext` to give the agent customer context before the conversation starts

## When to use / skip
Use on any deployment where the client wants automated deflection, intent-based routing, or rep guidance. High-value for high-volume centres where manual tagging isn't feasible. Skip if you lack meaningful historical conversation data to run discovery.

## Configuration decisions
- Intent group granularity (Low/Medium/High): validate with simulation before running full discovery; right choice depends on how many distinct contact reasons the client actually has
- Which intents to mark **Use in AI Agent = Yes**: only approved, high-confidence intents should feed the Copilot agent
- Whether to use lines of business: required for large enterprise deployments routing different business units through the same Contact Center instance
- Instructions at organisation, intent group, or intent level: the main tuning mechanism for improving intent accuracy post-deployment

## Gotchas
- **Intent quality affects deflection and routing together.** If the client uses both intent-based routing and Copilot agent self-service, both depend on the same library. Poor intents degrade both. Build approval governance: don't leave intents in Pending.
- **Copilot agent integration is a studio step.** Not just a D365 toggle. Plan as dev work: open Copilot Studio, add Intent-based suggestions component collection, publish. Allow time for this.
- **Chat and lines of business mismatch silently.** If chats route to the wrong line of business, check whether the workstream name is in the line of business rules.

## Consultant notes

- Intent quality governance is the long-term operational commitment that often gets missed in scoping. Intents left in "Pending" state without review gradually degrade deflection accuracy. Build an approval process and a named owner for the intent library into the operational handover.
- The Copilot Studio step for agent integration is a separate dev task. When planning Customer Assist Agent integration with intents, allow time for the Copilot Studio component collection to be added and published: it's not a D365 admin toggle, it's a studio build step.
- Run the simulation before full discovery. It uses the last 1,000 records and gives you a preview of what intent granularity will look like: useful for having the "how many intents do you actually need?" conversation with the client before committing to a full run.

---

*Source last updated: 2026-04-14 | Check this after cases are added as an intent discovery source or intent-based routing expands*
