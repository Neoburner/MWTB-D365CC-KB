# Agent Hub

**Category:** AI Agents
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../agent-hub](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/agent-hub)

## What it does
Centralised admin and supervisory console for governing autonomous AI agents. Primarily a navigation and information surface — documentation on AI agent capabilities, security, architecture, compliance, rollout plans, and links to configuration areas. Actual AI agent configuration happens in the individual feature areas (Quality management, Intent, Workstreams, etc.).

## Key facts
- Navigation surface: links out to individual AI agent configuration areas rather than doing configuration itself
- Provides rollout plan management (for scoping and phasing AI agent deployment)
- Performance insights accessible from Hub (links to Agent Insights dashboard — see `feature-agent-insights-dashboard.md`)
- Security, architecture, and compliance documentation accessible within Hub

## When to use / skip
Useful as an orientation point at the start of any AI agent deployment to understand what's available and what links where. Not a place where substantive configuration happens.

## Configuration decisions
None — Agent Hub is a portal/navigation surface, not a configuration screen.

## Gotchas
- **Not where you configure agents.** Admins who navigate to Agent Hub expecting to set up an AI agent will need to follow the links out to the relevant feature areas. Document the correct setup paths in project documentation to avoid confusion.

---

*Source last updated: check Microsoft Learn | Review when: Agent Hub gains direct configuration capabilities*
