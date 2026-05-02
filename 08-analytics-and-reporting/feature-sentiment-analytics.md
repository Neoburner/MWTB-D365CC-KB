# Customer Sentiment Analytics

**Category:** Analytics & Reporting  
**Applies To:** Both  
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/omnichannel-analytics-insights

## What it does
Historical dashboard showing customer sentiment trends across conversations and channels. Tracks sentiment over time to spot satisfaction patterns, problem areas, and where sentiment is degrading by channel or topic.

## Key facts

- Sentiment scale: 1-10 (1 = very negative, 10 = very positive)
- Sentiment data aggregates from individual conversations into trend and cohort reports
- Prerequisite: Sentiment analysis must be enabled in admin settings (separate toggle from real-time sentiment)
- Historical sentiment analytics are distinct from real-time sentiment shown during active conversations
- Reports show sentiment by channel, agent, time period, and topic
- Sentiment scoring is powered by Azure AI language services

## When to use / skip
Turn this on if you want to track customer satisfaction trends and spot problem areas by channel, team, or topic. Essential for CX-focused operations. Skip if you rely only on external NPS surveys or can't process sentiment at scale.

## Configuration decisions
- Enable sentiment analysis in admin settings (separate from real-time sentiment)
- Configure which channels get sentiment analysis (chat, email, voice with transcription)
- Set sentiment thresholds for alerts if you want them (e.g., flag <3)
- Verify Azure AI language service is available to your environment
- Grant analytics and manager roles access to sentiment reports
- Set data retention policy based on compliance needs

## Gotchas
- **Sentiment analytics need separate enablement from real-time sentiment.** Both toggles must be on for full functionality.
- **No retroactive scoring.** Historical data only exists after you enable it.
- **Azure AI costs scale with volume.** Budget accordingly for high-volume centres.
- **AI sentiment is just interpretation.** Accuracy varies by conversation clarity, language, and how sentiment is expressed.
- **Real-time and historical use the same model.** They display differently.
- **Voice sentiment needs transcription.** Won't work accurately on voice without it.
- **Disabling analysis stops new scoring.** Historical data lingers 90+ days.

## Consultant notes

- Enable this at the same time as real-time sentiment: they're separate toggles but related capabilities. Clients who enable real-time sentiment for supervisor views and forget historical sentiment analytics lose the trend data that would let them identify whether sentiment is improving or declining over time. They're not interchangeable; you need both.
- Voice sentiment accuracy depends entirely on transcription quality. If the client's voice transcription has low accuracy (common with thick accents, industry jargon, or poor audio quality), sentiment scoring for voice will be unreliable. Set expectations around this clearly, particularly for clients who plan to use sentiment analytics as a quality or performance metric for voice agents.
- Azure AI language service costs are worth flagging for high-volume deployments. Sentiment scoring at scale adds up, and it's often not in the initial cost model. Check the estimated monthly conversation volume and run the numbers before go-live so the client isn't surprised by the Azure bill in month two.

---

*Source last updated: 2026-04-30 | Check this if: Sentiment accuracy drops or thresholds need tweaking*
