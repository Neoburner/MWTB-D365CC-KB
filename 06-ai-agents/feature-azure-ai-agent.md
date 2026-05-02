# Azure AI Agent Integration

**Category:** AI Agents
**Applies To:** Standalone + embedded (chat and social channels only)
**Source:** [learn.microsoft.com/.../configure-bot-azure](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-bot-azure)

## What it does
Integrates an Azure Bot Service agent into D365 Contact Center for chat and social channel conversations. Alternative to Copilot Studio for organisations with existing Azure Bot Framework investments. Can also provide smart assist recommendations to reps.

## Key facts
- **Chat and social channels only** — voice channel IVR requires Copilot Studio agents, not Azure Bot Service
- Requires **User-Assigned Managed Identity** for bot registration — client secret authentication is not supported
- Setup: register Omnichannel channel in Azure portal → create application user in Power Platform admin center → assign Omnichannel agent security role → add Bot Application User form details (User type = Bot application user, Bot Application ID)
- Multiple agents: each must have a unique registered application and application ID
- **Routing loop prevention:** if the agent is in the same queue it tries to route to, it won't be re-assigned the conversation
- Smart assist via Azure agent is a separate configuration from workstream-based agent handling

## When to use / skip
Use if the client has an existing Azure Bot Framework investment or needs lower-level control than Copilot Studio. For new implementations without existing Azure bots, default to Copilot Studio.

## Configuration decisions
- Azure Bot Service vs Copilot Studio — if the client has an existing Azure bot, use this path; for new bot development, default to Copilot Studio
- Whether smart assist recommendations are needed — separate configuration from the main workstream bot setup

## Gotchas
- **User-Assigned Managed Identity is required.** Client secret authentication isn't supported. Non-obvious Azure requirement that can block setup.
- **Routing loop prevention is automatic.** If the agent stops receiving conversations after escalating, check whether it's in the same queue it's routing to.

## Consultant notes

- Default to Copilot Studio for any new bot build unless the client has an existing Azure Bot Framework investment worth preserving. The Azure path has more setup complexity and is the less-supported forward direction for D365 Contact Center.
- User-Assigned Managed Identity is the Azure-specific requirement that needs an Azure admin, not just a Power Platform admin. Get Azure admin involvement confirmed upfront — it's a different team in most enterprise clients and has its own access and approval process.
- If a client is mid-Azure-bot build when this path is discussed, check whether the Chat channel or the D365 Omnichannel extension has been registered. Both are needed and the setup order matters.

---

*Source last updated: check Microsoft Learn | Check this after Azure agent gains voice channel support*
