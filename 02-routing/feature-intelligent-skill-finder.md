# Intelligent Skill Finder (ML-Based Routing)

**Category:** Routing
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/intelligent-skill-finder

## What it does
Uses machine learning to automatically classify work items and assign skills based on conversation content, without manual rule configuration. Trains on historical data, learns intent and problem patterns, and applies inferred skills to new conversations. Coexists with rule-based classification—rules handle known cases, ML handles ambiguous or novel scenarios.

## Key facts
- Requires minimum historical data: 500–1,000 conversations per skill with good skill labeling to train a model with reasonable accuracy
- Training process is asynchronous; the model is retrained weekly or on-demand to incorporate recent conversations and skill drift
- Model accuracy depends on data quality: incomplete skills, vague conversation text, or skill label drift reduces prediction confidence
- Confidence scores are returned per prediction; supervisors can set a confidence threshold (e.g., only auto-assign if >85% confident) and route low-confidence items to a fallback queue
- Can be used alongside rule-based routing: rules are evaluated first, and ML is used only when rules don't match or when confidence is high enough
- Includes an "effort estimation" companion feature that predicts conversation complexity (simple/medium/complex) to inform queue assignment and staffing
- Model explainability: the system can show which conversation features (keywords, sentiment, intent) drove a skill assignment for auditing and debugging

## When to use / skip
Use Intelligent Skill Finder when you have diverse, evolving customer requests that are difficult to capture in static rules (e.g., technical support with novel issues, customer service with mixed intents). It is especially valuable in organizations scaling rapidly (new products, new customer segments) where rules become stale quickly. Skip it if your routing is simple and stable (e.g., "all billing questions to team A, all technical to team B"), if you lack historical conversation data, or if your skill taxonomy changes frequently (model becomes obsolete quickly).

## Configuration decisions
- **Data readiness:** Audit and clean historical conversations; ensure skills are consistently labeled and conversation text is complete
- **Training frequency:** Set model retraining schedule (weekly, bi-weekly, or monthly) based on how fast your business and skill definitions evolve
- **Confidence threshold:** Define the minimum confidence score required for automatic skill assignment (recommend starting at 75–85%, then adjusting)
- **Fallback routing:** Specify a "low confidence" queue or manual review queue for conversations below the threshold
- **Skill combination strategy:** Decide if the model assigns a single primary skill or multiple skills ranked by confidence
- **A/B testing:** Plan a pilot where ML-routed conversations are compared to rule-routed conversations in quality/handling time
- **Model monitoring:** Set up dashboards to track model prediction accuracy, false positive rate (wrong skill assigned), and model drift over time
- **Retraining triggers:** Document conditions that trigger manual retraining (e.g., new product launch, skill definition changes, accuracy drops below 80%)

## Gotchas
- Model accuracy depends entirely on historical data quality. Garbage in = garbage out. Insufficient or mislabeled training data produces unreliable predictions.
- New skills or products not well-represented in historical data are under-classified. The model struggles with novel scenarios.
- Model drift happens naturally as customer behaviour, products, or language changes. Retraining is essential but adds overhead.
- Confidence scores aren't calibrated to business risk. A 90% confident prediction can still be wrong 10% of the time, which hits customer satisfaction.
- The model reflects historical bias. If certain skills were over-assigned to certain agents or queues historically, the model learns and perpetuates that.
- Effort estimation can create unintended incentives—agents cherry-picking "simple" conversations, complex cases languishing.
- Hybrid routing (rules + ML coexisting) can create confusion if rules aren't fully deprecated. Conversations matching both need clear tiebreaker logic.
- Model explainability is limited. Supervisors and agents want to know *why* a conversation was routed to them, but you may only get keyword relevance scores.

## Consultant notes

- This is the feature most likely to be oversold in pre-sales and undersupported by actual data at go-live. Before committing to ML routing in a project scope, audit the historical conversation data for volume (500+ per skill is the floor), quality, and labelling consistency. If the audit fails, it's a post-go-live roadmap item, not a go-live deliverable.
- Logical rules first, ML later is the right sequencing almost every time. Use 6–12 months post-go-live as the benchmark for revisiting ML routing — by then you have clean labelled data and real business feedback on where rules are breaking down.
- Effort estimation creating agent cherry-picking incentives is worth flagging to the client's operations lead before enabling it. Agents who can see conversation complexity scores will optimise for simple ones. Whether that's a problem depends on how performance is measured.

---

*Source last updated: 2026-04-30 | Review when: Skill taxonomy changes, new product launches, monthly accuracy reviews, or agent feedback on classification fairness*
