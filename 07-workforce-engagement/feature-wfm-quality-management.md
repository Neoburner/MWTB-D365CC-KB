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
**Use Quality Management** when you need to enforce subjective quality standards (e.g., "empathy," "accuracy in summarizing customer issue," "adherence to company brand voice") that AI cannot reliably grade, or when you want supervisors actively involved in coaching based on real conversations. It's essential if regulations require demonstrated quality audits (e.g., financial services, healthcare). **Skip it** if you're purely focused on speed and volume metrics, or if you lack the QA team capacity to review conversations consistently (sampling without follow-up coaching is a compliance risk).

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
- Scoring subjectivity: Two QA analysts may score the same conversation differently; calibration sessions help but don't eliminate variance
- Coaching notes are subjective too: An agent may misinterpret feedback ("don't use 'sir'") as criticism rather than guidance; delivery matters
- Conversation length bias: Longer conversations may receive higher scores due to more opportunity to demonstrate criteria; account for this in analysis
- Sampling randomness: A randomly sampled agent may get unlucky (three hard calls in a row) while another gets easy calls; consider stratification or larger sample sizes
- Score inflation over time: QA teams tend to give higher scores as they become comfortable with an agent's style; periodic recalibration and "check calls" (re-score old conversations) help
- No direct link to call handling time: Quality Management focuses on quality, not efficiency; an agent with excellent quality but slow speed is not flagged unless a separate efficiency metric is monitored
- Coaching not followed: Supervisors may score conversations and assign coaching but not track follow-up; create an action list tied to the scorecard
- Quality Evaluation Agent AI and manual scores can diverge: If AI gives a high quality score but human QA gives a low score (or vice versa), it signals potential bias in the AI or misalignment in the rubric
- Sampling rate too low: If you only sample 10 conversations per agent per month and the agent has 500+ calls, the sample may not represent their true performance
- Conversation availability: Old conversations (>90 days) may be archived and unavailable for re-review; plan for this if you need audit trails

---

*Source last updated: 2026-04-30 | Review when: QA team calibration shows >10% variance between evaluators, agent appeals a score, or if Quality Evaluation Agent AI scores diverge significantly from manual scores*
