# Customer Profile & History

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/customer-profile

## What it does
The Customer Profile is the Contact or Account record in Dataverse that stores persistent customer information, name, contact details, relationship history, and custom fields, independent of any single conversation. It's the central identity record that conversations, cases, and activities link to. Agents access it from the Customer Summary during a conversation or from search. Customer history (past interactions) is visible through the Timeline on the profile record.

## Key facts
- The customer profile is the Contact entity (for individuals) or Account entity (for businesses) in Dataverse: standard D365 entities, not omnichannel-specific
- Agents can view and edit the customer profile from within the Active Conversation screen: opening it in a new application tab in the session
- Customer record fields are populated by record identification at conversation start: whichever contact or account the identification rules matched becomes the linked customer profile
- Profile changes made by an agent during a conversation (e.g., updating a phone number) save immediately to the Dataverse record: they're not conversation-scoped
- Customer conversation history (all past conversations) is visible via the Timeline on the Contact record: not limited to the current session
- Customer profile search is available from the CSW search bar: agents can look up a customer by name, email, or phone number even outside a conversation context
- If multiple contact records exist for the same customer (duplicates), agents may see inconsistent history depending on which record the conversation linked to
- Related accounts (for B2B scenarios) link contacts to their parent organisation: agents can navigate from contact to account to see company-level history

## When to use / skip
The customer profile is always present in any D365 deployment, the question is how much to customise the Contact/Account form for the contact centre use case. Out of the box, the standard Contact form is adequate for basic identification. For contact-centre-specific deployments, custom fields for service tier, communication preferences, language preference, or consent flags are common additions.

## Configuration decisions
- Review the default Contact form and add any contact-centre-specific fields the client needs: service tier, preferred channel, consent status, language preference are common
- Set field-level security on sensitive fields (financial tier, health information, account credit status): the Contact form is visible to all agents by default
- Decide whether agents can edit customer profiles mid-conversation or whether profile updates should be a separate process (update requests submitted to a data team): edit access is configurable by security role
- Configure duplicate detection rules in Dataverse to prevent the creation of duplicate contact records: duplicate contacts are the most common cause of incomplete customer history
- If the deployment integrates with an external CRM or system of record, decide whether D365 or the external system is the master for customer profile data: bidirectional sync creates conflict resolution complexity

## Gotchas
- Customer profile edits made during a live conversation save immediately and permanently. There's no "draft" mode or confirmation step. An agent who updates a customer's email address incorrectly has immediately changed the record for all agents and all future interactions. Make sure agents understand the permanence of profile edits before training them to update customer details.
- Duplicate contact records are the single biggest customer history problem in any D365 deployment. If record identification creates a new contact instead of matching an existing one, that conversation appears in the new record's history, not the original: and the customer's history is now split. Duplicate detection rules and a periodic merge process are the mitigation. Don't leave duplicate management until post-go-live.
- Record identification links the conversation to a specific Contact record. If the agent navigates to the customer profile from the conversation and that contact record is incorrect (misidentified), the history the agent sees is the wrong customer's history. Agents need to verify identity before acting on the Customer Summary.
- Contact records created by record identification (new customer) are created with minimal data: only what was collected by the bot or the initial channel data. Agents handling new customer conversations should complete the profile if business process requires full contact data.
- Account vs Contact navigation can confuse agents in B2B contexts. An agent wanting to see all interactions with a company (Account) needs to go to the Account record, not the individual Contact. Training on the Account → Contact → Conversation hierarchy is worth including for B2B contact centres.

## Consultant notes

- Duplicate contact management is not a go-live task: it's an ongoing operations function. Clients should have a named owner for duplicate management before go-live: someone who runs the Dataverse duplicate detection report weekly and merges duplicates before they proliferate. "We'll deal with it later" means the history problem compounds silently for months until it's a significant data quality issue.
- The "who owns customer profile data" question is usually more politically complex than it appears. In organisations where D365 CC runs alongside Salesforce, SAP, or another CRM, the contact record exists in multiple systems and sync is always lossy in some direction. Make the master system decision explicitly in the design phase and document it: don't leave it ambiguous.
- Field-level security on Contact records is worth discussing in the security design session rather than as an afterthought. Front-line agents don't need to see (and shouldn't see) every field on a Contact record. A lean agent view: key identification fields, service tier, communication preferences: is better for agents and more secure than a fully exposed Contact form.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft restructures the Contact entity in D365 Customer Service or changes record identification defaults*
