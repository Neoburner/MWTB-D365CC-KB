# Service Agent in Microsoft 365 Copilot

**Category:** AI Agents
**Applies To:** Embedded (Customer Service)
**Source:** [Overview of Service Agent](https://learn.microsoft.com/en-us/dynamics365/customer-service/use/service-agent-overview) · [Configure Service Agent](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-service-agent)

## What it does
An AI assistant that works alongside reps in Copilot Service workspace and Microsoft 365 Copilot. Reps use natural language to summarise cases and conversations, search knowledge, draft communications, and complete service tasks without leaving the workspace. It reaches customer service data, cases, customer records, and recent interactions directly.

## Key facts
- **GA as of 30 June 2026.** The earlier preview constraints have largely lifted; treat it as production, not a trial.
- **Requires Microsoft 365 Copilot licences per user**: separate from D365 Customer Service licensing
- Setup requires two separate admin actions: M365 admin installs the Service app from Microsoft Marketplace; D365 admin adds M365 Copilot to the Customer Service environment
- **Surfaces in three places:** the Copilot side pane in Copilot Service workspace (selected automatically as the active agent), a full-page experience in the Microsoft 365 Copilot app, and **Microsoft Outlook** (uses the open email thread as context)
- **In-chat capabilities** now include: file upload and image understanding, image generation, charts built from service data, Word/Excel/PowerPoint creation, and interactive apps-in-chat (grids, forms, cards)
- Grounds answers across Dataverse, SharePoint, and Microsoft 365 knowledge sources
- **Extensible via MCP:** admins can register non-Microsoft MCP servers to add custom tools — see [MCP tools and MCP server support](../10-integration-and-extensibility/feature-mcp-tools-and-servers.md)

## When to use / skip
Use if the client has M365 Copilot licences and reps want an assistant that spans case work, knowledge, drafting, and Outlook without app-switching. Skip if they don't have M365 Copilot licences — it's additive licensing that must be confirmed before committing.

## Configuration decisions
- Which users get M365 Copilot licences: this determines who can use Service Agent; typically a subset of the rep population given licensing cost
- Whether to extend it with custom MCP servers, and which first-party grounding sources (SharePoint, M365) to enable
- Whether reps get the Outlook surface, and how that fits their existing case-handling flow

## Gotchas
- **Two admin teams must coordinate.** M365 admin installs the Service app; D365 admin adds M365 Copilot to the environment. May be different teams. Clarify ownership early: common delay.
- **Lice