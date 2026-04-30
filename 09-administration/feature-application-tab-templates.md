# Application Tab Templates

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../application-tab-templates](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/application-tab-templates)

## What it does
Defines which pages open as tabs in Copilot Service workspace when a session starts. Each template has a mandatory anchor tab (cannot be closed) plus optional additional tabs. Tabs can open specific records, dashboards, web resources, or third-party websites. Parameters support static values, context slugs, and OData queries for dynamic record loading.

## Key facts
- Page types: Dashboard, Entity list, Entity record, Search, Third-party website, Web resource, Custom, Control
- **Up to any number of additional tabs** — but additional tabs cannot be closed by reps
- **Third-party websites reload to initial state** when a rep switches away and back — no state persistence
- **Third-party websites must be iframe-compatible** — sites that block iframe embedding will show an error
- For Entity record page type: if `entityId` is provided and the record doesn't exist, the form opens in **create mode** — use `validateRecord=True` to prevent this if the record may not exist
- OData parameter values allow dynamic Dataverse lookups: `{$odata.incident.title.?$filter=incidentid eq '{anchor.incidentid}'&$select=title}`
- Key anchor slugs: `{anchor.incidentid}`, `{anchor.title}`, `{anchor._customerid_value}`, `{anchor.ticketnumber}`
- OOB templates cannot be customised — create new templates from scratch
- Unique name format: `<prefix>_<name>` — prefix must be 3–8 alphanumeric characters

## When to use / skip
Use on any deployment where reps should automatically see supporting context (customer record, knowledge search) when accepting work. Reduce manual lookups by dynamically loading relevant records via slugs.

## Configuration decisions
- **Which anchor tab per session type** — Active Conversation for chat/voice; Case form for record sessions
- **Which additional tabs** — be conservative; every additional tab adds navigation overhead; identify the 1–2 most-needed pages
- **validateRecord on entity tabs** — set to True if the related record might not always exist to prevent accidental create-mode opens
- **OData vs. static vs. slug parameters** — slugs are the right default; OData for more complex dynamic lookups; static for fixed pages like dashboards

## Gotchas
- **validateRecord must be manually added as a parameter** if not present by default — its absence causes blank create-form opens when the record doesn't exist.
- **Iframe blocking is silent.** A third-party website that blocks iframes shows an error page to the rep, not a warning during configuration. Test every external URL in an iframe before including it.
- **Tab templates are referenced by session templates** — design tabs first, then session templates; they're reusable across multiple session types.

---

*Source last updated: 2025-05-05 | Review when: New page types added or embedded deployment support extended*
