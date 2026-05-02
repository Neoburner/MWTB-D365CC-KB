# Instagram Direct Messages

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-instagram-channel

## What it does
Routes Instagram Direct Messages to Contact Center queues as cases. Customers reach support via their Instagram account; full conversation history is maintained. Uses Meta's Instagram Messaging API through a Meta Business Account.

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
Use Instagram if the customer base is active there and you want to meet them where they are. Good for product questions, order status, and visual troubleshooting. Skip it if your demographics don't use Instagram (B2B, elderly, enterprise), you can't hit the 24-hour SLA, or you're uncomfortable with Meta's compliance requirements.

## Configuration decisions
- Will you create a new Meta Business Account or link an existing one?
- Which Instagram Business Profile will you connect? One or multiple profiles?
- How will you handle the 24-hour messaging window? Automated responses, templated messages, or escalation to FAQ bot?
- Which D365 Contact Center queues will receive Instagram DMs?
- Will you enable rich media (images, videos) responses or text-only?
- How will you handle story replies (redirect to DM or ignore)?

## Gotchas
- Meta's 24-hour window is strict: messages sent after 24 hours without customer initiation are silently dropped.
- Instagram Business Profiles must comply with Meta's Community Standards; suspension kills messaging immediately.
- Customer identity ties to username; if they change it, historical conversation may not link.
- Customer attachments are metadata-only (links on Meta's servers); if Meta deletes the media, agents can't access it later.
- Rate limiting applies to high-volume accounts; check Meta docs for current API limits.
- Instagram DM notifications route through Meta's servers then get polled by D365; expect 1-5 minutes latency, not real-time.
- Customer conversations may include spam or inappropriate content; train agents on quick assessment and escalation.
- Agents can't delete customer messages; conversation history is permanent and visible to the customer.

## Consultant notes

- Instagram looks like Facebook on the surface (same Meta account, same Dev Portal) but has different rules, different approval processes, and different content restrictions. Don't let familiarity with the Facebook channel create false confidence here.
- Story reply expectations are a consistent client assumption to correct early. Instagram users reach out via story replies expecting it to land in support. It doesn't route to Contact Center: only inbox DMs do. Worth putting an auto-reply or redirect message in the channel description.
- The media attachment metadata limitation matters for long-term case management. Customer photos stored on Meta's servers aren't guaranteed to persist. If the client needs attachments for compliance or evidence purposes, they need a separate file capture process: this isn't handled natively.

---

*Source last updated: 2026-04-30 | Worth checking again if Meta API version changes or the 24-hour window policy updates*
