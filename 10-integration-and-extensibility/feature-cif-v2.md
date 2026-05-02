# Channel Integration Framework v2 (CIF v2)

**Category:** Integration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/channel-integration-framework/v2/administer/overview-channel-integration-framework

## What it does
CIF v2 embeds third-party communication widgets (VoIP, messaging, collaboration) into D365. Multi-session by design, agents manage multiple conversations. Deep Omnichannel integration with session events and context APIs. Apps register in D365, authenticate via Entra ID.

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
Use CIF v2 for third-party telephony, VoIP, or comms platforms not available natively (legacy PBX, SIP, custom tools). Skip if native channels (Teams, Voice, Chat) cover the need. Use the Omnichannel JavaScript SDK instead if you only need to read context and send messages from a custom tab.

## Configuration decisions
- Register the CIF v2 app in the Channel Integration Framework configuration; provide app URL, authentication endpoint, and permissions
- Configure app permissions: (ConversationContext, ParticipantDetails, SessionContext, Notification, UserInfo)
- Define which conversation events the CIF v2 app subscribes to (SessionInitiated, ParticipantAdded, ParticipantRemoved, ConversationEnded)
- Map CIF v2 conversation IDs to Dataverse conversation records via a custom field or webhook
- Implement error handling: CIF v2 widget crashes should not block the agent interface; use iframe sandboxing
- Test CIF v2 with Omnichannel routing and supervisor takeover to ensure context flows correctly

## Gotchas
- CIF v2 iframe is sandboxed: no direct access to parent APIs or Dataverse (use REST API)
- Session context may be delayed: CIF v2 shouldn't assume context is ready immediately
- CIF v2 runs in agent context: inherits agent Dataverse permissions
- Widget load failure doesn't break other channels, but CIF v2 calls fail silently: implement fallback UI
- Transfers between native channels and CIF v2 are app-to-app only, not cross-integration
- Page refresh = new session; old one orphans. Session ID is iframe-unique.

## Consultant notes

- CIF v2 is the right choice when the client has a telephony or communication platform that isn't available as a native Contact Center channel and can't be replaced. The integration overhead is significant: iframe sandboxing, API authentication, session event handling: so it needs a developer, not just a configurator. Scope it accordingly and don't promise it as a "configuration task" in the project plan.
- Never build new integrations on CIF v1. It's deprecated and still technically available, which means clients on old Omnichannel implementations may have it in place and may ask to extend it. If CIF v1 is in scope, the recommendation should be migration to v2, not new development on a deprecated framework.
- The silent failure behaviour: CIF v2 widget crashes not breaking other channels: sounds reassuring but creates a diagnostic problem. Reps lose their third-party telephony widget without an obvious error, and the first symptom is usually "the phone has stopped working." Implement a visible fallback UI and logging to Application Insights so the failure is discoverable without relying on a rep to report it clearly.

---

*Source last updated: 2026-04-30 | Check this: Microsoft releases CIF v2 feature updates or deprecates legacy CIF v1*
