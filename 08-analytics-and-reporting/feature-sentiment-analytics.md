# Customer Sentiment Analytics

**Category:** Analytics & Reporting  
**Applies To:** Both  
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/omnichannel-analytics-insights

## What it does

Historical reporting dashboard that aggregates customer sentiment trends and analysis across conversations and channels. Tracks sentiment scores over time to identify satisfaction patterns, problem areas, and channel-specific or topic-specific sentiment degradation.

## Key facts

- Sentiment scale: 1-10 (1 = very negative, 10 = very positive)
- Sentiment data aggregates from individual conversations into trend and cohort reports
- Prerequisite: Sentiment analysis must be enabled in admin settings (separate toggle from real-time sentiment)
- Historical sentiment analytics are distinct from real-time sentiment shown during active conversations
- Reports show sentiment by channel, agent, time period, and topic
- Sentiment scoring is powered by Azure AI language services

## When to use / skip

Enable Sentiment Analytics when you want to measure customer satisfaction trends over time and identify problem areas by channel, team, or topic. Particularly valuable for contact centers that prioritize customer experience and want rapid feedback loops. Skip if you use external NPS surveys exclusively or lack the Azure AI capacity to process sentiment at scale.

## Configuration decisions

- Enable sentiment analysis in admin settings (distinct from real-time sentiment toggle)
- Configure sentiment analysis for relevant channels (chat, email, voice with transcription)
- Set sentiment score thresholds for alerts and escalation if desired (e.g., red flag at <3)
- Verify Azure AI language service is provisioned and accessible to D365 environment
- Configure analytics roles and permissions for who can access historical sentiment reports
- Set retention policy for historical sentiment data based on compliance requirements

## Gotchas

- Sentiment analytics require separate enablement from real-time sentiment display; both toggles must be on for full functionality
- Historical data only available after sentiment analysis is enabled; no retroactive scoring of past conversations
- Azure AI language service costs scale with conversation volume; budget accordingly for high-volume contact centers
- Sentiment scores reflect AI interpretation; accuracy varies by conversation clarity, language, and sentiment expressions
- Real-time sentiment (shown during call) and historical analytics come from same AI model but display differently
- Sentiment analytics may not work accurately on voice channels without enabling call transcription
- Disabling sentiment analysis stops new scoring but historical data remains available for 90+ days

---

*Source last updated: 2026-04-30 | Review when: Sentiment accuracy appears degraded or sentiment thresholds need adjustment*
