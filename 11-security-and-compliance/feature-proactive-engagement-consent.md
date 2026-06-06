# Proactive Engagement Consent Management

**Category:** Security and Compliance
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/proactive-engagement-manage-consent

## What it does
Tracks customer opt-out preferences for proactive outbound voice calls and SMS, and blocks any proactive delivery to a customer who's opted out. Consent is checked at the point of delivery, whether the request comes from the proactive engagement APIs, a file upload, an MCP endpoint, or a Customer Insights journey.

## Key facts
- All consent records sit under the **PES** compliance profile. Proactive engagements are treated as transactional with implicit opt-in — customers are assumed to have consented unless they explicitly opt out.
- Opt-out records are created automatically in two cases: an inbound SMS opt-out (e.g. the customer replies STOP) creates an SMS opt-out; a conversation tagged with the **Do not contact** disposition code creates an opt-out on the relevant channel.
- You can also create, edit, and bulk-upload opt-out records manually from the consent management page (Copilot Service admin center > **Productivity** > **Proactive engagement** > **Consent** > **Manage**).
- Bulk upload exists mainly to import an existing do-not-call list when migrating from another system.
- Voice and text consent are managed separately — opting a customer out of one channel doesn't opt them out of the other unless the trigger applies to both (the Do not contact disposition can).
- Requires the Omnichannel administrator role, and proactive engagement must already be configured.

## When to use / skip
If you're running any proactive outbound — voice or SMS — you need this; it's the mechanism that keeps you on the right side of telecom and do-not-call regulations. There's no real "skip" here for a live outbound programme. The only time it's irrelevant is if you're inbound-only.

## Configuration decisions
- Decide how you seed the initial opt-out list — almost always a bulk upload of the client's existing do-not-call data before the first campaign goes out.
- Agree which disposition codes map to **Do not contact**, and make sure agents actually use them; the automatic opt-out depends on it.
- Confirm who owns ongoing opt-out hygiene operationally after go-live — this is a compliance task, not a set-and-forget config.

## Gotchas
- The implicit opt-in model means the system will happily dial or text anyone who isn't on the opt-out list. If your jurisdiction or the client's policy requires explicit opt-in, the platform won't enforce that for you — you have to manage the inbound list yourself and only load consented contacts.
- Microsoft is explicit that compliance is the organisation's responsibility, not the platform's. The consent check stops opted-out deliveries, but maintaining accurate lists and honouring opt-outs promptly is on you.
- Voice and SMS opt-outs being separate trips people up — a customer who texted STOP can still be called unless the Do not contact disposition was used or a voice opt-out was recorded.
- Migrated do-not-call lists are only as good as the upload. If the bulk import misses records, those customers will get contacted on the first campaign.

## Consultant notes

- Clients routinely scope proactive outbound without budgeting for the consent/do-not-call migration. Get the existing opt-out list identified and mapped early — it's a data exercise, and if it's not ready the first campaign either slips or goes out non-compliant.
- The implicit opt-in default surprises people in UAT, especially in stricter regulatory regions. Walk legal/compliance through it before sign-off so there are no nasty surprises about who can be contacted.
- The Do not contact disposition is the quiet dependency. If agents don't apply it consistently, your automatic opt-out capture leaks and the do-not-call list drifts out of date. Bake it into agent training and QA, not just the admin config.
- Post-go-live, treat opt-out maintenance as a named operational responsibility. Regulators care about how promptly opt-outs are honoured, and "the system handles it" isn't a defence if the inbound list is stale.

---

*Worth revisiting after the next release wave — proactive engagement is moving fast and the consent model may tighten.*
