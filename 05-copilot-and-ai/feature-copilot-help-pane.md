# Copilot Help Pane (Ask a Question / Draft a Response)

**Category:** Copilot and AI
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-help-pane](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-help-pane)

## What it does
AI assistant panel in Copilot Service workspace with two modes: immersive (full conversational) or side pane (in-context). Enables Ask a Question (KB search), Draft a Response, and Proactive Insights (Copilot surfaces answers without the rep asking).

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
Standard in any Copilot deployment. Ask a Question replaces the old Smart Assist. Enable for all reps with KB access.

## Configuration decisions
- Immersive vs side pane vs both — side pane is the lighter-weight option; immersive is more powerful but requires more screen real estate
- Custom instructions — configure to match the client's communication standards; worth investing time here; affects every Ask a Question response
- Proactive insights — reduces rep effort but can feel intrusive; discuss with the client before enabling in a busy contact centre
- Trusted webpages — only relevant if email drafting needs to reference specific external domains

## Gotchas
- **Custom instructions are bypassed with Copilot Studio sources.** If the client switches to extended sources (SharePoint, uploaded files), custom instructions won't apply. Make this clear during setup.
- **KB content takes up to 24 hours to refresh.** Newly published articles won't show up immediately. Set expectations — publish new articles at least a day before Copilot testing.

## Consultant notes

- Custom instructions are worth investing real time in for any client with a distinct communication style. The default Copilot tone is competent but generic — even 30 minutes of custom instruction writing (tone, prohibited phrases, formatting preferences) noticeably improves the quality of Ask a Question responses for that client's context.
- KB refresh being daily is a prep item: publish all articles at least 24 hours before any Copilot testing starts. Discovering this during UAT when reps can't find freshly published articles is an avoidable delay.
- Proactive insights should be piloted with a small group before rolling out to all agents. In a busy contact centre it can feel intrusive — answers surfacing when the rep hasn't asked for help yet disrupts flow for experienced agents. Newer agents tend to value it more.

---

*Source last updated: check Microsoft Learn | Check this after custom instructions extend to Copilot Studio sources or proactive insights GA*
