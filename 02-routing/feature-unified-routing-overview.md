# Unified Routing — Overview & Architecture

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../overview-unified-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/overview-unified-routing)

## What it does
Routes all work items (voice, chat, SMS, social, cases, email) through a two-stage pipeline: Classification (enrich the work item) then Assignment (match to the right agent). All channels run through the same engine.

## Key facts
- Two stages: **Classification** (rules/ML add context: skills, priority, capacity profile) → **Assignment** (match enriched item to agent by skills, capacity, presence, workload)
- Channels handled: voice, live chat, SMS, Facebook, WhatsApp, Teams, LINE, WeChat, custom messaging, email, cases
- Agents must use **Copilot Service workspace** — Customer Service Hub does not support unified routing assignment
- Not supported in **Unified Service Desk** — hard blocker for orgs on legacy USD
- **Intelligent Skill Finder** (ML routing) requires AI Builder and is not available in all geographic regions
- Configuration changes can take time to propagate — allow for propagation delay in test scripts

## When to use / skip
Unified routing is mandatory for D365 Contact Center and Customer Service routing scenarios. There is no alternative; if the org is on USD, migration to Copilot Service workspace is required first.

## Configuration decisions
- Classification strategy: rule-based (logical conditions) vs ML-based (Intelligent Skill Finder) — use rule-based at go-live; ML needs training data
- Queue structure design — the most consequential architectural decision; drives workstream, capacity profile, and assignment method choices downstream
- Capacity model: profiles or units — use profiles for all new implementations

## Gotchas
- **Classification before assignment.** Common mistake: jump straight to queues without designing classification rules. Poor classification means assignment can't match items properly—they arrive with no useful context.
- **Copilot Service workspace is mandatory.** Agents on Customer Service Hub won't receive work. Non-obvious blocker for hybrid rollouts where some agents haven't migrated yet.
- **Start simple.** Most clients try to replicate all existing routing complexity on day one. Start with 3–5 queues and basic rule-based classification. ML and complex skill taxonomies come later, after you have real data.

## Consultant notes

- Queue structure design is the decision everything downstream depends on. Get it wrong and you're reworking workstreams, classification rules, and capacity profiles weeks later. Push for a complete queue architecture sign-off on paper before anyone touches the admin centre.
- The instinct on every project is to replicate the full complexity of the existing system on day one. That complexity is usually a workaround for limitations that don't apply in D365. Challenge it — start with 3–5 queues and basic classification, then add complexity based on real data.
- USD as a hard blocker needs to come up in pre-sales, not after kick-off. If a client is on Unified Service Desk and nobody flagged it before the project started, that's a scope conversation waiting to happen.

---

*Source last updated: 2026-04-15 | Worth revisiting when: Routing architecture changes in release wave plans*
