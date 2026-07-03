# Proactive Delivery APIs (CCaaS)

**Category:** Integration & Extensibility
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/extend/api/ccaas_createsimpleproactivedelivery

## What it does
A set of Dataverse custom APIs for driving proactive outbound deliveries programmatically, without going through the proactive engagement UI. You submit contacts, the proactive engagement service dials or messages them per the configuration, and you poll for status. Three operations landed together: `CCaaS_CreateSimpleProactiveDelivery` (one contact, flat fields), `CCaaS_CreateProactiveBulkDelivery` (many contacts in one request), and `CCaaS_GetDeliveryTasks` (retrieve task status and outcomes).

## Key facts

- All three sit under `/api/data/v9.x/` on the org URL and need a Microsoft Entra ID bearer token from the same tenant as the Customer Service instance. Caller needs the Omnichannel agent or supervisor role.
- Every delivery is scoped by a `ProactiveEngagementConfigId` — that record fixes the dial mode, workstream, and outbound profile. You pull the ID from the Proactive Engagement Configuration table in Power Apps.
- `CCaaS_CreateSimpleProactiveDelivery`: single recipient, flattened contact attributes (name, phone numbers, address, time zone, priority). Mobile phone and name are required; most address fields are optional. Returns a delivery task.
- `CCaaS_CreateProactiveBulkDelivery`: takes a JSON array of delivery objects for a batch against one workstream. There's also a `CCaaS_CreateProactiveBulkDeliveryV2`. Use it instead of looping the single-delivery API.
- `CCaaS_GetDeliveryTasks`: GET by `DeliveryTaskId` (the GUID returned when the task was created). Returns status, retry info, contact-chaining state, and the individual deliveries under the task.
- `InputAttributes` on the create calls is a key-value JSON blob that flows into Copilot agent flows — this is how you pass personalisation (customer tier, account number, preferred language) into the outbound interaction.
- `Windows` lets you constrain when the call/SMS can go out. Omit it and the system defaults to a 24-hour window starting immediately.

## When to use / skip
Use these when proactive outbound is triggered by another system — a campaign engine, a billing event, a CRM workflow — rather than set up and run inside Contact Center. Reach for the bulk API whenever you've got more than a handful of contacts; the simple single-delivery API is for one-off or event-driven sends. Skip the lot if the client runs proactive engagement entirely from the built-in UI and list upload; you don't need to write code for that.

## Configuration decisions

- Decide which config record each integration points at — dial mode, workstream, and outbound profile all ride on the `ProactiveEngagementConfigId`, so one wrong ID sends work down the wrong pipe.
- Choose single vs bulk per integration. Anything batch-shaped should use bulk; don't loop the single API for a list.
- Decide whether the caller is a real user or a service identity, and provision it the Omnichannel agent/supervisor role — the token is per-user, not app-only.
- Work out how `Windows` maps to the client's quiet-hours and consent rules, because the default is "call now, for 24 hours".

## Gotchas

- The API does not manage consent or quiet hours for you. Microsoft is explicit: if you drive voice or SMS through these APIs, you own consent, do-not-call enforcement, and permitted contact hours. Pair this with `feature-proactive-engagement-consent.md` and don't let a client assume the API handles it.
- The bearer token must come from the same Entra tenant as the instance and carries a real user's roles — an app registration without the Omnichannel role will authenticate fine and then fail authorisation, which reads like a mystery 403.
- `Windows` timestamps decide when work actually goes out; leave them off and everything fires immediately, which is rarely what you want for a scheduled campaign.
- `GetDeliveryTasks` needs the task GUID from the create response — if the integration doesn't capture and store that ID, you've got no way to check status afterwards.

## Consultant notes

- The consent line is the one that bites. When a client wants API-driven outbound, the delivery mechanics are easy and the compliance side is where projects come unstuck. Make consent and quiet-hours handling an explicit workstream, owned by the client, and get it in writing that the API doesn't do it for them — otherwise it lands on you after go-live when a regulator or a complaint shows up.
- Get the `ProactiveEngagementConfigId` sourcing sorted early. Integrators tend to hard-code a GUID from the dev environment and then it doesn't exist in test or prod. Treat it as environment config, not a constant, from the first sprint.
- Push bulk over single-delivery in any design review. Teams default to the simple API because the payload is easier to read, then discover at load that per-contact calls don't pace well. If the volume is real, design against the bulk API from the start.
- The `V2` bulk variant exists — check which one the client's tenant actually exposes before you build against a signature, since the two aren't interchangeable.

---

*Source last updated: 2026-07-01 | Check this if: proactive engagement API surface changes, or the bulk V2 signature is finalised*
