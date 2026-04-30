# Omnichannel JavaScript SDK

**Category:** Integration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/develop/omnichannel-javascript-api-reference

## What it does
The Omnichannel JavaScript SDK is a client-side library that allows custom code (in agent UI tabs, CIF v2 widgets, or chat widget customizations) to interact with the D365 Contact Center session, read conversation context (customer ID, conversation ID, chat history), send messages on behalf of the agent, and listen to conversation lifecycle events. It is available in two flavors: agent-side SDK (OmnichannelClientFactory) for agent-facing tabs and supervisor tools, and customer-side SDK (Omnichannel Chat SDK) for embedded chat widgets.

## Key facts
- Agent-side SDK methods: getConversationId, getConversationContext, getParticipants, sendMessage, getMessages, subscribeToConversation
- Customer-side Chat SDK methods: setAuthenticationToken, startChat, endChat, sendMessage, addEventListener
- SDK requires the agent/customer to have an active session; outside a session, SDK calls return null or error
- Conversation context includes customer record ID, account, case (if linked), custom attributes, and chat history
- Agent-side SDK runs in the agent's security context; API calls use the agent's permissions
- Customer-side Chat SDK runs in the browser's same-origin context; it enforces your chat widget's content security policy
- SDK is asynchronous; all methods return promises or use event listeners for responses
- SDK version must match the D365 Contact Center deployment version; incompatible versions may fail silently

## When to use / skip
Use the agent-side SDK to build custom agent tabs that display context-sensitive information (e.g., customer risk score, next best action recommendation). Use the customer-side Chat SDK to customize the embedded chat widget (branding, auto-routing, knowledge base search). Skip hardcoding conversation IDs or agent IDs; always use SDK methods to retrieve them dynamically. Do NOT use the SDK to bypass security roles or access records the agent should not see—SDK calls inherit the agent's permissions.

## Configuration decisions
- Add the SDK library (OmnichannelClientFactory) via a script tag or npm package in your custom tab or CIF v2 widget
- Initialize the SDK connection on tab load; handle connection failures gracefully
- Subscribe to conversation events (new message, participant added, conversation ended) using addEventListener
- Implement message sending with error handling; messages may fail if the conversation is ended
- For Chat SDK customization, map widget buttons to SDK methods (sendMessage, endChat) via event listeners
- Log SDK errors to Application Insights for troubleshooting; SDK call failures may not be visible in the agent UI

## Gotchas
- SDK is not available outside an active conversation session; custom tabs or widgets that load before a conversation is assigned will have null context
- getConversationId and getConversationContext are async; do not assume they are available synchronously on tab load
- sendMessage calls are logged in the conversation transcript; be cautious about sending system messages or metadata
- Customer-side Chat SDK cannot access agent-side context; it has no knowledge of agent name, skill, or queue
- SDK version mismatch can cause silent failures; if an agent updates to a new D365 version but the custom code uses old SDK methods, calls will fail
- Conversation context is read-only; you cannot update customer record or conversation attributes via SDK (use REST API for updates)
- If a conversation is transferred to another agent, the SDK session continues; but the security context remains the original agent's

---

*Source last updated: 2026-04-30 | Review when: Omnichannel JavaScript SDK releases new methods or chat widget customization APIs change*
