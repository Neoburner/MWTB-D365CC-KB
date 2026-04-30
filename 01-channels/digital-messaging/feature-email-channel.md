# Email Channel

**Category:** Digital Messaging
**Applies To:** Both (Standalone and Embedded)
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/set-up-email-channel

## What it does
Routes customer email to agents in Contact Center and tracks it as case records. Full history and attachments preserved. Unlike the standard Dynamics email activity (internal comms), this is built for customer-facing support.

## Key facts
- Requires Exchange Online or on-premises Exchange Server 2019+ with EWS (Exchange Web Services) enabled
- Email threading automatically groups replies and forwards to the original case conversation
- Attachments are preserved and stored within the case record
- Queue routing rules determine which agent receives an email
- Email conversations appear in the agent's contact center workspace as a unified conversation thread
- Support for HTML email bodies; plain text and rich media are both supported
- Delivery and read receipts are configurable per mailbox
- Maximum attachment size varies by Exchange configuration (typically 25 MB)
- Email channel requires a dedicated mailbox per queue (not shared organizational mailbox for initial setup)

## When to use / skip
Use email when you want to capture email inquiries into case management. Ideal if customers email you outside of a contact form. Skip it if primary intake is web forms, chat, or phone. Email is async and slower than chat but works well for complex issues needing documentation and longer response windows.

## Configuration decisions
- Which Exchange mailbox(es) to use for incoming customer email—dedicated per queue or shared?
- Email threading behavior: automatic grouping of replies or new case per email?
- Attachment storage location: inline in conversation or linked file storage?
- Email forwarding rules: auto-respond to confirm receipt, or silent receipt?
- Queue assignment: round-robin distribution, skill-based routing, or load balancing?
- Escalation flow: when to create a case record vs. remaining email-only?

## Gotchas
- Email channel setup requires Exchange Admin access; get your Exchange team involved early.
- Email threading fails if the original case is closed or archived; replies create new cases instead.
- Delayed delivery (hours) is normal due to Exchange processing and D365 sync frequency.
- Removing a mailbox doesn't delete historical cases; they orphan.
- Email headers and metadata (SPF, DKIM) aren't visible to agents and can't be used for filtering.
- Unicode and special characters in subject lines may not render correctly after processing.

---

*Source last updated: 2026-04-30 | Revisit if a feature deprecation notice lands or Exchange version support changes*
