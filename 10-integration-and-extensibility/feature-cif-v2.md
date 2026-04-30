# Channel Integration Framework v2 (CIF v2)

**Category:** Integration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/channel-integration-framework/v2/administer/overview-channel-integration-framework

## What it does
Channel Integration Framework v2 (CIF v2) is a framework for embedding third-party communication widgets (VoIP, messaging, collaboration tools) into Dynamics 365 multi-session apps. Unlike CIF v1, which was single-session only, CIF v2 provides multi-session support, allowing agents to manage multiple conversations in parallel, and deep integration with the Omnichannel session model through context-aware APIs. CIF v2 apps are registered in Dynamics, authenticated via Entra ID, and receive session lifecycle events and conversation context in real-time.

## Key facts
- CIF v2 is multi-session; a single CIF v2 app can manage many conversations simultaneously alongside native Omnichannel channels
- CIF v2 apps run in an isolated iframe embedded in the agent interface; they cannot access the Dataverse DOM directly
- Session notifications (new call, customer transferred, call ended) are delivered via the Notification API; CIF v2 must subscribe to listen
- Context sharing: CIF v2 apps receive customer ID, account, case, and custom context via the getConversationId and getContext APIs
- CIF v2 apps authenticate via Entra ID; the agent's sign-in token is passed to the iframe, not a separate CIF token
- CIF v1 (single-session) is deprecated but still available for legacy deployments; do not build new CIF v1 integrations
- CIF v2 performance depends on the widget's load time; heavy widgets can slow agent startup
- CIF v2 apps can send messages to Copilot Studio and trigger postwork activities (feedback forms, documentation)

## When to use / skip
Use CIF v2 when you have a third-party telephony, VoIP, or communication platform that is not natively available in D365 Contact Center (e.g., a legacy PBX, SIP provider, or custom collaboration tool). Skip CIF v2 if your communication need is met by native channels (Teams, Voice, Chat)—native channels are faster and tightly integrated. Use the native Omnichannel JavaScript SDK (not CIF v2) if you only need to read conversation context and send messages from within a custom tab.

## Configuration decisions
- Register the CIF v2 app in the Channel Integration Framework configuration; provide app URL, authentication endpoint, and permissions
- Configure app permissions: (ConversationContext, ParticipantDetails, SessionContext, Notification, UserInfo)
- Define which conversation events the CIF v2 app subscribes to (SessionInitiated, ParticipantAdded, ParticipantRemoved, ConversationEnded)
- Map CIF v2 conversation IDs to Dataverse conversation records via a custom field or webhook
- Implement error handling: CIF v2 widget crashes should not block the agent interface; use iframe sandboxing
- Test CIF v2 with Omnichannel routing and supervisor takeover to ensure context flows correctly

## Gotchas
- CIF v2 iframe is sandboxed; it cannot access parent window APIs or Dataverse records directly (must use REST API)
- Session context may be delayed if Omnichannel is slow to initialize; CIF v2 must not assume context is available immediately
- CIF v2 apps run in the agent's security context; they inherit the agent's Dataverse permissions (use REST API with explicit user context)
- If CIF v2 widget fails to load, the agent can still use other channels, but CIF v2 calls will fail silently; implement fallback UI
- CIF v2 does not support transferring calls between native Omnichannel channels and CIF v2 widgets; transfer is app-to-app only
- CIF v2 session ID is unique per iframe instance; if an agent refreshes the page, a new session is created and the old one is orphaned

---

*Source last updated: 2026-04-30 | Review when: Microsoft releases CIF v2 feature updates or deprecates legacy CIF v1*
