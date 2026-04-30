# Persistent Chat

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/persistent-chat

## What it does
Chat conversations persist across browser sessions. Returning customers resume the same thread and see their history—no new case. Requires customer authentication to link repeat visits to the original conversation.

## Key facts
- Persistent chat requires customer identity authentication (via Azure AD B2C, custom OAuth, or D365 portal authentication)
- Conversation lifespan is configurable: conversations can remain open for 1-30 days or until manually closed
- Returning customers are matched by their authenticated identity, not browser cookies or device
- Conversation history (full message transcript) is preserved and visible to both customer and agents
- Agents can resume a conversation from any point; context is restored automatically
- Persistent conversations appear in the queue as "active" conversations, not new incoming requests
- Skills and routing rules apply at the first message; if a customer returns to a persistent chat, they route back to the original agent (if available) or available agent in the same queue
- Case record continues to be created, but persistent chat cases may have longer open times
- Multi-session conversations do not reset the conversation timeout; activity resets the timer

## When to use / skip
Use persistent chat for complex issues that span multiple days or when customer identity is stable (subscription, accounts). Skip it if most issues resolve in one session, if your team runs pure FIFO queues, or if customer auth infrastructure is absent or unreliable.

## Configuration decisions
- Which authentication method will identify returning customers? Azure AD B2C, custom OAuth, or D365 portal login?
- How long should conversations remain open? 1 day (quick issues), 7 days (typical), or 30 days (complex)?
- Should returning customers automatically route to their original agent or any available agent in queue?
- Will conversation history be visible in your customer portal, or only to agents?
- How will you handle conversations that become inactive (auto-close or manual agent review)?

## Gotchas
- Customers who clear cookies or switch browsers without logging in create new conversations; they won't be recognized as returning.
- Auth failures (AD B2C down, OAuth token expired) block persistent chat; have a fallback non-persistent option ready.
- Conversations that exceed the configured lifespan don't auto-resolve; they sit in the queue until agents manually close them.
- Original agent may not be available when a customer returns; they'll route to any agent in queue. Don't promise continuity.
- Agent notes and tags persist, but custom conversation attributes may not if the schema changes.
- Conversations running 30+ days can cause queue performance issues; consider archiving old ones.

---

*Source last updated: 2026-04-30 | Revisit when your auth system changes or conversation retention policy updates*
