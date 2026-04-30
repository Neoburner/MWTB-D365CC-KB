# Quality Evaluation Agent

**Category:** AI Agents
**Applies To:** Standalone (conversations) + Customer Service (cases + emails)
**Source:** [learn.microsoft.com/.../manage-quality-evaluation-agent](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/manage-quality-evaluation-agent)

## What it does
AI agent that scores customer interactions (conversations, cases, emails) against a supervisor-defined evaluation framework. Replaces manual QA sampling with automated, consistent scoring across all interactions. Feeds quality scores into the Agent Insights dashboard.

## Key facts
- Three roles: **Quality Administrator** (full access), **Quality Manager** (create criteria/plans, complete evaluations), **Quality Evaluator** (complete evaluations only)
- **Three prerequisites must all show Ready before the agent works:** connection references (Dataverse), Power Automate flows (must be enabled), Copilot Studio agent (must be published)
- Requires **pay-as-you-go Copilot credits** — not included in standard licensing
- Requires **Enable AI agents** toggle in Power Platform admin center (separate from D365 settings)
- **Scoring cannot be turned off once enabled** — set the threshold value deliberately before enabling
- Email evaluation is **preview only**
- Conversations: Contact Center standalone only; Cases: Customer Service only
- Quality score KPI in Agent Insights dashboard only populates if Quality Evaluation Agent is active
- Bulk evaluation available for cases (retroactive assessment of historical data)

## When to use / skip
Use on any deployment where the client wants automated QA, consistent scoring across teams, or quality-based KPI tracking. Essential if the Agent Insights dashboard quality score KPI is in scope. Skip if the client has no QA process to digitise — the evaluation criteria design requires investment from the client's QA team.

## Configuration decisions
- **Evaluation criteria and scoring logic** — the quality framework must be designed with the client's QA team; generic criteria produce generic insights
- **Scoring threshold** — defines good vs poor quality (out of 100); get client sign-off before enabling, it cannot be changed without disabling
- **Which record types to enable** — Conversation, Case, Email (preview), or combination
- **Whether to enable bulk evaluation** — useful post-go-live to establish a pre-deployment quality baseline on historical cases

## Gotchas
- **Prerequisites checklist is the most common failure point.** All three steps (connection references, Power Automate flows, Copilot Studio agent) must show Ready. Clients often enable the toggle and assume setup is complete — explicitly verify all three before testing.
- **Scoring is permanent once enabled.** Discuss the threshold with the client first. Enabling with a poorly considered threshold means living with it or a complex remediation.
- **"Enable AI agents" is a Power Platform admin center setting**, not a D365 Contact Center toggle. If the Quality Evaluation Agent won't activate, check this setting — it's easy to miss.
- **Compliance obligation:** Reps must be notified that interactions may be monitored, recorded, and scored. This is a legal requirement in many jurisdictions — build it into project governance, not just the implementation.

---

*Source last updated: 2026-04-30 | Review when: Email evaluation exits preview, or new record types added*
