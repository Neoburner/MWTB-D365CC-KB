# Proactive SMS Engagement

**Category:** Digital Messaging
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/use-sms-channel-engage-customers-proactively

## What it does
Extends the proactive engagement CCaaS API to the SMS channel. Organisations can trigger outbound SMS conversations at scale, via the API, Customer Insights Journeys, MCP, or file-based upload, with full context passed to downstream AI agents or human reps.

## Key facts
- GA'd April 2026
- Built on top of the existing proactive engagement CCaaS API: not a standalone SMS feature
- Trigger methods: CCaaS API, Customer Insights - Journeys, MCP (Model Context Protocol), or bulk file upload
- Conversation context is passed automatically to the agent or rep who picks up the inbound reply
- Requires an existing SMS channel configuration in Copilot Service admin center
- SMS provider can be ACS, Twilio, or Infobip

## When to use / skip
Use this for event-driven customer outreach: appointment reminders, case status updates, payment confirmations, or re-engagement campaigns where the customer might reply and need to be routed. It's the right choice when you want the reply to enter unified routing and land with an AI agent or rep in context.

Skip it if your outbound SMS is purely one-way notification (no reply expected), in that case, standard outbound messaging via Power Automate is simpler. Proactive SMS is for scenarios where the reply matters and needs context.

## Configuration decisions
- Which trigger method fits your use case: API for real-time event-driven, Journeys for marketing orchestration, file upload for batch
- Outbound SMS workstream configuration: you need a dedicated outbound workstream for SMS: the standard inbound workstream won't do
- What context variables to pass with the outbound message (e.g. case ID, product, customer tier) so reps have context when the reply comes in
- Which SMS provider handles the outbound leg: confirm number type (long code vs short code) is appropriate for your outbound volume and geography

## Gotchas
- "You can start sending outbound text messages by configuring your SMS provider, defining outbound SMS workstreams": this isn't a minor step. The outbound workstream is a separate config from your inbound workstream. Don't assume your existing SMS setup covers it.
- File-based upload for bulk sends is handy for batch campaigns but doesn't support real-time context passing in the same way the API does. Test context handoff specifically for the trigger method you're using.
- SMS opt-out handling is still your responsibility. Proactive SMS doesn't automatically suppress sends to customers who've opted out of SMS communications: that has to be managed in your CRM or customer data layer before the send is triggered.

## Consultant notes

## Consultant notes

- Opt-out suppression is your problem, not D365's. Before any proactive SMS goes live, confirm with the client that their CRM or data layer is suppressing sends to opted-out customers before the trigger fires. This is the compliance landmine that causes the most post-go-live panic, and it's entirely outside the platform.
- The separate outbound workstream requirement catches everyone the first time. It's not obvious from the docs that your inbound SMS workstream won't handle outbound-initiated conversations: they're different workstream types. Build the outbound workstream into your setup checklist.
- For any client doing proactive SMS at meaningful volume, get legal sign-off on the message content, opt-out mechanism, and consent basis before go-live: especially in GDPR jurisdictions or the US (TCPA). The technical setup is the easy part.


---

*Worth checking whether the proactive engagement API gains voice channel support in the next wave: the pattern is being extended channel by channel.*
