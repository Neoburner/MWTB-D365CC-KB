# Service Operations Agent

**Category:** Administration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/use-service-operations-agent-simplify-setup-tasks

## What it does
A conversational AI assistant embedded in the Copilot Service admin center. Admins interact with it in natural language to configure channels, routing, queues, AI agents, voice settings, Teams Phone extensibility, and knowledge sources, rather than clicking through separate admin screens.

## Key facts
- Public preview April 2026; GA May 2026
- Available directly in the Copilot Service admin center: no separate install
- Enabled automatically for admins (no toggle required in preview)
- Capabilities: generate configurations, validate setups, surface diagnostics, explain recommendations
- Scope: channels, routing, queues, AI agents, voice config, Teams Phone, knowledge sources
- Uses natural language: you describe what you want, it generates or adjusts the config

## When to use / skip
Worth trying during initial deployments for standard-pattern setups, it can shortcut the "where is this setting?" overhead considerably. Also useful for troubleshooting: the diagnostics surface can surface configuration mismatches faster than manual inspection.

Don't rely on it as your sole config mechanism for complex or non-standard setups. It's an assistant, not a replacement for knowing what you're doing. The generated config still needs reviewing before committing, especially for routing and queue rules.

## Configuration decisions
- None to enable: it's available in the admin center automatically in preview
- Decide whether your team will use it alongside the standard UI or as the primary config entry point during the project
- Establish a review step: treat its outputs as a first draft, not final config

## Gotchas
- It's in public preview: Microsoft explicitly states delivery timelines may change. Don't design your implementation workflow around it being available at a specific capability level.
- Natural language instructions are interpreted, not executed verbatim. "Set up a chat channel for support" will produce something reasonable, but you'll need to verify the workstream type, routing mode, queue assignment, and capacity settings match your design.
- The agent explains rationale behind recommendations, which is genuinely useful: but if you disagree with its reasoning, override manually. It won't know about your client's specific constraints.
- Access is admin-only. Service designers or consultants without full admin access won't be able to use it directly. Plan for who does the driving in workshops.

## Consultant notes

- Treat the Service Operations Agent as an acceleration tool, not a replacement for knowing the platform. Its natural language config generation is genuinely useful for standard pattern setups: getting a workstream scaffolded quickly in a workshop, or checking configuration diagnostics without navigating five menu levels. It's less useful for anything bespoke or where the client's requirements don't map neatly to defaults.
- The review step is non-negotiable. The agent's output is a first draft, and the generated config should be verified against the design documentation before committing. For routing and queue rules especially: where a wrong setting silently misdirects conversations: treat it like any generated code: useful starting point, needs human review before it goes anywhere near production.
- This is worth showing to clients who will be doing their own post-go-live admin. The diagnostic capability alone: surfacing configuration mismatches without manual inspection: is useful for an operations team maintaining the environment without a consultant on hand. Include it in the admin handover as a troubleshooting resource, not just a setup shortcut.

---

*Worth revisiting at GA (May 2026) to see what's changed between preview and production: the scope of supported tasks typically expands.*
