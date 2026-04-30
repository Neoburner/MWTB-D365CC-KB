# Intelligent Skill Finder (ML-Based Routing)

**Category:** Routing
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/intelligent-skill-finder

## What it does
Intelligent Skill Finder uses machine learning to automatically classify incoming work items and assign skills to them based on conversation content, without requiring manual rule configuration. The system trains on historical conversation data, learns patterns of customer intent and problem types, and applies inferred skills to new conversations. It coexists with rule-based classification, allowing organizations to hybrid approach: rules handle known, high-confidence cases, while ML handles ambiguous or novel scenarios.

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
- Model accuracy is highly dependent on historical data quality; garbage in = garbage out; insufficient or mislabeled training data produces unreliable predictions
- New skills or products not well-represented in historical data will be under-classified; the model struggles with novel scenarios
- Model drift occurs naturally over time as customer behavior, products, or language changes; regular retraining is essential but adds operational overhead
- Confidence scores are not calibrated to business risk; a 90% confident prediction might still be wrong in 10% of cases, which can impact customer satisfaction
- The model reflects historical bias in your data; if certain skills were historically over-assigned to certain agents or queues, the model learns and perpetuates that bias
- Effort estimation feature is a nice-to-have but can create unintended incentives (e.g., agents cherry-picking "simple" conversations, complex cases languishing in queue)
- If rule-based routing is not completely deprecated, hybrid routing can create confusion; conversations matching both rules and ML predictions need clear tiebreaker logic
- Model explainability is limited; supervisors and agents often want to understand *why* a conversation was routed to them, but the model may only provide keyword relevance scores

---

*Source last updated: 2026-04-30 | Review when: Skill taxonomy changes, new product launches, monthly accuracy reviews, or agent feedback on classification fairness*
