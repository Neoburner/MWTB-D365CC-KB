# Case Management (Create, Link, Resolve)

**Category:** Agent Experience
**Applies To:** Both (Customer Service licence required for full case management)
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/customer-service-hub-user-guide-case-management

## What it does
Case management is the process of creating, managing, and resolving service cases (incidents/tickets) linked to customer conversations. During or after a conversation, agents can create a case record, link it to the conversation and customer, track it through defined statuses, assign it to queues or specific agents, and resolve it when the issue is closed. Cases are the primary unit of work tracking in D365 Customer Service and the main entity in historical analytics, SLA tracking, and quality management.

## Key facts
- Cases are created from within the Active Conversation screen using the "Create case" button or from the customer timeline
- A case can be linked to multiple conversations (a customer contacts multiple times about the same issue) but a conversation typically links to one case
- Case fields: Title, Customer, Origin channel, Priority, Status (Active, Resolved, Cancelled), Owner, Queue, Product, Subject, Description, Resolution
- Case status flow: Active → Resolved → Closed (or Cancelled); reopening is possible if a customer contacts again after resolution
- SLA tracking operates at the case level: response time and resolution time KPIs apply to cases, not individual conversations
- Agents can create cases during a live conversation without ending it: the case form opens in a new application tab within the session
- Subject tree (case category hierarchy) is used for classification and reporting: requires setup in admin centre
- Case routing is separate from conversation routing: unified routing can route case records to agent queues just as it routes conversations (see `feature-record-routing.md`)
- Customer Service Enterprise licence is required for full case management including SLA and case routing; Contact Center standalone licence has limited case functionality

## When to use / skip
Use case management for any contact centre where issues span multiple interactions, require assignment and tracking beyond the initial conversation, or have service level commitments at the issue level (not just the conversation level). Financial services, utilities, insurance, and B2B support are typical case-heavy environments.

Skip (or de-prioritise) case management for high-volume, resolution-in-first-contact channels, pure chat or outbound dialling environments where every conversation is complete and self-contained. Forcing case creation for resolved-in-one-contact interactions adds agent friction without analytical benefit.

## Configuration decisions
- Define the case status workflow: which statuses exist, what triggers movement between them, and whether supervisors need to approve resolutions
- Set up the subject tree (case category hierarchy) before go-live: this is the primary classification mechanism for case analytics; an empty or poorly designed subject tree produces unclassifiable case data
- Decide on case creation trigger: mandatory for every conversation, agent-discretion, or auto-created by rule (Power Automate trigger when conversation reaches a certain status)
- Configure SLA rules at the case level if the deployment has service time commitments: see `feature-sla-tracking.md` for SLA configuration detail
- Set up case routing rules if cases need to be assigned to specific queues or agents after creation (different from conversation routing)
- Define the resolution fields: what must be completed for a case to be marked resolved? What's the required resolution text?

## Gotchas
- Cases and conversations are different records linked by relationship. Deleting a conversation does not delete the linked case: and vice versa. GDPR deletion must address both records separately.
- Case creation during a live conversation opens a new tab in the current session. If session templates don't include an application tab for case creation, the case form may open in a way that disrupts the agent's conversation flow. Test the case creation UX in UAT.
- The "case linked to conversation" relationship is set at case creation, but agents can also manually link cases to conversations retrospectively. If agents create cases inconsistently (sometimes linking, sometimes not), analytics will have gaps in conversation-to-case tracing.
- SLA timers start when the case is created, not when the conversation started. If agents delay case creation (e.g., creating the case in wrap-up instead of at the start of the conversation), the SLA timer starts late and masks actual response time.
- Case resolution in D365 Customer Service has a specific process: resolving a case requires filling in the Resolution field and confirming. A closed case cannot be edited without reopening. Agents who are used to simpler ticket systems find this process more structured than expected.

## Consultant notes

- The mandatory vs discretionary case creation decision is one of the most impactful design choices in any Customer Service deployment. Mandatory creation for every conversation gives you complete data coverage but increases agent handle time. Discretionary creation gives agents flexibility but produces patchy data. The client's analytics and SLA requirements should drive this decision, not agent preference. If SLA tracking depends on cases, case creation must be mandatory at or before the point where the SLA clock starts.
- Subject tree design is a content task that happens in business analysis, not in configuration. The subject tree should reflect how the client categorises service issues in their operations: it's the basis for case analytics, product reporting, and knowledge article linking. A subject tree built without business input becomes an IT-defined taxonomy that doesn't match how the business talks about its issues. Get the business owner to define the first two levels of the subject tree before you open the admin centre.
- The case resolution process is stricter than many clients expect and it surprises agents coming from simpler helpdesk tools. Include a specific case resolution walkthrough in agent training: create a case, link it, fill the required fields, resolve it, observe the status change. Agents who haven't done this in training will attempt to "close" cases incorrectly on day one.

---

*Source last updated: 2026-04-30 | Revisit when Microsoft changes case entity schema or SLA calculation behaviour*
