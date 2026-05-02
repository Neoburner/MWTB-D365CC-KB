# Internal Chat (Agent-to-Agent)

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/agent-internal-chat

## What it does
Internal chat lets agents send text messages to other agents or supervisors within CSW without leaving the application or interrupting the current conversation. It's a lightweight peer-to-peer messaging layer built into the omnichannel workspace, not a full collaboration tool, but sufficient for quick questions, handover notes, or flagging a supervisor during a live interaction.

## Key facts
- Available from the CSW interface via the chat icon in the navigation bar: agents can search for colleagues by name and open a direct message thread
- Internal chat threads are separate from customer conversations: messages go to the agent/supervisor directly, not into the customer's conversation record
- Agents can have internal chat conversations running simultaneously with customer-facing conversations: it doesn't occupy a session slot or consume conversation capacity
- Messages are stored in Dataverse against the internal chat activity record, not the omnichannel conversation record
- Internal chat is distinct from the Teams chat integration: internal chat is within CSW only; Teams integration requires the Teams collaboration features configured separately
- No file sharing, no voice/video: text-only messaging
- Supervisors can initiate internal chat to agents without the agent needing to start it first
- Notifications for internal chat messages appear as toast notifications in CSW: same visual format as incoming conversation notifications, but with a different icon
- Chat history is retained but not indefinitely: subject to the same Dataverse retention policies as other records

## When to use / skip
Use for quick in-workspace agent communication during live interactions, "how do I handle X", "can you cover queue Y", "I'm escalating to your queue now." It's faster than switching apps to Teams or Outlook for a quick question while handling a customer.

Not a replacement for Teams for collaboration, file sharing, or group communication. Don't position it as a full internal messaging solution, it's a lightweight adjunct to the agent workspace.

## Configuration decisions
- Internal chat is enabled by default in CSW if omnichannel is provisioned: no separate configuration step is required to enable the feature
- Check whether the client's IT/security policy restricts internal messaging within business applications: this is rare but can apply in regulated environments
- Train agents and supervisors on the notification behaviour: internal chat notifications look similar to incoming customer conversation notifications; agents need to learn to distinguish them

## Gotchas
- Internal chat notifications use the same toast format as incoming conversation alerts. Agents who are new to CSW sometimes accept an internal chat message thinking it's a customer conversation, or miss it because they've learned to focus on conversation notifications. Distinguish these clearly in training.
- Internal chat does not appear in conversation transcripts or the customer record. If an agent uses internal chat to communicate something important about a specific customer case (e.g., "I've agreed a refund for this customer"), that information doesn't attach to the case automatically. Agents who want to preserve internal discussion against a case record should use case notes, not internal chat.
- Internal chat is available to agents with CSW access but the chat history is visible to admins with Dataverse access. Agents should understand that internal chat is not private in a compliance or legal discovery context.
- No group chat: internal chat is 1:1 only. For team broadcasts or group announcements, use Teams or a different channel.

## Consultant notes

- Internal chat is a small feature that gets outsized adoption if you demonstrate it in agent training. Agents quickly discover it's faster than switching apps for a quick question during a live call. Demo it as "the quick-question tool for when you're on a call and need to ask a colleague something without putting the customer on hold." That framing lands.
- The notification ambiguity with customer conversation alerts is worth addressing explicitly in training rather than leaving agents to figure it out. A simple diagram showing the difference between a customer conversation notification and an internal chat notification prevents the first week's confusion.
- If the deployment includes Teams integration (feature-teams-voice-consult.md, feature-teams-phone-integration.md), internal chat and Teams serve different purposes and both are valid. Internal chat is for within-CSW quick messages; Teams is for richer collaboration, file sharing, and broader team communication. They don't compete: clarify both in the agent and supervisor training.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds group chat or file sharing to the internal chat feature*
