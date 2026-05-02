# Real-Time Sentiment Analysis

**Category:** Copilot & AI  
**Applies To:** Both  
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-sentiment-analysis

## What it does

Live customer sentiment scoring on agents' and supervisors' screens during active conversations. Score updates in real-time as the conversation progresses, helping agents gauge mood and adjust approach to de-escalate or address frustration.

## Key facts

- Sentiment scale: 1-10 (1 = very negative, 10 = very positive; typically shown as color-coded indicator)
- Score updates live as messages are exchanged; latency typically 2-5 seconds
- Displayed in agent UI during conversation and on supervisor dashboard during monitoring
- Supported on chat and messaging channels; voice requires transcription enabled
- Requires Azure AI language service for real-time processing; incurs per-message costs
- Enablement toggle in admin settings is distinct from historical sentiment analytics

## When to use / skip

Enable to give agents live feedback on customer emotion. Helps them spot frustration and adjust approach to de-escalate. Essential for high-touch service where empathy and rapid response matter. Skip if you're purely task-focused over emotional intelligence, or if sentiment monitoring overloads agents in high-volume situations.

## Configuration decisions

- Enable sentiment analysis in customer service admin settings under AI capabilities
- Configure which channels display real-time sentiment (chat, email, messaging are primary; voice requires transcription)
- Verify Azure AI language service is provisioned, connected, and has adequate quota
- Set sentiment thresholds for visual alerts (e.g., red flag at sentiment <3, yellow at <5, green at 7+)
- Configure supervisor dashboard to display sentiment indicators alongside conversation monitoring
- Test sentiment scoring in non-production environment before rollout
- Train agents on interpreting sentiment signals and appropriate response strategies
- Document escalation protocols for consistently low-sentiment conversations

## Gotchas

- **Azure AI service costs.** Per-message processing incurs charges — budget accordingly.
- **Accuracy depends on message clarity.** Single-word messages or abbreviations score inaccurately.
- **Voice adds latency.** Call transcription adds 5–10 seconds to sentiment display.
- **Non-English scores are unreliable.** Customers typing in other languages may get inaccurate or neutral scores.
- **~2–5 second lag.** Scores update behind message sends, reducing perceived responsiveness.
- **Disabling doesn't wipe history.** Turning off sentiment removes live indicators but keeps historical data.
- **Customers may notice it.** Some find visible sentiment scoring intrusive during the conversation.
- **AI makes mistakes.** Misinterprets sarcasm, context, and informal language — expect occasional false positives and negatives.

## Consultant notes

- Test non-English accuracy explicitly if the client has multilingual queues before go-live. Sentiment scoring on non-English messages is significantly less reliable and a low score for a perfectly polite message in a less-common language is not something you want to explain during a QA review.
- Real-time sentiment for agents vs supervisor-triggered alerts are two different use cases configured in different places (see `feature-sentiment-alerts.md` for the supervisor side). Make sure the client understands both surfaces and which one serves which purpose.
- In high-volume, fast-paced channels like chat, the sentiment indicator can add cognitive overhead rather than value. Pilot it with a specific agent group before rolling out org-wide, and ask agents directly whether it's helping or distracting.

---

*Source last updated: 2026-04-30 | Worth revisiting when agent feedback indicates sentiment accuracy issues or Azure AI service capacity is reached*
