# Communication Panel

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/communication-panel

## What it does
The communication panel is the control strip within the Active Conversation screen where agents interact with the live channel — accepting/ending calls, typing chat messages, using hold/mute, transferring, consulting, and accessing quick replies. It's the channel-specific UI layer that renders inside CSW depending on what type of conversation is active. Voice conversations get a dialpad-style panel with call controls; digital conversations get a message input pane with formatting and attachment tools.

## Key facts
- Renders automatically within the Active Conversation screen based on channel type — no separate configuration to surface it
- **Voice controls:** accept, end call, hold, mute, dialpad (for DTMF/transfer), blind transfer, consult transfer, record/pause recording, mute customer
- **Chat controls:** message input with text formatting, emoji, file attachment, typing indicator, read receipt (channel-dependent), quick replies access, end conversation
- **Email controls:** reply composer with rich text, CC/BCC, attachment, send — renders inline in the conversation form
- Transfer and consult buttons are present in all channel panels; behaviour differs (voice consult keeps the original call on hold, chat consult opens a secondary session)
- Quick replies are accessible from a button in the chat panel — they load the configured quick reply library filtered by keyword or tag
- The panel is not resizable by the agent — its dimensions are fixed by channel type
- Keyboard shortcuts for common panel actions: accept (Ctrl+Alt+A), end (Ctrl+Alt+E), hold (Ctrl+Alt+H), mute (Ctrl+Alt+M)

## When to use / skip
Agents use the communication panel for every live interaction — it's the interaction interface, not a feature they opt into. The design decisions are around what's enabled within it: transfer options, recording controls, quick replies availability, and whether consult is enabled for the channel.

## Configuration decisions
- Enable or disable recording controls in the voice panel at the workstream level — if calls are recorded automatically, showing a manual recording button to agents can cause confusion about when they're being recorded
- Configure transfer options to show only permitted queues and agents — an unrestricted transfer list makes it too easy to route conversations incorrectly
- Enable quick replies for chat channels and make sure the quick reply library is populated before go-live; an empty library undermines the feature
- Decide whether to enable the consult capability for digital channels — chat consult opens a second participant in the conversation, which some clients want (supervisor involvement) and others don't (confuses the customer)
- For voice, configure whether agents can see and use the dialpad during a live call (needed for DTMF actions like interacting with IVR systems during a transfer)

## Gotchas
- Hold vs mute are different and agents conflate them. Hold stops the conversation (customer hears hold music if configured, agent cannot hear customer). Mute silences the agent's mic but the call stays live. Both are needed; make sure training covers both and when to use each.
- The communication panel does not show if CSW loads but the omnichannel session fails to initialise properly. Agents see the conversation form but no panel. This is usually a network issue (blocked URLs in the allowlist) or a provisioning problem with the omnichannel configuration. Don't treat it as a form customisation issue.
- Chat quick replies search is case-sensitive in some versions. "Hello" and "hello" return different results depending on how quick replies were tagged. Test the search before training agents on it.
- File attachment in chat is governed by the channel configuration — not all channels support all file types or sizes. WhatsApp, for example, has lower file size limits than web chat. Agents who try to attach a large file to a WhatsApp chat will see an error without a clear explanation of the limit.
- Voice recording pause/resume is available in the panel but does not suppress the ACS recording at the media level — it marks a pause in the transcript but the audio may still be captured depending on ACS configuration. For PCI or compliance use cases, verify that "pause recording" actually suppresses the audio, not just the transcript annotation.
- Email panel doesn't have a character limit indicator. Agents writing very long email replies won't know they've hit any channel limits until send fails.

## Consultant notes

- Hold music configuration is frequently overlooked. Agents know the hold button exists; whether the customer hears silence, a tone, or branded hold music is an admin configuration in ACS. If you don't set it up, the default is silence, which customers interpret as the call dropping. Ask about this early — it's a quick config step but takes time to source the audio file from the client's marketing or ops team.
- The transfer UI is one of the highest-impact training moments. Blind transfer vs consult transfer is not obvious to agents who haven't used a system with both. Spend time in training with live examples: blind transfer = gone, consult = you're in the middle, you leave when ready. Use the scenario pack to force agents to practise both.
- If the client has a contact centre with specialised teams (e.g., agents who are allowed to transfer to some queues but not others), design the transfer list configuration carefully before go-live. The default shows all available queues. Agents transferring to the wrong queue is the most common post-go-live complaint in first few weeks of operation.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds resizable panel support or changes channel-level attachment limits*
