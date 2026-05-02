# WFM Quality Management (Conversation Scoring)

**Category:** Workforce Management / Quality Assurance
**Applies To:** Standalone / Embedded (via WFM module)
**Source:** [Configure WFM Quality Management - Microsoft Learn](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-wfm-quality-management)

## What it does
WFM Quality Management is the module for manually scoring agent conversations against a defined quality rubric. Supervisors or QA analysts select sampled conversations (voice or digital), evaluate them against a scorecard with weighted criteria, and assign scores. These scores feed into agent performance reporting, coaching plans, and can influence compensation decisions. Quality Management is separate from—and complementary to—the Quality Evaluation Agent AI feature, which auto-scores all conversations.

## Key facts
- Scorecard-based evaluation: Define custom criteria (e.g., "professionalism," "problem resolution," "empathy") with weighted scores
- Sampling strategy: Random, risk-based (low CSAT conversations), or supervisor-selected
- Evaluator role required: QA analyst or supervisor with quality evaluation permissions
- Evaluation workflow: Select conversation, listen/review, fill scorecard, add coaching notes, publish
- Score thresholds trigger coaching: E.g., score <70% triggers mandatory coaching session
- Scores visible in agent performance dashboard; trend analysis over time (monthly, quarterly)
- Integration with HR/performance management: Exported scores can feed into annual reviews, promotion decisions
- Conversation sampling per agent: Typical min is 10–15 conversations per month (configurable)
- Scorecard versioning: Update rubric over time (e.g., add new criterion, adjust weights) without affecting historical scores
- Quality Evaluation Agent AI comparison: AI auto-scores all conversations in real-time; Quality Management provides human validation on a subset for calibration and coaching specificity

## When to use / skip
Use Quality Management for subjective standards (empathy, accuracy, brand voice) that AI can't grade reliably, or when supervisors need to coach from real conversations. Essential for regulated industries (financial, healthcare) that need demonstrable quality audits. Skip if you're optimising for speed and volume only, or if you don't have QA capacity to sample consistently — sampling without follow-up is a compliance risk.

## Configuration decisions
- **Scorecard design**: Define 5–10 key criteria and their relative weights (e.g., "Professionalism" = 30%, "Problem Resolution" = 40%, "Empathy" = 30%)
- **Score ranges**: Use numeric (0–100), letter grades (A–F), or descriptive (Excellent/Good/Needs Improvement)
- **Sampling method**: Random (unbiased), risk-based (low CSAT/NPS conversations), manager-nominated (specific agents under review), or stratified (equal sampling across agents)
- **Sampling rate per agent**: Minimum conversations per month (e.g., 10 for full-time, 5 for part-time)
- **Channel coverage**: Score calls, chats, emails equally, or weight by volume/complexity?
- **Coaching trigger thresholds**: At what score does an agent get mandatory coaching? Who assigns it?
- **Calibration sessions**: Frequency for QA team to align on scorecard interpretation (e.g., monthly calibration meeting)
- **Feedback loop to agent**: When/how is the score and coaching notes shared with the agent?
- **Appeals or re-evaluation process**: Can an agent dispute a score? What's the escalation path?
- **Retention and audit trail**: How long to retain scored conversations and evaluation notes for compliance?

## Gotchas
- **Scoring isn't objective:** Two QA analysts score the same call differently. Calibration helps but doesn't eliminate it.
- **Coaching notes are subjective too:** Feedback ("don't use 'sir'") gets misread as criticism. Delivery matters.
- **Longer calls get higher scores:** More opportunity to demonstrate criteria. Account for this in analysis.
- **Random sampling can be unfair:** One agent gets three hard calls, another gets easy ones. Use stratification or bigger samples.
- **Score creep over time:** QA teams get more lenient with familiarity. Periodic recalibration and re-scoring old calls help.
- **Quality vs efficiency tracked separately:** Quality score doesn't flag slow agents. Monitor efficiency separately if it matters.
- **Coaching assigned but not followed:** Supervisors score and assign coaching, then move on. Create an action list.
- **AI scores vs manual scores can diverge:** High AI score, low human score = bias in the AI or misaligned rubric.
- **Sample size matters:** 10 calls per agent per month with 500+ calls total = unrepresentative sample.
- **Old conversations get archived:** Calls >90 days old may not be available for re-review. Plan for this if audits matter.

## Consultant notes

- Scorecard design is the most important decision in the entire QM setup, and it's the one that gets the least time in most projects. Spend a session with the QA team lead and at least one experienced supervisor defining the criteria and weights before you build anything. A scorecard that doesn't reflect how the client actually evaluates quality will be quietly abandoned within three months.
- Distinguish this from the Quality Evaluation Agent clearly in handover. The AI agent (`feature-quality-evaluation-agent.md`) auto-scores all conversations and is good for volume coverage. WFM Quality Management is for human-reviewed scoring, calibration, and coaching on a sample. Both have value; they're doing different jobs. Clients who have both often use AI scores as the trigger for human review — flag as high-risk by AI, validated by a QA analyst.
- Calibration sessions need to be in the operational playbook, not just the initial setup guide. Without regular calibration, scores drift. Two QA analysts who score the same call 20 points apart will produce unreliable trend data. Build a quarterly calibration session into whatever cadence the client runs their QA reviews.

---

*Source last updated: 2026-04-30 | Check this if: QA variance exceeds 10%, an agent appeals, or AI and manual scores diverge*
