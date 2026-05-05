# Customer Knowledge Management Agent

**Category:** AI Agents
**Applies To:** Both (Standalone Contact Center and Dynamics 365 Customer Service)
**Source:** [MS Release Plan — 2025wave2](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/use-customer-knowledge-management-agent-update-knowledge-base)

## What it does
An autonomous AI agent that creates and updates knowledge articles from closed cases and conversation data. It monitors case closures in real time, drafts articles from case notes, transcripts, and emails, checks for duplicates against the existing KB, scrubs sensitive data, and can publish automatically or queue articles for supervisor review.

## Key facts
- **Two autonomy modes:** semi-autonomous (drafts articles, supervisor reviews before publish) and fully autonomous (auto-publishes without human sign-off)
- **Real-time creation:** triggers when a rep closes a case; analyzes case notes, conversation transcripts, email threads
- **Historical creation:** separate batch mode processes historical case data to fill gaps in the KB; runs on demand
- **Duplicate detection:** compares draft content against the existing Dynamics 365 KB before creating a new article; can update an existing article instead
- **Compliance scrubbing:** removes sensitive data from drafts; extensible with custom automated compliance checks via Power Automate
- **Knowledge insights dashboard:** supervisors see draft-to-publish pipeline, Copilot usage of articles, articles approaching expiration, quality metrics
- **Applies to:** cases, case notes, conversation transcripts, emails associated with cases
- GA: October 31, 2025 (Public preview: July 31, 2025)

## When to use / skip
Use this if the client has a large case volume and a KB that's either sparse or stale. The time-to-knowledge for real-time creation is minutes from case close — genuinely useful for support teams that deal with recurring but evolving product issues.

Skip it (or defer it) if the client's knowledge team has strong editorial standards and no process yet to review AI-drafted articles. Fully autonomous mode publishing directly to a public portal with no editorial review is a conversation to have before sign-off, not after.

## Configuration decisions
- **Autonomy level:** semi-autonomous or fully autonomous — the right choice depends on the client's risk appetite and whether a supervisor review step fits their operations
- **Record sources:** which record types to harvest from (cases by default; can include emails and transcripts)
- **Custom compliance rules:** if the client operates under HIPAA, FCA, or similar, build custom compliance checks before enabling auto-publish — the default scrubbing is generic
- **Historical creation scope:** decide whether to process all historical cases or a date-bounded subset; large volumes generate a lot of drafts that need reviewing
- **KB target:** confirm the agent writes to the correct knowledge base instance if the client has multiple; cross-environment KB setups need checking
- **Portal publishing:** if the KB feeds a self-service portal, fully autonomous mode publishes AI-created content externally — most regulated clients will want semi-autonomous here

## Gotchas
- **Historical creation generates volume.** Running it on 3 years of cases can produce hundreds of drafts overnight. The client needs a triage process and enough KB reviewer capacity before you enable this — "we'll review them gradually" usually means they pile up and nobody touches them.
- **Fully autonomous + public portal = content risk.** Articles published automatically to a customer-facing portal can contain errors, outdated product info, or compliance gaps that default scrubbing misses. Clients often don't connect these two settings until there's a problem.
- **Copilot accuracy is downstream.** The agent's output goes into the KB that Copilot uses for responses. Poor-quality or incorrect articles degrade Copilot answer quality directly. Frame KB quality governance as part of the Copilot configuration conversation, not as a knowledge management workstream.
- **Duplicate detection works within the same KB instance.** If the client has articles in SharePoint or an external system federated via the external search provider feature, the agent won't check those for duplicates — you can end up with conflicting articles in different systems.

## Consultant notes

- Most clients want the agent but haven't thought through the governance model. Before configuring anything, establish who owns the review queue, what the SLA is for reviewing drafts, and what happens to published articles that turn out to be wrong. Answering these questions after go-live is painful.
- The "Knowledge insights" dashboard gives supervisors a clean view of what the agent has created and how Copilot is using it. This is worth demoing to customer success / operations stakeholders during UAT — it's one of the few places where AI impact on the KB is made visible, and it tends to land well.
- Semi-autonomous mode is almost always the right starting point. Clients can switch to fully autonomous once they've built confidence in the article quality and have the governance process running. Going the other way (rolling back from fully autonomous after a content incident) is harder.
- Custom compliance rules via Power Automate are worth scoping as part of the initial build if the client is in a regulated industry. Default scrubbing removes obvious PII patterns but won't catch domain-specific identifiers (e.g., policy numbers, account codes).

---

*Worth revisiting after 2026 wave 1 — watch for expanded compliance rule templates and multi-language article creation capability*
