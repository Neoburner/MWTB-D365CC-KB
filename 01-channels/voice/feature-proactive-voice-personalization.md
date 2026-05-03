# Proactive Voice Personalisation

**Category:** Voice
**Applies To:** Standalone
**Source:** [learn.microsoft.com — Contact customers proactively with personalized options](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/contact-customers-proactively-personalized-options)

## What it does
Adds richer configuration options to outbound proactive voice: three dial modes (Copilot lead, preview, progressive), throttling and pacing rules, and the ability to tie a Copilot agent into the outbound flow before escalating to a rep. Complements the core proactive voice engagement feature with the personalisation controls needed for production deployments.

## Key facts
- **Three dial modes**: Copilot lead dialing (AI agent handles the conversation, rep joins if needed), preview dialing (rep reviews record before dialling), progressive dialing (system dials automatically, rep is connected on answer)
- **Trigger options**: Customer Insights – Journeys integration (multichannel journey with contact centre as a channel), or direct API call
- **Throttling and pacing rules** configurable per proactive engagement configuration — controls call rate and concurrency
- **Copilot agent assignment**: define which Copilot Studio agent handles the initial outbound conversation, plus the skills/queues used when escalation to a rep is required
- Public preview: May 31, 2025 · GA: January 31, 2026 (2025 Wave 2)
- Standalone only — outbound voice is not available in embedded deployments
- Requires an outbound workstream and a proactive engagement configuration

## When to use / skip
Use this if the client is running any form of outbound proactive calling: collections, appointment reminders, customer service follow-up, or sales outreach. The Copilot lead dialing mode is the one worth trialling for high-volume outbound — it lets the AI agent handle the opening exchange and only escalates to a live rep when the customer engages. Skip if the contact centre is inbound-only or if the client hasn't yet procured a Standalone licence.

## Configuration decisions
- **Dial mode**: Copilot lead is highest automation; progressive is middle ground; preview gives reps the most control but lowest throughput — choose based on the client's outbound use case
- **Customer Insights – Journeys vs. API trigger**: Journeys is the right choice if the client already uses CI-J for marketing/service campaigns; API is the choice if a custom CRM or middleware is initiating the calls
- **Throttling rules**: set these conservatively at first — aggressive pacing on a new deployment will generate abandoned calls if rep capacity isn't sized correctly
- **Copilot agent selection**: the agent must already be built and published in Copilot Studio before it can be selected here

## Gotchas
- Copilot lead dialing requires a working Copilot Studio agent that's been tested for outbound conversation flows specifically — inbound agents don't automatically behave correctly in outbound scenarios. Test this early.
- Throttling misconfiguration is the most common go-live issue on outbound deployments. If the call rate exceeds available rep capacity and escalation is needed, calls will queue or be abandoned. Size rep capacity before tuning pacing.
- If using Customer Insights – Journeys as the trigger, the journey and the proactive engagement configuration must be aligned on which phone number field to dial. A mismatch here results in silent failures — the journey fires but no call is placed.
- Outbound workstreams are separate from inbound workstreams. Reps don't automatically appear in both — capacity profiles and queue assignment need to be configured explicitly for the outbound workstream.

## Consultant notes

- The dial mode decision is often treated as a technical configuration choice, but it's really a business process design question. Run the client through a concrete scenario for each mode before they decide. Copilot lead dialing sounds attractive but requires trust in the AI agent — most clients want to start with preview or progressive and move to Copilot lead after a few weeks of live data.
- Customer Insights – Journeys as the trigger is increasingly the expected pattern for anything campaign-based. If the client is already using CI-J, the integration is straightforward. If they're not, adding CI-J licences and configuration to the project scope just to handle outbound triggers is often not justified — the API path is simpler.
- Throttling and pacing rules are almost never set correctly on first deployment. Build a review of outbound call KPIs (answer rate, abandon rate, rep idle time) into the first-month hypercare plan. You'll need to adjust them based on actual performance.
- The Copilot agent for outbound must be tested against realistic outbound scripts. Clients tend to repurpose their inbound IVR agent, which has the wrong tone and wrong escalation triggers for an outbound scenario.

---

*Worth revisiting after each wave release — Copilot lead dialing capabilities tend to expand with new Copilot Studio releases*
