# Conversation Intelligence Dashboard

**Category:** Analytics & Reporting
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/ci-overview

## What it does
The Conversation Intelligence dashboard applies AI analysis to conversation transcripts and recordings to surface patterns, insights, and coaching opportunities that aren't visible in standard operational metrics. It processes voice call transcripts to identify keyword mentions, talk-to-listen ratios, competitor mentions, customer sentiment trends, and topic clusters. The output is a set of reports that help managers understand what's being said in conversations at scale, not just how long they took or how they were scored.

## Key facts
- Requires voice transcription to be enabled (Azure AI Speech) — Conversation Intelligence analyses transcript content; calls without transcription are not included
- Key features: call recording playback with transcript highlighting, keyword and phrase tracking, topic discovery (AI-clustered from transcript content), talk-to-listen ratio per agent, sentiment trend over the call, competitor mention detection
- Accessible to supervisors and managers from the Copilot Service Admin Center analytics section or via a dedicated model-driven app page
- Unlike the real-time supervisor dashboards, Conversation Intelligence is post-conversation — it analyses completed calls, not live ones
- Data latency: transcript processing and CI analysis typically completes within a few hours of conversation end; not available immediately after a call
- Keyword tracking requires administrators to define keyword/phrase lists (competitors, products, escalation phrases) — the system doesn't auto-discover keywords for tracking without configuration
- Topic discovery does not require keyword setup — it clusters conversations by semantic similarity automatically using AI
- Requires a Conversation Intelligence licence (included in some D365 Customer Service Enterprise tiers; verify per the client's licence agreement)

## When to use / skip
Use for voice-heavy contact centres where understanding what agents and customers say at scale is valuable — identifying training opportunities, tracking product issue mentions, monitoring competitor intelligence, or spotting policy non-compliance in agent language. The insight type is qualitative at scale, not operational KPIs.

Less useful for digital-channel-only deployments where transcripts already exist as text and can be searched directly. The AI processing adds most value for voice calls where manual review at scale isn't feasible.

## Configuration decisions
- Enable voice transcription in the voice workstream before expecting Conversation Intelligence data — transcription is the prerequisite, not an automatic enabler
- Define keyword categories based on the client's priorities: competitor names, product names, escalation phrases ("speak to a manager"), compliance-required phrases ("I confirm your consent"), profanity
- Set up agent and team filtering so managers see only their own team's conversations in CI — without this, a manager in one business unit can see sensitive call content from another
- Configure the data retention period for CI data (transcript analysis results) in alignment with the overall data retention policy
- Test topic discovery accuracy with a sample of real conversations after several weeks of data accumulation — topic clusters need sufficient volume to be meaningful

## Gotchas
- Conversation Intelligence data is a few hours behind real time. If a manager wants to review a call that just happened, CI won't have it yet. For immediate post-call review, use the call recording playback in the active conversation record, not CI.
- Keyword lists must be actively maintained. If a competitor launches a new product or an internal policy phrase changes, the keyword list doesn't update itself. Assign a periodic keyword list review to whoever owns CI.
- Topic discovery quality depends on transcription accuracy. If the Azure AI Speech model has low accuracy for the client's customer accent profile or industry terminology, the transcript text that CI analyses is poor quality and topic clusters will be unreliable. Fix transcription accuracy before deploying CI for serious insight.
- Talk-to-listen ratio is an average metric that doesn't distinguish between natural pauses, hold time, and active listening. Two calls with the same ratio can represent very different conversation behaviours. Use it as a directional signal, not a precise measure.
- CI reports include transcript content that may contain PII (customer names, account numbers spoken aloud). Access to CI should be restricted to roles that are authorised to access call content — not all supervisors necessarily need access to transcript-level detail.

## Consultant notes

- Set up Conversation Intelligence late in the project, not early. It needs real conversation data to be useful, and the transcript quality needs to be validated first. A CI dashboard configured in week two of go-live, pointing at a handful of test calls with mixed transcription quality, tells you nothing useful and creates a poor first impression of the feature. Wait until there are a few weeks of live call data and transcript accuracy has been verified.
- The business case for CI is usually around quality and coaching efficiency — managers can review 200 calls per week by searching for keywords and listening to flagged moments, rather than listening to 200 calls end-to-end. Frame it as a time multiplier for quality management, not as a surveillance tool. The framing matters for agent trust.
- Competitor mention tracking is one of those CI features that excites sales and commercial leadership when they see it. Make sure expectations are realistic: CI can tell you that "Competitor X" was mentioned in 12% of calls this week; it can't tell you what the context was without a manager listening to those calls. It's a signal, not an answer.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft expands Conversation Intelligence to digital channels or adds real-time CI processing*
