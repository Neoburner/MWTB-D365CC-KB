# Email Configuration (Exchange / EWS)

**Category:** Administration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/set-up-email

## What it does
Email in D365 Contact Center is handled through the email channel — incoming emails route through unified routing to agent queues just like other channel types. The email channel connects to a mailbox (Exchange Online, Exchange on-premises via EWS, or forward-only SMTP), receives inbound emails as conversations, and sends outbound replies from within CSW. Configuration involves both the D365 side (email channel workstream, email template setup) and the email infrastructure side (mailbox credentials, server-side sync, approve email address).

## Key facts
- D365 uses Server-Side Synchronisation (SSS) to connect to Exchange Online or Exchange on-premises — SSS is configured in the Power Platform admin centre and processes email at the server level without requiring Outlook to be open
- For Exchange Online (Microsoft 365): SSS uses OAuth 2.0 authentication — no password storage; the connection uses Azure AD app registration
- For Exchange on-premises: SSS uses Exchange Web Services (EWS) with either OAuth (modern auth) or credentials-based auth; EWS endpoint must be reachable from Power Platform
- Email addresses used as contact centre inboxes (e.g., support@company.com) must be registered as Queue Mailboxes in D365 — each queue that handles email needs a dedicated mailbox
- Inbound email processing: SSS polls the mailbox on a regular schedule (every 5–15 minutes by default for standard; near-real-time with enhanced email processing) and converts new emails to conversation records
- Outbound email: D365 sends replies through the connected mailbox; the agent's D365 reply becomes an outgoing email from the queue mailbox address
- Email threading: D365 uses email conversation threading (matching by In-Reply-To and References headers) to link replies to existing conversation records — this is the mechanism for keeping a multi-email thread as one conversation
- Attachments: handled per the attachment configuration on the email workstream; see `feature-attachment-handling.md`

## When to use / skip
Use for any deployment where customers contact via email and those emails should be handled in D365 as routed conversations. Standard for any contact centre with an inbound support email address.

Not required for deployments where email is purely outbound (notifications, surveys) — outbound email without routing doesn't require the full email channel configuration.

## Configuration decisions
- Decide which mailboxes to route through D365 — not every company email address should be a D365 contact centre channel; specific support/service addresses are the right candidates
- Set up Server-Side Synchronisation in the Power Platform admin centre: create the email server profile for Exchange Online or on-premises, create mailbox records, and test and enable each mailbox
- For Exchange Online: create an Azure AD app registration for the SSS OAuth connection and grant the required Exchange application permissions
- For Exchange on-premises: ensure the EWS endpoint is reachable from Power Platform IP ranges — check with the client's network team; firewall exceptions may be needed
- Configure the email channel workstream: routing rules, queue assignment, SLA if applicable, and notification templates for agent assignment
- Set up email templates for common reply types (see `feature-email-templates.md`) before go-live — agents should not be writing all replies from scratch
- Test the full inbound/outbound loop in a staging environment: send a test email to the queue mailbox, confirm it creates a conversation record, reply from CSW, confirm the reply delivers to the sender's inbox and the threading header is preserved

## Gotchas
- SSS mailbox test and enable is a step that's easy to miss. The mailbox must be explicitly tested and enabled in the Power Platform admin centre — it's not automatic after configuration. A mailbox that isn't enabled simply doesn't process email, and this fails silently (no error message to the user, just no emails appearing).
- Exchange on-premises EWS requires Power Platform to reach the EWS endpoint over HTTPS. If the client's Exchange server is behind a corporate firewall that blocks external HTTPS access, SSS will not work. Confirm network access early — don't leave firewall configuration to the week before go-live.
- Email threading depends on correct email headers. Customers who reply to a D365-sent email from a thread context (forwarding the email rather than replying directly) may break the threading and create a new conversation instead of updating the existing one. Train agents to be aware of this and check for related conversations manually when a new email arrives about an existing issue.
- The SSS polling interval (5–15 minutes for standard) means inbound emails are not processed instantly. A customer who emails at 9:00 AM may not have their email appear in the agent queue until 9:10–9:15 AM. For SLA calculations, the conversation creation time (when D365 processes it) is used, not when the email was sent. Factor this latency into SLA configuration if strict response times apply.
- Outbound email replies come from the queue mailbox address (e.g., support@company.com), not from the individual agent's email address. Customers cannot reply to the agent directly — all replies go back to the queue mailbox and route again through D365. Make sure this is documented in customer communication footers.

## Consultant notes

- The Exchange on-premises EWS connectivity check should happen in the first week of the project, not the last. Firewall exception requests in corporate environments can take weeks to process through the client's network change management process. If you start the network configuration conversation in week eight of a ten-week project, you've created a go-live blocker.
- Server-Side Synchronisation test and enable is a mandatory step that is frequently skipped during dev/test setup (teams use Outlook-level sync or manual testing during development) and then missed in the go-live runbook. Add it explicitly as a named go-live action with a named owner.
- Email threading is reliable in standard reply scenarios but breaks in edge cases — auto-replies, forwarded threads, emails from systems that strip or alter headers (some CRM-to-CRM email routes). Include threading validation in the UAT script: test a full email thread (customer sends → agent replies → customer replies to agent's reply) and verify all messages appear in the same conversation record. Also test what happens when a customer forwards the email to a colleague who then replies.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft changes the SSS authentication model or the EWS endpoint requirements for on-premises Exchange*
