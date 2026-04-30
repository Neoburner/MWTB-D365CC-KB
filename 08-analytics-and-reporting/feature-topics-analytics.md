# Topics Analytics (AI-Clustered)

**Category:** Analytics & Reporting  
**Applies To:** Both  
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/topics-dashboard

## What it does

AI-powered automatic clustering of conversations into topics and themes based on conversation content, without requiring manual categorization. Surfaces metrics like conversation volume, resolution rate, CSAT, and average handle time aggregated by topic.

## Key facts

- AI model automatically clusters conversations based on content similarity and semantic meaning
- No manual topic definition required; topics emerge from conversation analysis organically
- Metrics per topic: conversation volume, resolution rate, CSAT, average handle time, transfer rate
- Topics dashboard helps identify problem areas, pain points, and opportunities for process improvement
- Related to Customer Intent Agent feature for AI-driven intent recognition and routing
- AI model refines topic groupings over time as it processes more data

## When to use / skip

Activate Topics Analytics to automatically discover what customers are calling about and identify improvement opportunities without upfront categorization work. Particularly useful for organizations without established categorization schemes, wanting to validate existing categories, or exploring emergent customer needs. Skip if you prefer manual topic management, have very limited conversation volume, or strict compliance requirements around unsupervised data clustering.

## Configuration decisions

- Enable topics clustering in analytics admin settings
- Configure minimum conversation volume threshold for topic creation (typically 50+ conversations)
- Review and optionally refine automatically generated topics for business relevance
- Map topics to business areas or support teams if desired for better organization
- Grant analytics and manager roles permission to view topics dashboard
- Set up alerts or KPI tracking for topics with low resolution or high abandon rates

## Gotchas

- Topics are automatically generated; they may not align perfectly with business categories or naming conventions
- Requires sufficient conversation volume (typically 30-60 days of data) for meaningful clustering to emerge
- Manual topic tweaking is limited; topics are intended to be AI-driven and subject to model updates
- Topics can change or merge as AI model processes more data and refines clusters dynamically
- Low-volume topics may disappear or merge as clustering algorithm optimizes group boundaries
- Topics work best with clear conversation transcripts; poor quality audio, text, or non-English conversations reduce accuracy
- Cannot selectively disable topics once enabled; all-or-nothing feature at analytics level
- Topic stability may vary; trending topics may emerge and fade based on seasonal patterns

---

*Source last updated: 2026-04-30 | Review when: New customer segments emerge or topics show unexpected clustering patterns*
