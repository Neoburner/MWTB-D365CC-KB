# Sentiment-Triggered Alerts

**Category:** Supervisor Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-sentiment-analysis

## What it does
Automatically alerts supervisors when customer sentiment drops below a configured threshold (e.g., 6.0 on a 1–10 scale). Alert appears in the supervisor dashboard and can trigger email or other notifications, letting supervisors intervene by monitoring, coaching, or offering assistance before the customer escalates or leaves.

## Key facts
- Sentiment scoring is continuous on a 1–10 scale: 1–3 is negative, 4–6 is neutral, 7–10 is positive
- Threshold is per-organization configurable; typical threshold for alerts is 5.0–6.5
- Sentiment is analyzed from both customer and agent message text in real time using natural language processing
- Alert includes conversation ID, customer ID, agent name, current sentiment score, and transcript snippet for context
- Prerequisite: Sentiment Analysis must be enabled at the organization level; it consumes additional AI/analytics quota
- Supervisor can click an alert to open the conversation, listen/read live, and take action (e.g., transfer to senior agent, send chat intervention, or flag for quality review)
- Alert data is retained in reports for coaching, quality assurance, and training gap identification

## When to use / skip
Use in customer-experience-focused operations (SaaS, consumer services, hospitality) where early intervention can save relationships and prevent churn. Valuable for high-value or VIP accounts, or regulated industries where satisfaction ties to compliance. Skip if you're transaction-focused (billing, admin tasks) where sentiment matters less, or if supervisor ratios are too stretched to act on alerts (1 supervisor for 200+ agents).

## Configuration decisions
- **Sentiment threshold:** Set the trigger point (recommend 5.0–6.0 for balance; lower = more alerts, higher = fewer but higher-risk misses)
- **Alert channels:** Configure whether alerts appear in-app only, via email, SMS, Slack, or Teams integration
- **Alert frequency cap:** Decide if multiple alerts per conversation are sent or if only the first/lowest sentiment breach triggers an alert
- **Conversation eligibility:** Restrict alerts to certain channels (e.g., chat, voice) or agent groups (e.g., junior agents, new hires)
- **Supervisor routing:** Route sentiment alerts to the conversation owner's supervisor or a designated "alert response" team
- **Follow-up action:** Document recommended supervisor actions (monitor, coach, intervene, escalate) and train supervisors on decision tree
- **Reporting linkage:** Ensure alerts are tagged and searchable in post-call coaching records and quality management

## Gotchas
- **Sentiment is probabilistic.** Can misfire on sarcasm, frustrated politeness (calm but angry), or domain-specific wording (e.g., "terrible" used positively).
- **Single low scores are often temporary.** A customer frustrated one moment but happy after clarification: don't over-react to one alert.
- **Text-based only.** Tone, pauses, and non-verbal cues aren't captured, so voice accuracy is reduced.
- **Agent sentiment isn't flagged.** Only customer sentiment triggers alerts. Agent rudeness needs separate quality monitoring.
- **Threshold tuning is critical.** Too low = alert fatigue. Too high = you miss the at-risk conversations.
- **"I understand" gaming.** Sentiment improves artificially when agents apologise or repeat empathy phrases, even if the core issue isn't fixed.
- **~1–2 minute delay.** Real-time intervention isn't actually instantaneous due to model processing lag.

## Consultant notes

- Threshold tuning after go-live is normal and expected. Set the expectation with the client that the first 2–4 weeks in production are the tuning period. The initial threshold will almost certainly generate either too many alerts or too few until real conversation data informs a better setting.
- "I understand" gaming is real enough to mention in agent coaching, carefully framed. Sentiment scores improve when agents use empathy phrases regardless of whether the underlying issue is resolved. Supervisors need to know this when interpreting alert patterns.
- Supervisor ratio matters for whether this feature delivers value. At 1 supervisor per 200+ agents, alerts will stack up faster than they can be acted on. If the client's supervisor coverage is thin, set expectations about alert response rate before positioning this as a real-time intervention tool.

---

*Source last updated: 2026-04-30 | Worth revisiting after threshold tuning, sentiment model updates, or supervisor feedback on alert accuracy*
