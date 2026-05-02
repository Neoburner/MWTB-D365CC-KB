# Knowledge Management

**Category:** Agent Experience
**Applies To:** Standalone (Contact Center); Customer Service
**Source:** [learn.microsoft.com/.../set-up-knowledge-management-embedded-knowledge-search](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/set-up-knowledge-management-embedded-knowledge-search)

## What it does
Gives reps a searchable knowledge base from within Copilot Service workspace. Reps search articles during cases or conversations, view content inline, and share portal links with customers. Admins control search logic, display count, suggest-as-you-type, portal integration, and external search providers.

## Key facts
- Enabled per record type — default: Case and Conversation
- Search mode: `any` (match any keyword, broader results) vs `all` (match all keywords, more precise) — toggle in admin settings
- **Suggest-as-you-type:** surfaces matching article titles as reps type; matched text highlighted in flyout
- **Recently viewed articles:** configurable 1–8 articles shown for keyword searches across cases
- **Portal integration:** requires a portal with matching org domain; URL format uses `{kbnum}` placeholder replaced at runtime
- External search providers can federate knowledge search across SharePoint and third-party systems
- Parature knowledgebase is deprecated — use native D365 knowledge management

## When to use / skip
Use on any deployment where reps need to reference internal knowledge during conversations. Essential for technical support and product-heavy contact centres. Less critical for simple transactional workflows where reps work from scripts alone.

## Configuration decisions
- Search mode (any vs all) — `all` reduces noise for clients with large article libraries; `any` is better for smaller libraries where breadth matters
- Portal integration — required if the client wants reps to share article links with customers; needs a D365 portal or custom portal with matching domain
- External search providers — use if the client's knowledge is distributed across SharePoint or other systems; adds setup complexity

## Gotchas
- **Portal URL configuration requires a portal with matching org domain first.** You can't configure the URL format before the portal exists—this dependency surprises clients who want rep-sharing before the portal is live.
- **Suggest-as-you-type requires knowledge articles in Published state**—draft articles don't appear in suggestions.

## Consultant notes

- Portal dependency for rep-to-customer article sharing needs to be surfaced in requirements, not design. "We'll build the portal later" means that capability doesn't work at go-live, and clients rarely make the connection between the two features until they test it.
- Article publishing state is one to include in the content management handover to the KB team. Draft articles don't appear in suggest-as-you-type. If the client's team publishes articles slowly or keeps drafts as working documents, reps won't see them — and there's no error to diagnose.
- Search mode (any vs all) is worth a quick conversation with the client's KB team. The right choice depends on how articles are written and how specific rep search queries tend to be. Large libraries with long articles benefit from `all`; smaller, niche-topic libraries are better on `any`.

---

*Source last updated: 2026-01-29 | Review when: External search provider list expanded or federated search configuration changes*
