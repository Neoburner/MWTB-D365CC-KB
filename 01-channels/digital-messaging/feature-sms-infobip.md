# Infobip SMS Channel

**Category:** Digital Messaging
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/use-infobip-as-sms-channel

## What it does
Infobip is now a supported SMS provider in D365 Contact Center alongside ACS and Twilio. Admins configure Infobip accounts directly in the Copilot Service admin center, and the channel runs through the same routing and reporting infrastructure as the existing SMS channels.

## Key facts
- GA'd April 2026
- Configured in **Copilot Service admin center → Channels → Messaging accounts**: new Infobip SMS option appears here
- Supports inbound and outbound messaging
- Uses standard unified routing workstreams: no separate routing configuration required
- MMS is supported alongside SMS
- Reporting is unified with other SMS channels: no separate dashboard

## When to use / skip
Use this if the customer already has an Infobip relationship and wants to avoid migrating to ACS or Twilio. It saves a provider transition and lets you reuse existing Infobip number inventory and contracts.

Skip it if the customer has no existing Infobip account, ACS is still the simpler default choice when starting from scratch, as it's native to the Microsoft stack.

## Configuration decisions
- Infobip account credentials (API key, base URL): get these from the customer's Infobip portal before the admin center session
- Which Infobip numbers to attach to which workstreams
- Whether to run inbound-only initially or enable outbound from day one

## Gotchas
- Infobip number types (long code, short code, toll-free) have the same opt-in/opt-out and compliance implications as Twilio or ACS numbers: don't assume the Infobip relationship covers regulatory compliance on its own.
- If the customer switches from Twilio/ACS to Infobip, the workstream config survives but you'll need to re-test routing and re-verify inbound webhook delivery. Don't assume a like-for-like swap.
- Outbound proactive SMS via Infobip requires the proactive engagement CCaaS API setup separately: the Infobip channel alone doesn't enable outbound initiation.

## Consultant notes

## Consultant notes

- Infobip is most relevant when the client already has a relationship with them: existing number inventory, contracts, and account manager. In that case it saves a provider migration and is worth doing. If they have no existing Infobip account, ACS is the simpler default and there's no good reason to introduce a new vendor.
- Don't assume provider swaps are like-for-like. If a client is moving from Twilio or ACS to Infobip, re-test the full inbound and outbound flow: webhook delivery, message formatting, and opt-out handling can all behave slightly differently. Allow UAT time for it.
- Outbound proactive SMS via Infobip still requires the proactive engagement API setup separately. The Infobip channel configuration alone doesn't enable outbound initiation: this is a common misunderstanding when clients see "inbound and outbound messaging" in the docs.


---

*Worth checking after the next wave whether additional non-Microsoft SMS providers are added to the same pattern.*
