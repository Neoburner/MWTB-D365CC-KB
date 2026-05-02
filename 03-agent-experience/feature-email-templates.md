# Email Templates

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/create-email-template

## What it does
Email templates are pre-authored email bodies that agents can insert into outgoing email replies rather than writing from scratch. They support dynamic fields (data tokens that populate with record values like customer name, case number, or agent name), rich text formatting, and attachments. Templates are managed centrally in D365 and are available to agents from within the email communication panel.

## Key facts
- Templates are created and managed in Copilot Service Admin Center (or Settings > Templates > Email Templates)
- Templates can include dynamic data tokens that reference Dataverse record fields: e.g., `{!Case:Title;;}` inserts the case title automatically
- Templates are categorised by entity: most email templates are associated with the Case or Conversation entity, controlling which record fields are available as tokens
- Agents access templates from the email composition panel using the "Insert Template" button: they can preview the template and then insert and modify it before sending
- Templates support HTML formatting, embedded images, and linked files (though embedded images increase email size and may be blocked by some email clients)
- Template access can be restricted by security role, though by default all agents with email access can use all templates
- Copilot email drafting (feature-copilot-email-drafting.md) is an AI-generated alternative to templates: templates are static/pre-authored; Copilot drafts are generated dynamically
- Templates are shared across the organisation: changes affect all agents using that template

## When to use / skip
Templates are the right choice for high-volume, standardised email responses: acknowledgement emails, case closure confirmations, policy statements, complaint responses with defined language. They reduce handle time and ensure consistent phrasing across agents.

Skip templates for personalised or variable responses where the content changes significantly per customer, that's where Copilot email drafting adds more value than a static template. Both can coexist: templates for standard categories, Copilot for bespoke drafts.

## Configuration decisions
- Build an initial template library before go-live that covers the top 10–20 most common email response types: don't attempt to create a template for every scenario; cover the highest-volume cases first
- Use dynamic data tokens for customer name, case number, and agent name at minimum: these fields should never be manually typed in an outgoing email
- Define a naming convention for templates that makes them easy to find in the insert template picker: agents won't use templates they can't find quickly
- Decide who can create and edit templates: templates are shared; uncoordinated editing causes problems when an agent "fixes" a template and inadvertently changes the standard language for all agents
- Attach templates to the correct entity (Case, Conversation) based on which record fields they reference: a template attached to the wrong entity will have unavailable tokens that fail to resolve

## Gotchas
- Dynamic tokens that reference record fields fail to populate if the related record is not linked at the time of email send. An agent using a Case template without a linked case gets {!Case:Title;;} literally in the email body. Train agents to check that required records are linked before using templates with dynamic fields.
- Template changes are immediate and affect all agents. There's no draft or approval workflow for template edits. An edit made to fix a typo simultaneously changes the template for every agent who uses it. For compliance-sensitive templates (regulated language, legal disclaimers), this is a governance risk.
- HTML formatting in templates can render differently across email clients. An email that looks correct in Outlook can appear broken in Gmail or Apple Mail. Test email template rendering in the most common client types your customers use.
- Embedded images in templates (logo, signature graphic) increase email size and are frequently blocked by corporate email firewalls. Reference images via URL rather than embedding where possible.
- Template management is not in the main D365 navigation for agents: agents access templates only from within the email composition panel. If agents don't know the "Insert Template" button exists, they won't use templates even if they're available.

## Consultant notes

- Template library design is a content task, not a D365 task. The technology for templates is straightforward; the work is gathering the content: approved language, legal review of certain categories, brand tone. Clients frequently underestimate how long it takes to produce and approve 20 email templates. Build the content work into the project timeline explicitly and assign ownership to the client's business team, not the implementation team.
- Token validation before go-live saves embarrassing emails. Set up a test case and a test customer record, and send actual emails using each template to a test inbox. Verify every dynamic token populates correctly. An email sent to a real customer that reads "Dear {!Contact:FirstName;;}" is a confidence-damaging go-live incident.
- The template governance question: who can edit templates, who reviews changes, how are compliance-critical templates protected: is worth addressing in the admin handover explicitly. Without governance, templates drift over time: individual agents make "quick fixes" that change the standard language, compliance-reviewed text gets modified, and the original approved wording is lost. A simple change request process and a named template owner prevents this.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds template version history or approval workflow for template changes*
