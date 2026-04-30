# Agent Insights Dashboard

**Category:** AI Agents
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../agent-insights-dashboard](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/agent-insights-dashboard)

## What it does
Dashboard tracking AI agent (bot) performance: autonomous resolution rates, quality scores, conversation and case handling metrics. Configurable KPI goals for autonomous rate and quality score. Accessed in Copilot Service workspace.

## Key facts
- Contact Center standalone only — not available in embedded or Customer Service
- Enabled at: Copilot Service admin center → Operations → Insights → Agent insights → Enable toggle
- KPIs for conversations: **Autonomous rate** (% closed by AI without rep) and **Quality score** (links to Quality Evaluation Agent settings)
- KPIs for cases: similar structure to conversations
- Quality score KPI requires Quality Evaluation Agent to be configured separately before it populates
- Dashboard reflects AI agent activity only — does not include human rep performance (use Omnichannel historical analytics for combined views)

## When to use / skip
Enable on any deployment with AI agents (Copilot Studio bots) to track deflection rates and quality. Essential for clients who want to measure ROI from AI agent investment.

## Configuration decisions
- KPI goal thresholds — set realistic targets based on the type of queries the AI agent handles; overly ambitious targets are demotivating

## Gotchas
- **Quality score won't populate until Quality Evaluation Agent is configured.** The KPI is linked to that feature — enable both together or expect a blank quality score metric.

---

*Source last updated: check Microsoft Learn | Review when: Dashboard expands to embedded deployment, or new KPI types added*
