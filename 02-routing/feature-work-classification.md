# Work Classification Rulesets

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-work-classification](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-work-classification)

## What it does
First stage of unified routing. Adds enrichment data to work items before any routing decision, attaches skills, sets priority, assigns capacity profiles, or writes any custom attribute. Rules evaluate conditions ("if X, then set attribute Y to value Z"). Runs before route-to-queue rules and agent assignment.

## Key facts
- Max **10 rulesets per workstream**; max **100 rule items per ruleset**; max **5 output attributes per rule item**
- Evaluation order: rulesets run top to bottom; within each ruleset, first match executes and control moves to next ruleset (classification stops at first match per ruleset: unlike route-to-queue which evaluates all rules)
- Output values set by earlier rulesets can be referenced as conditions in later rulesets (chaining)
- Rule types: logical (conditions), skill classification (logical), skill classification (ML: Intelligent Skill Finder), capacity profile rules, sentiment prediction (Preview)
- ML-based classification requires AI Builder: regional availability limitations; requires a trained and published model
- **Skill rating model in classification rules must match** the rating model on agent skill profiles: mismatch causes silent assignment failure
- When a rerouted work item goes through classification again, skills are **appended** (not replaced): can result in over-tagging

## When to use / skip
Required for any routing deployment beyond trivial single-queue setups. Classification is where routing intelligence lives, the quality of what arrives at the assignment stage is entirely determined by classification.

## Configuration decisions
- Ruleset chain design: how many rulesets, what each one handles (topic → customer tier → priority → capacity profile), and what order they run in
- Logical vs ML rules: logical rules at go-live, ML rules after 6–12 months of training data
- Whether to use sentiment prediction (Preview): not recommended for production in regulated environments yet

## Gotchas
- **Classification stops at first match per ruleset; route-to-queue evaluates all rules.** Catches admins maintaining rules post go-live. Document explicitly in the handover.
- **Rating model consistency is a silent failure mode.** Different people setting up skills at different times can cause rating models to diverge between classification rules and agent profiles. Audit before go-live.
- **Rerouted items accumulate skills.** When a work item is rerouted after a transfer, it goes through classification again and skills append (not replace). Over-tagged items match agents incorrectly or not at all with Exact Match.
- **The 10-ruleset limit is rarely a problem with clean design.** If you're approaching it, classification design is handling too many edge cases that belong elsewhere.

## Consultant notes

- Rating model consistency is worth auditing before go-live even if you're confident in the setup. It's a 10-minute check in the skill configuration and it prevents the type of silent failure that's genuinely difficult to diagnose in production.
- The rerouted-items-accumulate-skills behaviour is one to cover explicitly in the admin handover. If an agent transfers a conversation and it goes back through classification, skills stack rather than reset. Over-tagged items with Exact Match either get assigned to the wrong person or stay stuck.
- Start rule-based at go-live, revisit ML later. Don't promise Intelligent Skill Finder as part of a go-live scope unless 12 months of clean, labelled conversation data is already available and you've audited it.

---

*Source last updated: 2025-07-09 | Review when: New classification rule types or limit changes in release notes*
