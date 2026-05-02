# Proactive Voice Engagement

**Category:** Channels: Voice
**Applies To:** Standalone
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/overview-proactive-engagement

## What it does
Outbound calling framework that lets AI agents or service representatives call customers proactively, for appointment reminders, payment chases, case closure notifications, surveys, or any triggered engagement. Supports answering machine detection, predictive and preview dial modes, and SIP call outcome codes. Multiple components went GA between January and March 2026.

## Key facts
- Four trigger mechanisms: CCaaS API, Power Automate flows, Customer Insights Journeys triggers, AI agent MCP server (preview)
- Two campaign types:
  - **Single-channel, single-step**: one action on a contact segment, optional retry logic: entirely within D365 Contact Center
  - **Multi-channel, multi-step journeys**: conditional branching across voice, email, SMS, push over days/weeks: requires Dynamics 365 Customer Insights licence in addition to Contact Center
- Answering machine detection (AMD) is configured via a Copilot Studio system topic; when a machine is detected, the system plays a predefined message or ends the call
- SIP-based call outcome codes let you report on disposition (answered, AMD, busy, no answer etc.)
- Predictive dial mode and preview dial mode are both available
- Proactive engagement tables are available for custom Power BI reporting
- Separate from Proactive SMS (`feature-sms-proactive-engagement.md`): that feature handles digital outbound; this is voice outbound

## When to use / skip
Use this for any scenario where you need the platform to initiate voice contact rather than wait for inbound, collections, appointment reminders, fraud alerts, post-service surveys. Skip if you only need SMS/WhatsApp outbound (use Proactive SMS instead). If you need sophisticated multi-step journeys with branching across channels, you need Customer Insights Journeys licensed and configured alongside Contact Center.

## Configuration decisions
- Which trigger method fits your architecture: API integration, Power Automate, Customer Insights Journeys, or AI agent
- Predictive vs preview dial: predictive dials ahead of rep availability; preview shows the record first and lets the rep initiate. Preview is better for high-value or sensitive engagements
- AMD configuration: how should the agent handle a voicemail? Play a message, leave nothing, or hang up?
- Retry logic: how many attempts, at what intervals, before marking the engagement as failed?
- Reporting approach: use the built-in proactive engagement tables or build a custom Power BI report?

## Gotchas
- **Customer Insights Journeys is a separate licence.** Multi-step cross-channel journeys need it. Single-channel campaigns don't. Get this clear in scoping or you'll have a licence conversation mid-project.
- CCaaS API integration requires the contact center to be provisioned and API credentials managed correctly: not a trivial setup for non-Microsoft CRM customers.
- AMD is not 100% accurate. Voicemail systems vary; expect some false positives and set the Copilot Studio flow to handle edge cases gracefully.
- Predictive dial can spike concurrent call volume unexpectedly. Make sure your PSTN capacity and queue configuration can absorb it.
- Proactive engagement analytics reports are separate from the standard Historical Analytics dashboard: you need to check the proactive engagement tables, not look in the default dashboards.

## Consultant notes

- Licence mapping is where proactive voice projects go wrong early. Single-channel campaigns are within Contact Center. Multi-step cross-channel journeys need Customer Insights Journeys licensed and provisioned. Get this confirmed in writing before scoping: a mid-project licence conversation kills momentum.
- Predictive dial capacity planning is consistently underestimated. If the campaign dials ahead of agent availability, you can spike concurrent active calls well beyond what your PSTN capacity or queue configuration expects. Run a load estimate before go-live and sanity-check it with ops.
- Answering machine detection accuracy varies by target phone type, carrier, and region. Build a fallback strategy for AMD false positives (voicemails that get classified as answered) and false negatives (live answers that get classified as AMD). Set the client's expectation that AMD is "mostly right" not "always right" before they build KPIs around it.


---

*Review when Customer Insights Journeys integration patterns mature: the MCP server trigger for AI agent-led proactive engagement is still preview as of 2026wave1.*
