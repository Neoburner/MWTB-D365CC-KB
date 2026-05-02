# Skill-Based Routing

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../set-up-skill-based-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/set-up-skill-based-routing)

## What it does
Matches work items to agents based on required skills vs agent skill profiles. Skills are attached to work items during classification; agents are profiled with skills and proficiency levels. Two matching modes: Exact Match (agent must hold all required skills at minimum proficiency) and Closest Match (best available agent by proximity, tolerates partial skill match).

## Key facts
- Setup order: rating model → skill types → skills → assign skills to agents → set algorithm on workstream → write skill classification rules
- **Exact Match:** agent must have all required skills at required proficiency or above; no match = item stays unassigned in queue
- **Closest Match:** orders agents by closeness to required skills; assigns even if no agent has an exact match; order-by options: nearest proficiency, most proficient, skill count, round robin, capacity
- **None:** no skill matching; work assigned on capacity/presence only
- Rating model must be **consistent** — skills in classification rules and skills on agent profiles must use the same model; mismatched models cause silent assignment failure
- Closest match with round robin/highest capacity queue: same agent may receive consecutive assignments when skill scores are tied — does not truly round-robin among equal-score agents
- ML-based skill classification (Intelligent Skill Finder) requires AI Builder — regional availability limitations apply
- Agents can optionally self-manage their skill profiles if admin enables skill control

## When to use / skip
Use when work needs to be matched to agents with specific capabilities — language, product knowledge, technical tier, regulatory certification. Skip if all agents in a queue are equally capable of handling all work; it adds config overhead with no routing benefit.

## Configuration decisions
- Exact vs Closest Match — business decision: "Is it better to wait for the perfect agent or get a good-enough agent quickly?" Exact for regulated/language-compliance scenarios; Closest for volume-focused environments
- Skill taxonomy size — 10–20 skills at go-live is usually sufficient; resist building a 50-skill taxonomy that's expensive to maintain
- Who owns agent skill profile maintenance — define this in the operational handover; it's often missed

## Gotchas
- **Rating model mismatch is a silent failure.** If skills were set up at different times by different people, rating models can diverge. Audit before go-live to confirm all classification rule skills and agent skill profiles use the same model.
- **Exact Match can leave items unassigned.** If no agent has all required skills (shift changes, absences), the item sits in queue indefinitely. Plan for this with a fallback skill relaxation rule or timed overflow action.
- **ML classification needs training data.** Intelligent Skill Finder isn't useful on day one—it needs historical conversation data to become accurate. Start with logical rules and revisit ML models after 6–12 months of data.

## Consultant notes

- Skill taxonomy size discipline matters long-term. A 50-skill taxonomy is a maintenance nightmare — agent profiles go stale, classification rules drift, and skills that made sense at go-live become meaningless a year later. Push for the smallest taxonomy that covers real routing requirements and add to it based on need.
- Who maintains agent skill profiles post go-live needs to be a named person with a defined process, not an assumption left in the handover document. It's the piece most likely to be undefined and the first thing that causes misrouting three months after go-live.
- Test Exact Match with a queue where no agent has the required skill before go-live. Confirm the overflow or fallback behaviour explicitly. Silent unassignment is the failure mode and you want to know how it presents before a real customer hits it.

---

*Source last updated: 2025-05-09 | Review when: New skill matching options or AI Builder language support changes*
