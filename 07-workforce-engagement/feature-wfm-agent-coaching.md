# Agent Performance Feedback & Coaching

**Category:** Workforce Engagement Management
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/use/wfm-agent-feedback

## What it does
The agent feedback and coaching module in D365 WFM allows supervisors and quality assessors to share scored conversation evaluations with agents, add coaching notes, and track performance trends over time. Agents can view their own QA scores, read assessor feedback, and acknowledge coaching sessions within the CSW interface. This closes the quality management loop: conversations are scored (automatically or manually), scores are delivered to agents, and coaching actions are tracked.

## Key facts
- Requires the WFM Quality Management module to be active — coaching is the delivery mechanism for QA scores, not a standalone feature
- Agents access their own scores and feedback via the WFM section of CSW — they see their recent scored conversations, the scorecard breakdown, and assessor comments
- Supervisors and assessors create coaching notes directly against a scored conversation — notes can reference specific scorecard dimensions (e.g., "on this call your empathy score was low because...")
- Agents can acknowledge they have read a coaching note — acknowledgement is tracked and reported; non-acknowledgement is visible to supervisors
- Performance trend views show an agent's score progression over time — useful for identifying improvement trajectories or persistent performance gaps
- Coaching sessions can be formal (linked to a conversation score) or informal (standalone coaching note not tied to a specific conversation)
- The module does not include scheduling for coaching sessions — it's a notes and acknowledgement system, not a meeting scheduler
- Calibration (multiple assessors scoring the same conversation to align on standards) is tracked here when assessors complete calibration exercises

## When to use / skip
Use for any deployment where QA scoring outputs need to be shared with agents systematically. If QA is being done (manual or auto-scoring via Quality Evaluation Agent) but scores aren't being delivered to agents, the QA process is only half-implemented. Feedback delivery is where QA creates behaviour change.

Less relevant in the first few weeks of go-live — the priority then is operational stability. Start using coaching formally once the QA scoring cadence is established and there's enough score history to have meaningful feedback conversations.

## Configuration decisions
- Define who can create coaching notes — typically supervisors and QA assessors, not peer agents
- Set the acknowledgement expectation — is agent acknowledgement mandatory within a defined timeframe? This is a process design decision; the system tracks it but doesn't enforce consequences
- Decide on coaching frequency — how many conversations per agent per month are scored and have coaching notes created? This defines the workload for the assessor team
- Configure access so agents can only see their own scores and coaching notes, not other agents' — verify security role scope before go-live
- Integrate coaching session outcomes with performance management if the client has formal PIP (Performance Improvement Plan) processes — the coaching notes provide the documented evidence trail

## Gotchas
- Coaching notes are visible to the agent when the assessor publishes them. If an assessor writes a coaching note and then wants to revise it before the agent sees it, they need to check the publish state. Publishing is not reversible without creating a corrected note.
- Agent acknowledgement tracking is useful data but creates friction if it becomes a compliance burden. If supervisors use non-acknowledgement as a disciplinary trigger without context (e.g., agent was on leave), the tool becomes adversarial rather than developmental. Define the acknowledgement policy clearly and communicate it to agents before go-live.
- Coaching for auto-scored conversations (scored by the Quality Evaluation Agent) should include assessor review before delivery — if an AI score is wrong and a supervisor coaches an agent on it without reviewing, the agent receives incorrect feedback. Include a "human review before coaching" step for AI-scored conversations in the QA workflow.
- The coaching module tracks notes and acknowledgements but doesn't integrate with HR performance management systems natively. If coaching notes need to feed into formal HR processes, that's either a manual extract or a custom integration.

## Consultant notes

- The coaching module is often overlooked during implementation because QA scoring gets most of the attention. Frame coaching delivery as the completion of the QA loop — scoring without feedback delivery is just data collection; feedback delivery is where the performance investment pays off. Include coaching workflow design in the QA implementation scope, not as a phase 2 item.
- Agent-visible scores and feedback is a cultural change for most contact centres, not just a technical one. Some operations teams are nervous about agents seeing their own scores. The conversation worth having is: "if your QA process is sound and fair, why would you not share the outputs with agents?" Operations that don't share scores often discover that agents don't know what's being measured and therefore can't improve against it.
- Calibration is the most neglected WFM QA practice. If multiple assessors score conversations differently, coaching feedback to agents is inconsistent — Agent A gets coached on something that Agent B would be praised for. Include calibration sessions in the QA workflow design and use the calibration tracking feature to monitor inter-rater reliability from the start.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds scheduling integration or HR system connectors for coaching records*
