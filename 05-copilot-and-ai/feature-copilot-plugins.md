# Copilot Plugins for Generative AI (Preview)

**Category:** Copilot and AI
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-plugins](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-plugins)

> ⚠️ **Preview feature** — subject to change before GA.

## What it does
Extends Copilot's capabilities beyond built-in knowledge by connecting it to external processes and data sources. Three plugin types: Prompt plugins (AI Builder prompts → Dataverse), Custom connector plugins (Power Automate custom connectors for non-Microsoft systems), and Certified connector plugins (Copilot Studio — e.g. Salesforce, DocuSign).

## Key facts
- Enabled at: Copilot Service admin center → Productivity → Copilot for questions and emails → Plugins → enable toggle
- Publishing takes **up to 15 minutes** after enabling a plugin before it appears to reps
- Access can be scoped to: all agents with Copilot, or specific security roles
- Plugin interaction data stored as Copilot transcript records in Dataverse
- Prerequisites: AI Builder environment (prompt plugins); existing Power Automate custom connector (custom connector plugins); Copilot Studio access (certified connector plugins)

## When to use / skip
Use when reps need Copilot to reach into external systems or execute complex processes beyond KB search and email drafting. Skip for standard deployments where built-in Copilot capabilities are sufficient.

## Configuration decisions
- Which plugin type is appropriate: Prompt plugins for Dataverse-based processes; Custom connector plugins for external system integration; Certified connector plugins for well-known SaaS tools
- Access scoping — restrict by role if only specific teams should use a particular plugin

## Gotchas
- **Preview status.** Configuration interface and behaviour are subject to change. Do not build production-critical workflows on this feature until GA.
- **15-minute publish delay.** After enabling, reps won't see the plugin immediately. Factor this into testing and training sessions.
- **Custom connector must exist before configuring.** If the Power Automate custom connector hasn't been built yet, the plugin can't be configured. This is a dependency that's easy to overlook when scoping the Copilot configuration work.

---

*Source last updated: check Microsoft Learn | Review when: Feature reaches GA, or new plugin types added*
