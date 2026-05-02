# Third-Party Bot Integration (Direct Line)

**Category:** Self-Service / AI Bots
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-third-party-bot

## What it does
Third-party bot integration connects a non-Microsoft bot platform (IBM Watson, Google Dialogflow, Amazon Lex, Nuance, Genesys, or any custom bot) to D365 Contact Center as a self-service channel. The integration is channel-agnostic — the third-party bot handles the customer conversation, and when escalation to a human agent is needed, it hands off through D365 Contact Center's routing engine using the Direct Line API or the omnichannel bridge.

## Key facts
- D365 Contact Center supports third-party bots via the Bot Framework Direct Line channel and the omnichannel messaging bridge — both methods route through unified routing to human agents
- The third-party bot must implement the escalation handoff in its own framework — D365 provides the receiving endpoint; the bot developer writes the escalation trigger
- Context transfer from third-party bot to agent: the bot sends a structured payload at escalation time; the fields and format must be agreed between the bot developer and the D365 implementation team
- No native connector exists for specific third-party platforms — each is a custom integration using the Direct Line API
- The bot lives outside D365 licensing — third-party bot platform costs are separate from D365 Contact Center licensing
- Bot analytics and conversation data from the third-party bot are not automatically captured in D365 — only the post-escalation human agent conversation is stored in Dataverse
- For voice channels, third-party IVR/voice bot integration follows a different pattern (SIP bridge or TTS/ASR via ACS) — Direct Line is a text channel protocol

## When to use / skip
Use when the client has an existing third-party bot investment they are keeping (Dialogflow, Lex, Watson, Nuance) and needs it to hand off to human agents in D365 Contact Center. This is the integration path, not a feature choice — the client's bot platform is already decided, and this is how you connect it to D365.

Don't scope third-party bot integration as an alternative to Copilot Studio for new builds — it requires developer effort on both the bot platform side and the D365 side, and produces less integrated analytics.

## Configuration decisions
- Agree the escalation handoff protocol with the bot platform team early — the message format, triggering conditions, and context payload fields need to be defined before either side builds
- Configure a workstream in D365 that handles bot-escalated conversations — this can be the same workstream as direct customer contacts or a separate one with different routing rules
- Define what context the bot will pass at escalation: at minimum, customer identifier, intent/reason for escalation, and a summary of the bot conversation; optionally include entities collected (account number, order ID, etc.)
- Test the escalation path under load — third-party bot escalation at high volume can surface timing and queuing issues that don't appear in unit testing
- Decide on bot conversation data retention — if the third-party bot stores conversation history, align its retention policy with D365 and GDPR requirements

## Gotchas
- The "handoff" is only as good as what the bot sends. If the third-party bot doesn't package context properly, the agent gets a blank Customer Summary and no conversation history. This is the most common complaint from agents after a third-party bot integration goes live — the bot escalates, but the agent has no idea what the customer already said.
- D365 analytics will not include the bot conversation portion — only post-escalation data is captured. If the client expects unified bot + human analytics in D365, that's not possible without building a custom data pipeline from the third-party bot into Dataverse.
- Conversation ID continuity across the handoff is not guaranteed. The third-party bot has its own conversation ID; D365 creates a new conversation record at escalation. Linking them for reporting requires a custom entity or a shared context field passed at handoff.
- For voice third-party bots (IVR systems from Nuance, Genesys, etc.), the integration path is fundamentally different from text chat integration. SIP trunk configuration and audio path handoff are separate from the Direct Line approach. Don't conflate the two.
- Third-party bot platform outages or API failures will prevent escalation. The bot should handle escalation failures gracefully (inform the customer, offer a callback or other channel) rather than silently failing.

## Consultant notes

- Context packaging is always the risk in third-party bot integrations. The D365 side is straightforward — configure the workstream, test the endpoint, done. The bot platform side, and specifically the escalation payload, is where projects go wrong. Get a working test escalation with real context passing done early in the integration phase, not in the week before go-live. If the bot developer hasn't implemented context packaging yet, that's a scope item that needs tracking.
- Analytics coverage gaps are worth flagging explicitly with the client. They will often assume that D365's conversation analytics cover the full interaction — including the bot conversation. They don't. If the client wants to see abandonment rates in the bot, containment rates, or end-to-end handle time including bot time, that data has to come from the third-party bot platform, not D365. Build this expectation into the reporting design conversation.
- If the third-party bot platform has its own routing and queue management (Genesys, Five9, etc.), clarify early whether D365 unified routing is replacing that or running alongside it. Dual routing systems are a design problem — agree the architecture before building.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft releases native connectors for specific third-party bot platforms*
