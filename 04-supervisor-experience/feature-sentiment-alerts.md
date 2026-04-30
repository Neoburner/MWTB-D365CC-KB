# Sentiment-Triggered Alerts

**Category:** Supervisor Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-sentiment-analysis

## What it does
Sentiment-Triggered Alerts automatically notify supervisors when a customer's sentiment during a conversation drops below a configurable threshold (e.g., 6.0 on a 1–10 scale), signaling customer dissatisfaction or frustration. The alert appears in the supervisor dashboard and can trigger emails or other notifications in real time, allowing supervisors to intervene by monitoring the conversation, coaching the agent, or offering proactive assistance before the customer escalates or abandons.

## Key facts
- Sentiment scoring is continuous on a 1–10 scale: 1–3 is negative, 4–6 is neutral, 7–10 is positive
- Threshold is per-organization configurable; typical threshold for alerts is 5.0–6.5
- Sentiment is analyzed from both customer and agent message text in real time using natural language processing
- Alert includes conversation ID, customer ID, agent name, current sentiment score, and transcript snippet for context
- Prerequisite: Sentiment Analysis must be enabled at the organization level; it consumes additional AI/analytics quota
- Supervisor can click an alert to open the conversation, listen/read live, and take action (e.g., transfer to senior agent, send chat intervention, or flag for quality review)
- Alert data is retained in reports for coaching, quality assurance, and training gap identification

## When to use / skip
Use sentiment alerts in customer-experience-focused environments (SaaS, consumer services, hospitality) where early intervention can salvage relationships and prevent churn. Alerts are especially valuable for high-value customers, VIP accounts, or regulated industries where customer satisfaction is tied to compliance. Skip sentiment alerts if your contact center is transaction-focused (billing, admin tasks) where sentiment is less predictive, or if supervisor ratios are too high to act on alerts (e.g., 1 supervisor for 200+ agents).

## Configuration decisions
- **Sentiment threshold:** Set the trigger point (recommend 5.0–6.0 for balance; lower = more alerts, higher = fewer but higher-risk misses)
- **Alert channels:** Configure whether alerts appear in-app only, via email, SMS, Slack, or Teams integration
- **Alert frequency cap:** Decide if multiple alerts per conversation are sent or if only the first/lowest sentiment breach triggers an alert
- **Conversation eligibility:** Restrict alerts to certain channels (e.g., chat, voice) or agent groups (e.g., junior agents, new hires)
- **Supervisor routing:** Route sentiment alerts to the conversation owner's supervisor or a designated "alert response" team
- **Follow-up action:** Document recommended supervisor actions (monitor, coach, intervene, escalate) and train supervisors on decision tree
- **Reporting linkage:** Ensure alerts are tagged and searchable in post-call coaching records and quality management

## Gotchas
- Sentiment analysis is probabilistic; it can misidentify sarcasm, frustrated politeness (customer is calm but angry), or domain-specific terminology (e.g., "terrible" in a positive context)
- A single low sentiment score may be temporary (customer frustrated at one moment but resolved after agent clarification); supervisors should not over-react to single alerts
- Sentiment is calculated from text/transcripts; tone of voice, pauses, or non-verbal cues are not captured, reducing accuracy for voice
- Alerts only trigger on customer sentiment; agent frustration or rudeness is *not* flagged by sentiment analysis (requires separate quality monitoring)
- If sentiment threshold is too low, supervisors will be overwhelmed with false positives; if too high, genuine at-risk conversations are missed
- Sentiment score improves artificially if agent apologizes or says "I understand" repeatedly, even if the customer's core issue is unresolved
- Alerts are delayed by ~1–2 minutes (lag time for sentiment model processing), so "real-time intervention" is not instantaneous

---

*Source last updated: 2026-04-30 | Review when: Threshold adjustments after alert volume analysis, sentiment model updates, or supervisor feedback on alert accuracy*
