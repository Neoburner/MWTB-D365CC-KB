# Email Channel

**Category:** Digital Messaging
**Applies To:** Both (Standalone and Embedded)
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/set-up-email-channel

## What it does
Enables customers to contact your organization via email and routes incoming messages to support agents within D365 Contact Center. Email conversations are tracked as records and linked to cases, maintaining full message history and attachments. Unlike the standard Dynamics email activity (used for internal communications), the email channel is purpose-built for customer-facing support workflows.

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
Use the email channel when you want to capture and route customer inquiries arriving via email into your case management system. It's ideal for organizations that receive customer email outside of a website contact form. Skip email if your primary intake is through web forms, chat, or phone—the channel is best suited for async customer-to-agent workflows. Email is slower than chat for real-time support but works well for complex issues requiring documentation and longer response times.

## Configuration decisions
- Which Exchange mailbox(es) to use for incoming customer email—dedicated per queue or shared?
- Email threading behavior: automatic grouping of replies or new case per email?
- Attachment storage location: inline in conversation or linked file storage?
- Email forwarding rules: auto-respond to confirm receipt, or silent receipt?
- Queue assignment: round-robin distribution, skill-based routing, or load balancing?
- Escalation flow: when to create a case record vs. remaining email-only?

## Gotchas
- Email channel setup requires Exchange Admin access; delegate the mailbox configuration to your Exchange team early
- Email threading can fail if the original case is closed or archived; customer replies may create new cases instead
- Delayed email delivery (hours, not minutes) is normal due to Exchange processing and D365 sync frequency
- Removing an email channel mailbox will not automatically delete historical cases; they become orphaned
- Email headers and metadata from external mail systems (like SPF, DKIM failures) are not visible to agents and can't be used for filtering
- Unicode and special characters in subject lines may not display correctly in some email clients after processing

---

*Source last updated: 2026-04-30 | Review when: feature deprecation notice issued or Exchange version support changes*
