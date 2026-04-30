# Copilot Help Pane (Ask a Question / Draft a Response)

**Category:** Copilot and AI
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-help-pane](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-help-pane)

## What it does
The AI assistant panel in Copilot Service workspace. Two modes: Copilot immersive (full conversational panel) and Copilot side pane (in-context alongside workspace). Enables Ask a Question (knowledge search), Draft a Response, and Proactive Insights (Copilot surfaces answers without the rep asking).

## Key facts
- Two modes configurable independently: **Copilot immersive** and **Copilot side pane**
- **Ask a Question** uses the D365 knowledge base (requires published articles); can be extended via Copilot Studio knowledge sources (Preview — see `feature-copilot-knowledge-sources.md`)
- **Custom instructions** (up to 5,000 chars) configure Copilot tone, style, formatting — apply to Ask a Question with D365 KB only; not applied when using Copilot Studio knowledge sources
- **Trusted webpages** (up to 5 domains, 2 levels deep): used for email/draft responses only — **not** for Ask a Question; requires Bing enabled in Power Platform admin center
- **Proactive insights**: Copilot surfaces knowledge answers during active conversations without rep manually requesting them
- Knowledge base content refreshed **daily** — recently published articles may not appear immediately
- **Conversation summary** is Copilot Service workspace only — not Customer Service Hub or custom apps
- External web sources are for email drafting only — Ask a Question uses KB sources, not web

## When to use / skip
Standard in any Copilot deployment. Ask a Question replaces the deprecated Smart Assist native AI suggestions. Enable for all rep populations who have access to a knowledge base.

## Configuration decisions
- Immersive vs side pane vs both — side pane is the lighter-weight option; immersive is more powerful but requires more screen real estate
- Custom instructions — configure to match the client's communication standards; worth investing time here; affects every Ask a Question response
- Proactive insights — reduces rep effort but can feel intrusive; discuss with the client before enabling in a busy contact centre
- Trusted webpages — only relevant if email drafting needs to reference specific external domains

## Gotchas
- **Custom instructions don't apply to Copilot Studio knowledge sources.** If the client switches to extended knowledge sources (SharePoint, uploaded files), their custom instructions will be silently ignored. Make this explicit during configuration.
- **KB content takes up to 24 hours to refresh.** Newly published articles won't appear immediately in Ask a Question responses. Set expectations during testing — new articles need to be published at least a day before testing their Copilot surface.

---

*Source last updated: check Microsoft Learn | Review when: Custom instructions extend to Copilot Studio sources, or proactive insights GA*
