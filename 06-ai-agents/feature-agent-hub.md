# Agent Hub

**Category:** AI Agents
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../agent-hub](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/agent-hub)

## What it does
Central admin console for autonomous AI agents. Mainly a navigation and information surface with docs on capabilities, security, architecture, compliance, and rollout plans. Actual configuration happens in the individual feature areas (Quality management, Intent, Workstreams, etc.).

## Key facts
- Navigation surface: links out to individual AI agent configuration areas rather than doing configuration itself
- Provides rollout plan management (for scoping and phasing AI agent deployment)
- Performance insights accessible from Hub (links to Agent Insights dashboard: see `feature-agent-insights-dashboard.md`)
- Security, architecture, and compliance documentation accessible within Hub

## When to use / skip
Useful as an orientation point at the start of any AI agent deployment to understand what's available and what links where. Not a place where substantive configuration happens.

## Configuration decisions
None, Agent Hub is a portal/navigation surface, not a configuration screen.

## Gotchas
- **Not a configuration screen.** Admins expecting to set up an AI agent need to follow the links to the relevant feature areas. Document the correct setup paths to avoid confusion.

## Consultant notes

- Clients and admins expect this to be a configuration screen and spend time looking for things they can't do here. Orient new admins quickly: Agent Hub is where you understand the landscape and navigate to the right places, not where you configure anything. Put this in the handover documentation explicitly to avoid first-day confusion.
- Useful for onboarding yourself to a new Contact Center environment: follow the links from Hub to understand what's deployed and what isn't. Keep that use case in mind when you're picking up an existing implementation.

---

*Source last updated: check Microsoft Learn | Check this after Agent Hub gains direct configuration capabilities*
