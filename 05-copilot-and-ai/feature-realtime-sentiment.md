# Real-Time Sentiment Analysis

**Category:** Copilot & AI  
**Applies To:** Both  
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-sentiment-analysis

## What it does

Live customer sentiment scoring displayed to agents and supervisors during active conversations. Score updates in real-time as conversation progresses, helping agents gauge customer mood and adjust their approach to de-escalate or address frustration proactively.

## Key facts

- Sentiment scale: 1-10 (1 = very negative, 10 = very positive; typically shown as color-coded indicator)
- Score updates live as messages are exchanged; latency typically 2-5 seconds
- Displayed in agent UI during conversation and on supervisor dashboard during monitoring
- Supported on chat and messaging channels; voice requires transcription enabled
- Requires Azure AI language service for real-time processing; incurs per-message costs
- Enablement toggle in admin settings is distinct from historical sentiment analytics

## When to use / skip

Enable Real-Time Sentiment Analysis to provide agents live feedback on customer emotion during interactions. Helps agents recognize when customers become frustrated and adjust approach to de-escalate. Essential for high-touch customer service environments where empathy and rapid response to negativity drive outcomes. Skip if your contact center focuses purely on task completion over emotional intelligence, or if sentiment monitoring creates cognitive overload for agents handling high volume.

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

- Real-time sentiment requires Azure AI service and incurs per-message processing costs; budget accordingly
- Sentiment accuracy depends on message clarity and length; single-word messages or abbreviations may score inaccurately
- Voice channel requires call transcription enabled; adds 5-10 second latency to sentiment display
- Customers typing in non-English languages may receive inaccurate or neutral scores
- Sentiment score updates may lag 2-5 seconds behind message send, reducing perceived responsiveness
- Disabling sentiment analysis removes live indicators but does not affect historical sentiment data
- Some customers may find visible sentiment scoring invasive or uncomfortable if they notice it during conversation
- Sentiment AI may misinterpret sarcasm, context, or informal language; occasional false positives/negatives expected

---

*Source last updated: 2026-04-30 | Review when: Agent feedback indicates sentiment accuracy issues or Azure AI service capacity is reached*
