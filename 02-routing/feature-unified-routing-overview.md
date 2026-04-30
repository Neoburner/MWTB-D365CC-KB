# Unified Routing — Overview & Architecture

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../overview-unified-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/overview-unified-routing)

## What it does
The core routing and assignment engine for D365 Contact Center. Routes work items across all channels (voice, chat, SMS, social, cases, email) through a two-stage pipeline: Classification (enrich the work item) then Assignment (match to the right agent). All channels use the same engine and logic.

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
- **Classification before assignment.** A common setup mistake is jumping straight to queues without designing classification rules. Poor classification means the assignment stage can't do its job — work items arrive without the context needed to match them correctly.
- **Copilot Service workspace is mandatory.** Agents still using Customer Service Hub won't receive work. This is a non-obvious blocker for hybrid rollouts where some agents haven't migrated yet.
- **Start simple.** Most clients try to replicate all their existing routing complexity on day one. Recommend starting with 3–5 queues and basic rule-based classification. ML models and complex skill taxonomies should come later, once there's real usage data.

---

*Source last updated: 2026-04-15 | Review when: Routing architecture changes in release wave plans*
