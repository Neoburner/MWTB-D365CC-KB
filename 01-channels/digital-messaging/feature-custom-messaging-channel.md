# Custom Messaging Channel (Direct Line API)

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-custom-channel

## What it does
Connects any messaging platform or custom-built chat interface to D365 Contact Center via the Azure Bot Framework Direct Line API. Enables you to bring your own messaging platform (in-app chat, custom web chat, branded mobile app) and route conversations to Contact Center agents without using a pre-built channel.

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
Use custom messaging when you need brand control, deep app integration, or a messaging platform not supported by pre-built D365 channels. Examples: in-app customer support in your mobile app, branded web chat matching your site design, voice assistant integration, or Slack/Discord community support. Skip custom channels if you can use pre-built channels (chat, email, Teams); they are faster to configure and require less technical overhead.

## Configuration decisions
- Which platform or app will be the messaging client? (in-app, mobile, web, voice assistant, etc.)
- Will you use Copilot Studio or a custom bot deployed on Azure Bot Service?
- How will you authenticate token generation? OAuth, API key, or shared secret?
- Will conversations be stateful (bot maintains context) or stateless (full context re-sent each message)?
- Which queue(s) will receive custom channel requests?
- How will you handle bot-to-agent handoff? Automatic after X turns or manual?

## Gotchas
- Direct Line token generation must be secured; exposing the token endpoint to unauthenticated clients allows bot hijacking
- Message size limit (1 KB) is strict; large JSON payloads, file metadata, or context variables often exceed this and require workarounds
- Bot latency is additive: custom client delay + bot processing + D365 routing; total response time can be 2-5 seconds
- Conversation context lost if bot restarts or Direct Line connection drops; design for resilience and context reconstruction
- Custom channels don't appear in out-of-the-box Contact Center dashboards; you must build custom analytics and reporting
- WebSocket connections may be blocked by corporate firewalls or proxies; polling is more reliable but has higher latency
- If bot deployment fails or scales down (Azure), custom channel immediately becomes unavailable to customers; no fallback
- Adaptive cards and rich message types are custom-rendered in your client; unsupported card types render as plain text (user experience degrades)
- Testing custom channels requires end-to-end testing (client + bot + D365); integration test coverage is essential

---

*Source last updated: 2026-04-30 | Review when: Azure Bot Service API version changes or Direct Line authentication model updates*
