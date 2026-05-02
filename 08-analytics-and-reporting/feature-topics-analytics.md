# Topics Analytics (AI-Clustered)

**Category:** Analytics & Reporting  
**Applies To:** Both  
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/topics-dashboard

## What it does
AI auto-clusters conversations into topics based on content without manual tagging. Shows volume, resolution rate, CSAT, and AHT per topic.

## Key facts

- AI model automatically clusters conversations based on content similarity and semantic meaning
- No manual topic definition required; topics emerge from conversation analysis organically
- Metrics per topic: conversation volume, resolution rate, CSAT, average handle time, transfer rate
- Topics dashboard helps identify problem areas, pain points, and opportunities for process improvement
- Related to Customer Intent Agent feature for AI-driven intent recognition and routing
- AI model refines topic groupings over time as it processes more data

## When to use / skip
Turn this on to auto-discover what customers are calling about and find improvement opportunities without manual tagging. Great for organisations without established categories, wanting to validate existing ones, or spotting emergent needs. Skip if you prefer manual tagging, have minimal volume, or compliance rules forbid unsupervised clustering.

## Configuration decisions
- Enable topics clustering in analytics admin settings
- Set minimum conversation volume for topics (typically 50+ conversations)
- Review and refine auto-generated topics if needed
- Map topics to business areas or teams if you want
- Grant analytics and manager roles access to the topics dashboard
- Set up alerts for topics with low resolution or high abandonment

## Gotchas
- **Auto-generated topics may not match your business categories.** AI organises differently than you might.
- **Needs volume to work.** Typically 30-60 days before meaningful clusters emerge.
- **Topic tweaking is limited.** They're meant to be AI-driven and change as the model updates.
- **Topics can merge or shift.** As the model sees more data, it regroups.
- **Low-volume topics disappear.** Algorithm optimises clusters as they shrink.
- **Quality matters.** Fuzzy audio, poor text, or non-English conversations reduce accuracy.
- **All or nothing.** You can't selectively disable certain topics.
- **Seasonal drift.** Topics emerge and fade with seasonal patterns.

## Consultant notes

- Topics Analytics is a strong demo feature: the "look, AI found your top 10 contact reasons automatically" moment lands well. But set expectations about the 30–60 day warm-up period before meaningful clusters emerge. Clients who expect actionable insights on day one will be disappointed.
- The AI-generated topic names don't always map cleanly to the client's existing contact reason categories. That's fine: treat it as a discovery tool for finding gaps or emerging issues, not as a replacement for your existing classification taxonomy. Selling it as the latter creates a painful conversation when the categories don't line up.
- Low-volume contact centres (< 100 conversations/day) get poor topic accuracy. If volume is that low, topics analytics adds more confusion than insight: a simple manual tagging approach on a small sample gives you cleaner data with less noise.


---

*Source last updated: 2026-04-30 | Check this if: New customer segments emerge or topic clustering seems off*
