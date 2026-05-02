# Omnichannel JavaScript SDK

**Category:** Integration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/develop/omnichannel-javascript-api-reference

## What it does
Client-side library for custom code in agent tabs, CIF v2 widgets, or chat customizations. Read context, send messages, listen to lifecycle events. Two versions: OmnichannelClientFactory (agent-side) and Omnichannel Chat SDK (customer-side).

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
Use agent-side SDK for custom tabs (risk scores, next best action). Use Chat SDK for chat widget customisation. Never hardcode conversation or agent IDs — use SDK methods. Don't use the SDK to bypass security roles or access restricted records.

## Configuration decisions
- Add the SDK library (OmnichannelClientFactory) via a script tag or npm package in your custom tab or CIF v2 widget
- Initialize the SDK connection on tab load; handle connection failures gracefully
- Subscribe to conversation events (new message, participant added, conversation ended) using addEventListener
- Implement message sending with error handling; messages may fail if the conversation is ended
- For Chat SDK customization, map widget buttons to SDK methods (sendMessage, endChat) via event listeners
- Log SDK errors to Application Insights for troubleshooting; SDK call failures may not be visible in the agent UI

## Gotchas
- SDK unavailable before conversation assignment — null context on tab load.
- getConversationId and getConversationContext are async — don't assume synchronous availability.
- sendMessage gets logged in transcript — careful with system messages or metadata.
- Chat SDK can't see agent context — no agent name, skill, or queue visibility.
- SDK version mismatch = silent failures. Old code + new D365 version = broken calls.
- Context is read-only — use REST API for updates.
- Transferred conversations keep the SDK session but retain the original agent's security context.

## Consultant notes

- SDK version management is the ongoing maintenance concern that gets forgotten after go-live. D365 Contact Center updates regularly, and SDK version mismatches produce silent failures — not obvious error messages. If the client has custom tabs or chat widget customisations built on the SDK, they need a process for checking SDK compatibility after each D365 update and retesting the custom code. Build this into the operational handover, not as an afterthought.
- The "context unavailable before conversation assignment" timing issue is the most common source of bugs in custom tab development. The tab loads when the session starts, but the conversation context isn't available yet. Code that assumes synchronous availability will fail on a race condition that appears to work in testing (where the tab loads slightly after assignment) but fails in production under different timing. Async handlers with appropriate null checks are the right approach — document this for any developer building on the SDK.
- `sendMessage` writing to the transcript is a footgun for developers who use it to log debugging or system metadata. Everything that goes through `sendMessage` appears in the conversation transcript visible to both the rep and potentially the customer. Use Application Insights for SDK diagnostic logging instead.

---

*Source last updated: 2026-04-30 | Check this: Omnichannel JavaScript SDK releases new methods or chat widget customization APIs change*
