# Copilot Plugins for Generative AI (Preview)

**Category:** Copilot and AI
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-plugins](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-plugins)

> ⚠️ **Preview feature**: subject to change before GA.

## What it does
Extends Copilot's capabilities beyond built-in knowledge by connecting it to external processes and data sources. Three plugin types: Prompt plugins (AI Builder prompts → Dataverse), Custom connector plugins (Power Automate custom connectors for non-Microsoft systems), and Certified connector plugins (Copilot Studio, e.g. Salesforce, DocuSign).

## Key facts
- Enabled at: Copilot Service admin center → Productivity → Copilot for questions and emails → Plugins → enable toggle
- Publishing takes **up to 15 minutes** after enabling a plugin before it appears to reps
- Access can be scoped to: all agents with Copilot, or specific security roles
- Plugin interaction data stored as Copilot transcript records in Dataverse
- Prerequisites: AI Builder environment (prompt plugins); existing Power Automate custom connector (custom connector plugins); Copilot Studio access (certified connector plugins)

## When to use / skip
Use when reps need Copilot to reach into external systems or run complex processes beyond KB and email. Skip for standard deployments where built-in capabilities are enough.

## Configuration decisions
- Which plugin type is appropriate: Prompt plugins for Dataverse-based processes; Custom connector plugins for external system integration; Certified connector plugins for well-known SaaS tools
- Access scoping: restrict by role if only specific teams should use a particular plugin

## Gotchas
- **Preview status.** Configuration and behaviour are subject to change. Don't build production workflows on this until GA.
- **15-minute publish delay.** Reps won't see the plugin immediately after enabling. Factor this into testing and training.
- **Custom connector must exist first.** If the Power Automate connector isn't built yet, the plugin can't be configured. Easy to miss when scoping the work.

## Consultant notes

- Preview status applies here as with all Preview Copilot features: regulated production deployments need explicit client sign-off before this goes live. Flag it as a roadmap feature until GA.
- Custom connector as a prerequisite for custom connector plugins is the dependency that gets missed in project planning. If the Power Automate connector doesn't exist yet, building it is a separate piece of work that needs its own scope entry.
- The 15-minute publish delay is worth noting in the training plan. Trainers enabling plugins during a live session and then waiting for them to appear creates unnecessary confusion if it's not expected.

---

*Source last updated: check Microsoft Learn | Check this after feature reaches GA or new plugin types are added*
