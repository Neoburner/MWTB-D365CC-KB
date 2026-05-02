# Application Tab Templates

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../application-tab-templates](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/application-tab-templates)

## What it does
Defines which pages open as tabs in Copilot Service workspace when a session starts. Each template has a mandatory anchor tab (cannot be closed) plus optional additional tabs. Tabs can open specific records, dashboards, web resources, or third-party websites. Parameters support static values, context slugs, and OData queries for dynamic record loading.

## Key facts
- Page types: Dashboard, Entity list, Entity record, Search, Third-party website, Web resource, Custom, Control
- **Up to any number of additional tabs**: but additional tabs cannot be closed by reps
- **Third-party websites reload to initial state** when a rep switches away and back: no state persistence
- **Third-party websites must be iframe-compatible**: sites that block iframe embedding will show an error
- For Entity record page type: if `entityId` is provided and the record doesn't exist, the form opens in **create mode**: use `validateRecord=True` to prevent this if the record may not exist
- OData parameter values allow dynamic Dataverse lookups: `{$odata.incident.title.?$filter=incidentid eq '{anchor.incidentid}'&$select=title}`
- Key anchor slugs: `{anchor.incidentid}`, `{anchor.title}`, `{anchor._customerid_value}`, `{anchor.ticketnumber}`
- OOB templates cannot be customised: create new templates from scratch
- Unique name format: `<prefix>_<name>`: prefix must be 3–8 alphanumeric characters

## When to use / skip
Use on any deployment where reps should automatically see supporting context (customer record, knowledge search) when accepting work. Reduce manual lookups by dynamically loading relevant records via slugs.

## Configuration decisions
- **Which anchor tab per session type**: Active Conversation for chat/voice; Case form for record sessions
- **Which additional tabs**: be conservative; every additional tab adds navigation overhead; identify the 1–2 most-needed pages
- **validateRecord on entity tabs**: set to True if the related record might not always exist to prevent accidental create-mode opens
- **OData vs. static vs. slug parameters**: slugs are the right default; OData for more complex dynamic lookups; static for fixed pages like dashboards

## Gotchas
- **validateRecord must be manually added as a parameter** if not present by default: without it, you get blank create-form opens when the record doesn't exist.
- **Iframe blocking is silent.** A third-party website that blocks iframes shows an error page to the rep, not a warning during configuration. Test every external URL in an iframe first.
- **Tab templates are referenced by session templates**: design tabs first, then session templates. They're reusable across multiple session types.

## Consultant notes

- Design application tab templates before session templates, not after. Session templates reference tab templates by association: you can't complete the session template configuration without the tabs already existing. Most project plans get this the right way round, but it's easy to conflate the two during discovery and end up designing them out of order.
- Test every third-party website URL for iframe compatibility before building the tab template around it. The iframe blocking failure is silent in configuration: you won't see the error until a rep tries to open the session. Some enterprise tools (certain CRM portals, billing systems, older intranets) block iframe embedding by design and will never work as application tabs. Confirm with the client's IT team if there's any doubt.
- The `validateRecord=True` parameter should be added by default any time you're using an Entity record tab where the record might not always exist: which is most of the time in practice. The alternative (accidentally opening a blank create form in front of a customer) is the kind of UX failure that gets escalated to the project manager on day one of go-live. Add the parameter as standard rather than waiting to find out whether it's needed.

---

*Source last updated: 2025-05-05 | Check this: New page types added or embedded deployment support extended*
