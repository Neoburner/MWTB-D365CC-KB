# Power Automate — Custom Workflows

**Category:** Integration & Extensibility
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/power-automate-workflows

## What it does
Power Automate (formerly Microsoft Flow) is the low-code workflow automation platform that connects D365 Contact Center to other systems and automates processes triggered by D365 events. In the contact centre context, Power Automate handles: SLA breach notifications, case escalation workflows, survey dispatch after conversation end, post-conversation data sync to external systems, agent notification triggers, and any custom business process that requires data to move between D365 and another system automatically.

## Key facts
- Power Automate flows are triggered by Dataverse events (record created, record updated, status changed), by scheduled recurrence, or by HTTP requests from D365 plugins/APIs
- Common trigger events for Contact Center workflows: conversation ended, case created, case status changed, SLA warning/breach, survey completed, agent availability changed
- Flows can write to Dataverse (create/update records), send emails (via Office 365 connector), call external APIs (HTTP action), post to Teams, update external systems via their connectors, and trigger other flows
- Power Automate has 1000+ pre-built connectors for external services (Salesforce, ServiceNow, SAP, Azure services, third-party APIs)
- Flows run in the context of the connection account — the account whose credentials power the connector; this account needs appropriate permissions in both D365 and the target system
- Power Automate licences: basic flows require a Power Automate licence (sometimes included with D365 licences; verify per agreement); premium connectors and triggers require Power Automate Premium
- Flows have execution limits — action count per day, run duration limits — relevant for high-volume contact centres where every conversation could trigger a flow
- Flow run history and monitoring is available in the Power Automate portal; failed flows are logged with error details

## When to use / skip
Use Power Automate for any post-event automation that needs to span multiple systems or send notifications outside D365. It's the right tool for: SLA escalation emails, CRM data sync after a call, survey triggers, case routing notifications, and business rules that can't be expressed in D365 routing logic alone.

Skip (or use a simpler alternative) for: simple D365-to-D365 data operations (use business rules or plugins instead), real-time event requirements (Power Automate is near-real-time, not instantaneous), or complex stateful workflows (use Azure Logic Apps for complex stateful processes).

## Configuration decisions
- Map the automation requirements to specific Dataverse trigger events before building flows — each flow should have a clear trigger, a defined set of actions, and an error handling path
- Use separate flows for separate concerns — one flow per business process; monolithic flows that do 15 things are maintenance nightmares
- Configure run-only permissions carefully — flows that update Dataverse records or call external APIs should use a service account, not the flow creator's personal credentials
- Set up error handling in each flow: on failure, notify an administrator, log the error, and ideally retry the failed action
- Monitor flow execution quotas for high-volume contact centres — if a flow triggers on every conversation end and the contact centre handles 5,000 conversations per day, verify the trigger volume is within the Power Automate licence limits

## Gotchas
- Power Automate is near-real-time, not real-time. There's a delay between the Dataverse trigger event and the flow execution — typically seconds to minutes, sometimes longer under load. For time-sensitive automations (send SLA warning before breach), factor this delay into the trigger timing.
- Connection account permissions matter. A flow that updates a Salesforce record runs as the Salesforce user whose credentials are in the connector. If that user's Salesforce permissions change, the flow fails. Service accounts with dedicated credentials are more reliable than personal user connections.
- Flow errors often fail silently unless error alerting is configured. A flow that's supposed to sync conversation data to an external system and fails will simply stop syncing — without any visible error in D365 or the agent interface. Monitor flow run history proactively.
- Power Automate Premium licence is required for Dataverse triggers. Check whether the client's D365 licence bundle includes Power Automate Premium — if not, flows triggered by D365/Dataverse events require a separate Power Automate licence per user (for user-bound flows) or per organisation (for automated flows with appropriate plans).
- Flows run within an execution context that has limits: 100,000 actions per 24 hours for some licence types, 30 days maximum flow run duration, 5 minutes maximum for individual action steps. High-volume flows at large contact centres can hit these limits.

## Consultant notes

- The first Power Automate conversation with a client should establish what they expect to automate and whether Power Automate is the right tool for each. "We want everything automated" is a design conversation, not a flow-building exercise. Map each automation requirement to a trigger event, a set of actions, and the business outcome — then prioritise. Not every automation needs to be built for go-live.
- Service account management for flow connections is important and rarely discussed. Every flow that connects to an external system runs as a specific user account in that system. If that account is someone's personal AD account and they leave the organisation, the flow breaks. Use purpose-created service accounts for flow connections — agree this with the client's IT team in discovery.
- Volume testing is the most neglected part of flow design. A flow that runs 5 times per day in UAT with 10 users behaves very differently from a flow that runs 5,000 times per day in production with 500 agents. For high-volume contact centres, test flow performance under realistic load before go-live and verify the trigger volume fits within the licence execution limits.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft changes Power Automate licence tiers or execution limits for Dataverse triggers*
