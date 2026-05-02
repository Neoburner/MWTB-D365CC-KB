# Custom Messaging Channel (Direct Line API)

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-custom-channel

## What it does
Connects any messaging platform or custom chat interface to Contact Center via the Azure Bot Framework Direct Line API. Bring your own platform (in-app chat, custom web chat, branded app) and route to agents without a pre-built channel.

## Key facts
- Requires a Copilot Studio bot (Power Virtual Agent) or custom bot deployed on Azure Bot Service
- Direct Line token is generated per conversation; tokens are short-lived (default 1 hour expiration)
- Bot forwards customer messages to D365 Contact Center via Direct Line protocol
- Custom channels must implement OAuth or API key authentication for token generation and message routing
- Message size limit: 1 KB per message; large payloads require chunking or external storage references
- Direct Line supports message attachments (files, images); file size is limited by Azure Storage backend (default 5 GB per file)
- Bot can be stateless or stateful; stateful bots maintain conversation context (recommended for better handoff to agents)
- Direct Line API polling-based (bot polls for messages from client) or WebSocket-based (real-time bidirectional); WebSocket has lower latency
- Custom channels don't have a pre-built UI; you must build the front-end in your app (mobile, web, kiosk, etc.)
- Supports rich message types: text, buttons, adaptive cards, quick replies, and custom JSON payloads

## When to use / skip
Use custom messaging when you need brand control, deep app integration, or a platform not supported by pre-built channels, in-app support, branded web chat, voice assistants, Slack/Discord community support. Skip custom channels if you can use pre-built ones (chat, email, Teams); they're faster to configure and less overhead.

## Configuration decisions
- Which platform or app will be the messaging client? (in-app, mobile, web, voice assistant, etc.)
- Will you use Copilot Studio or a custom bot deployed on Azure Bot Service?
- How will you authenticate token generation? OAuth, API key, or shared secret?
- Will conversations be stateful (bot maintains context) or stateless (full context re-sent each message)?
- Which queue(s) will receive custom channel requests?
- How will you handle bot-to-agent handoff? Automatic after X turns or manual?

## Gotchas
- Direct Line token generation must be secured; exposed endpoints allow bot hijacking.
- 1 KB message size limit is strict; large JSON, metadata, or context variables often exceed it and need workarounds.
- Bot latency is additive: custom client + bot processing + D365 routing = 2-5 seconds total.
- Conversation context is lost if the bot restarts or Direct Line drops; design for resilience and context reconstruction.
- Custom channels don't appear in out-of-the-box dashboards; you'll build custom analytics and reporting.
- WebSocket can get blocked by corporate firewalls; polling is more reliable but slower.
- If bot deployment fails or scales down, the custom channel goes unavailable immediately: no fallback.
- Adaptive cards and rich types are custom-rendered in your client; unsupported types degrade to plain text.
- Custom channels need end-to-end testing (client + bot + D365); integration coverage is essential.

## Consultant notes

## Consultant notes

- Clients hear "custom messaging channel" and assume it means anything is possible with minimal effort. Scope it carefully upfront: this is a developer task (bot deployment, Direct Line integration, front-end UI), not a consultant configuration task. If the client doesn't have Azure/bot development resource confirmed, this feature shouldn't be in scope.
- The most common production incident with custom channels is insecure token generation: the Direct Line token endpoint gets exposed without auth and the bot gets hijacked or flooded. Make security review of the token endpoint a mandatory sign-off before go-live.
- Always challenge the requirement first. Nine times out of ten the client wants custom branding or a non-standard platform, not a genuinely custom protocol. Check whether a pre-built channel (live chat widget with CSS overrides, WhatsApp Business) actually meets the need before committing to Direct Line complexity.
- The 1 KB message size limit will hit you in production if you're passing conversation context or metadata through the message payload. Design the context handoff via a separate mechanism (Dataverse, Azure Storage) before you discover the limit under load.


---

*Source last updated: 2026-04-30 | Worth checking again if Azure Bot Service API changes or Direct Line auth model updates*
