# Instagram Direct Messages

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-instagram-channel

## What it does
Connects Instagram Direct Messages as a contact channel, enabling customers to reach support via their Instagram account. Instagram DMs route to D365 Contact Center queues and are treated as cases, maintaining conversation history. Powered by Meta's Instagram Messaging API integrated through a Meta Business Account.

## Key facts
- Requires a Meta Business Account with Instagram Business Profile (not personal account)
- Requires Facebook channel configuration first; Instagram channel is an extension of Facebook integration
- Subject to Meta's 24-hour messaging window: agents can only send promotional or general messages outside 24 hours if the customer initiates a new conversation
- Supports text messages and media (images, videos) attachments sent by customers
- Within 24 hours of customer's last message, agents can send any message type freely
- After 24 hours: only templated messages or quick replies can be sent (set up in Meta Business Manager)
- Customer identity is linked to their Instagram profile; conversations are tracked per profile
- Sensitive business rules apply: Instagram DMs cannot be used for political, sexual, or restricted product advertising
- Instagram story replies cannot be routed to Contact Center (story DMs are not supported); only inbox DMs work
- Media attachment size limits follow Meta's standards: 4 MB per image, 16 MB per video

## When to use / skip
Use Instagram DMs if your customer base is active on Instagram and you want to meet them where they are. Instagram's visual nature makes it excellent for product questions, order status, and visual troubleshooting. Skip Instagram if your customer demographics don't use Instagram (B2B, elderly demographics, enterprise customers) or if you can't commit to the 24-hour response SLA. Also skip if you're uncomfortable managing the Meta Business Account compliance requirements.

## Configuration decisions
- Will you create a new Meta Business Account or link an existing one?
- Which Instagram Business Profile will you connect? One or multiple profiles?
- How will you handle the 24-hour messaging window? Automated responses, templated messages, or escalation to FAQ bot?
- Which D365 Contact Center queues will receive Instagram DMs?
- Will you enable rich media (images, videos) responses or text-only?
- How will you handle story replies (redirect to DM or ignore)?

## Gotchas
- Meta's 24-hour window is strict: messages sent after 24 hours without customer initiation are silently dropped (customer doesn't see them)
- Instagram Business Profiles must comply with Meta's Community Standards; suspended profiles lose messaging capabilities immediately
- Customer identity is tied to Instagram profile username; if customer changes their username, historical conversation may not link correctly
- Attachments sent by customers are metadata-only (links to media on Meta's servers); if Meta deletes the media, agents cannot access it later
- Rate limiting: Meta applies throttling on accounts with high volume; very high-volume support may hit API limits (check current limits in Meta documentation)
- Instagram DM notifications are routed to Meta's servers first, then polled by D365; latency can be 1-5 minutes vs. real-time chat
- Customer-initiated conversations may contain spam or inappropriate content; train agents on rapid assessment and escalation
- Instagram doesn't support agent ability to delete customer messages; conversation history is permanent and visible to customer

---

*Source last updated: 2026-04-30 | Review when: Meta API version changes or 24-hour window policy updates*
