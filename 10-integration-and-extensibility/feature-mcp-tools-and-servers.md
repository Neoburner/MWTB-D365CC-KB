# MCP Tools and MCP Server Support for AI Agents

**Category:** Integration and Extensibility
**Applies To:** Both
**Source:** [MCP tools overview](https://learn.microsoft.com/en-us/dynamics365/customer-service/develop/mcp-tools-overview) · [Configure non-Microsoft MCP servers in Service Agent](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-service-agent-mcp-servers)

## What it does
Model Context Protocol (MCP) tools are standardised business actions that the AI agents in the desktop — chiefly Service Agent — call in the background to read and act on service data. Microsoft ships a set of first-party MCP tools (case, customer, knowledge, email, activity, admin actions), and admins can also register non-Microsoft MCP servers to expose their own tools to the agent.

## Key facts
- Two directions, don't confuse them: **inbound** MCP servers bring external tools *into* Service Agent so reps can use them; the separate "Customer Service MCP Server" exposes D365 data *outward* to other MCP clients. This doc is about the inbound side.
- First-party MCP tools cover case management, customer/account/contact lookup, knowledge search and article drafting, email draft/rewrite/translate/send, activities and notes, timelines, conversation summaries, and some admin/config actions.
- Reps and supervisors never call tools directly. The agent decides which tool to invoke and shows the result in chat, sometimes as an interactive "app-in-chat" component (grids, forms, cards) they can act on.
- Registering a non-Microsoft MCP server needs an accessible MCP endpoint that supports **Microsoft Entra authentication**. No Entra support on the endpoint, no connection.
- MCP servers are added through **maker mode** in Service Agent (natural-language prompts like "enter maker mode" → "Add MCP server"), scoped at **Organization** level — not the classic admin center UI.
- Adding a server requires the `prvmsdyn_ServiceAgentMakerCustomize` privilege on the `msdyn_agentmetadataoverride` elastic table (System Administrator or System Customizer have it).
- On connect you test the endpoint, it discovers the exposed tools, and you choose which to enable, disable, or hide.

## When to use / skip
Use non-Microsoft MCP servers when reps need the agent to act in a system that isn't already wired into D365 — an order platform, a logistics system, a bespoke line-of-business app — and you'd otherwise be building custom plugins or connectors. Skip it if the first-party tools already cover the actions you need; you don't register an MCP server just to summarise cases or draft emails.

## Configuration decisions
- Which non-Microsoft MCP servers to register, and the tool prefix/namespace for each so tool names don't collide.
- Which discovered tools to enable versus hide — expose the business-relevant ones, hide test or internal-only tools.
- Who holds the maker privilege. Registering servers is a maker action, not something you want spread across every admin.
- Whether the target endpoint already speaks Entra auth, or needs work before it can be connected at all.

## Gotchas
- The endpoint **must** support Microsoft Entra auth. A plain API-key MCP server won't connect, and that's the kind of thing you find out mid-configuration rather than in planning.
- Configuration lives inside a conversational maker mode, not a settings page. It's discoverable once you know the prompts, but the modify/remove flows are still light on documented exact wording — expect some trial and error.
- Removing a server pulls its tools out of the agent immediately. It doesn't touch the external server, but any rep workflow leaning on those tools stops working the moment you disconnect.
- Tool prefixes matter. Register two servers with overlapping tool names and no prefixes and you'll get ambiguous behaviour.

## Consultant notes

- This is the answer to "can the agent do something in our other system?" that used to mean custom plugin development. If a client has an MCP-capable backend, registering it is far cheaper than building a bespoke Copilot plugin — factor that into extensibility scoping conversations.
- The Entra-auth requirement is the first thing to check with the client's platform team. It's a hard gate, and retrofitting Entra onto an existing internal MCP endpoint can be a project in itself. Confirm it before you promise the integration.
- Maker mode being conversational rather than a UI screen throws admins who expect a settings page. Walk whoever owns this through the prompts once; it's not self-evident from the admin center.
- Governance is worth setting early: decide who can register servers and which tools get exposed. An over-permissive rollout means reps' agents can suddenly act in external systems nobody reviewed.

---

*Public preview capability as of mid-2026 — worth revisiting once maker-mode modify/remove flows are fully documented and any GA/licensing terms land*
