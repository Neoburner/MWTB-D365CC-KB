# Feedback Agent (Customer Feedback Survey Agent)

**Category:** Copilot and AI
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/use-feedback-agent-chat-digital-channels

## What it does
A Copilot Studio-based survey agent that collects and analyses customer feedback across voice, chat, email, and digital channels. It uses generative AI to tailor survey questions to context and automatically triggers at the end of a conversation without redirecting the customer out of the chat window.

## Key facts
- GA: October 31, 2025
- Built on Copilot Studio — you configure questions and branching logic in the visual editor
- Survey agent must be published in Copilot Studio before it can be added to a workstream
- Enabled and configured in Copilot Service admin center, not directly in Copilot Studio
- Triggers automatically at conversation end — no agent action required
- Stays within the existing chat window (no redirect, no new tab)
- Supports voice, live chat, email, and digital channels
- Supervisors can act on feedback in real time

## When to use / skip
Use this if the client wants in-channel post-conversation surveys without the overhead of a third-party feedback tool. The native integration keeps CSAT collection clean and in-context. Skip it if the client already runs a mature survey programme via a dedicated platform (e.g. Qualtrics, Medallia) and doesn't want to migrate survey logic into Copilot Studio.

## Configuration decisions
- Which workstreams should trigger the survey — not every channel needs it
- Survey question design and branching logic in Copilot Studio
- Whether to use generative AI question tailoring or fixed questions
- What to do with the collected data downstream — Power BI, Dataverse, or export

## Gotchas
- The agent must be published in Copilot Studio first — adding an unpublished agent to a workstream will silently fail or error at runtime
- Each workstream gets its own survey agent assignment — there's no global default
- Generative AI tailoring means survey text isn't fully deterministic; worth flagging to clients who want exact wording control
- Voice channel survey experience differs from chat — the "staying in the same window" benefit doesn't apply to voice

## Consultant notes

- Clients often assume this replaces their existing post-call IVR survey — it doesn't work the same way for voice. Be clear upfront that the voice experience is different from the chat/digital in-window flow.
- The Copilot Studio dependency catches implementers out at UAT: the survey agent needs its own publish cycle, separate from the main bot. Build that into the release checklist.
- Worth confirming with the client who owns Copilot Studio in their organisation — if it's the Power Platform team rather than the contact centre team, there's a coordination dependency that slows down iteration.
- Post-go-live, survey completion rates tend to drop if the agent fires on every interaction regardless of outcome. Discuss with the client early whether they want conditional triggers (e.g. only after escalation, or only for resolved conversations).

---

*Review if Copilot Studio survey runtime behaviour changes in a future release wave*
