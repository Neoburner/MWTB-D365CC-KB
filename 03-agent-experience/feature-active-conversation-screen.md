# Active Conversation Screen

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/oc-conversation-screen

## What it does
The Active Conversation screen is the workspace the agent is in while a conversation is live. It's the same form as the Customer Summary but in its live-conversation state — the communication panel is docked to it, the Copilot side panel is available, and the form reflects the ongoing interaction. Once the conversation ends and the agent moves to wrap-up, the form shifts to post-conversation mode. The layout is a combination of the communication panel (left or bottom), the conversation form (centre), and the Copilot/productivity panel (right).

## Key facts
- The Active Conversation form combines the customer summary, live communication panel, and productivity tools (Copilot, knowledge search, scripts) in a single workspace
- For voice: the communication panel is docked at the bottom by default; for digital (chat, email), it docks in the left-hand pane
- The Copilot productivity panel appears on the right — includes Copilot suggestions, knowledge article search, and agent scripts if configured
- Notes section is available during the live conversation for agents to capture context; notes are saved against the conversation record
- Case creation button is present on the form — agents can create and link a case without leaving the active conversation
- Timeline tab shows the customer's activity history (previous cases, emails, conversations) in chronological order
- Conversation status bar at the top shows channel icon, queue, duration, and current sentiment indicator
- The form layout differs by channel — voice layout prioritises call controls; chat layout prioritises message history

## When to use / skip
This is the primary workspace for all live contact handling. There's no alternative screen for agents during an active conversation — everything is built into or accessible from this form. The relevant design questions are around what's visible in the productivity panel and how the form is customised, not whether to use it.

## Configuration decisions
- Decide which tabs to include in the conversation form beyond the default (Customer Summary, Notes, Timeline are standard) — each additional tab that auto-loads adds to the page load on conversation accept
- Configure the Copilot panel content via experience profiles — agents who don't need AI suggestions can have a simplified panel; agents handling complex queries benefit from knowledge search surfaced here
- Enable agent scripts in the productivity panel if the deployment has scripted workflows (complaints, compliance scripts, sales guides)
- Set up Quick Replies access within the communication panel for chat agents — these are surfaced from the productivity panel
- For voice deployments, decide whether to show the transcript panel in the active conversation (requires real-time transcription enabled and licensed separately)
- Configure the Notes field as required or optional based on QA requirements — if QA evaluators use conversation notes for scoring, make it visible and train agents to use it consistently

## Gotchas
- The Active Conversation screen and the Customer Summary are the same Dataverse form in different states. Customisations to one affect the other. If you add a section that only makes sense post-conversation, it'll also show during the live session — design the form to work in both states.
- The communication panel docking position is channel-dependent and not configurable by the agent or admin — it's determined by the channel type. Clients who want voice controls in the same position as chat controls can't have that without custom UI work.
- Real-time transcription in the conversation requires a separate licence (Azure AI Speech) and must be explicitly enabled in the voice workstream settings. Agents expecting to see a live transcript without this licensed and configured will see nothing.
- Notes entered during the conversation are stored against the conversation record, not the case or customer record. If agents want notes to persist on the customer or case, they need to create them via the Timeline or case form, not the conversation Notes field.
- Conversation duration shown in the status bar is wall-clock time from conversation start, not handle time. For voice, this includes IVR and bot time before the agent connected — agents sometimes think handle time metrics are inflated because of this.
- Closing the session (the X on the session panel) before the conversation ends does not end the conversation — it just hides it. The session reappears in the session panel. Train agents that ending a call or closing a chat in the communication panel is the right action, not closing the session tab.

## Consultant notes

- The layout of the Active Conversation screen is the first thing clients ask to change after a demo. Voice clients want bigger call controls; chat clients want more visible message history. The out-of-box layout is a reasonable compromise but not optimised for any specific channel. Be upfront that form customisation in Power Apps can adjust the form sections, but the communication panel position and docking behaviour is not currently configurable — that boundary trips up scope conversations.
- Notes vs case notes vs timeline entries is a distinction worth covering explicitly in agent training. These feel interchangeable to agents who are used to freeform note-taking in other systems, but in D365 they store in different places and surface in different reports. Define for each client which note type they expect agents to use and why, then stick to that in training and QA scoring.
- If the deployment has agent scripts, the right time to demonstrate them is in the context of the Active Conversation screen, not a separate admin training session. Agents learn scripts by following them during a practice conversation — showing the script panel in isolation misses the point. Build scripted conversations into the UAT scenario pack so agents see the panel in context.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft changes the productivity panel layout or adds configurable communication panel positioning*
