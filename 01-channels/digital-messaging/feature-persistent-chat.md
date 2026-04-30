# Persistent Chat

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/persistent-chat

## What it does
Enables chat conversations to persist across multiple browser sessions. When a returning customer visits your website, they resume the same conversation thread with their previous chat history visible—no new case required. Requires customer authentication to link return visits to the original conversation.

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
Use persistent chat for complex, multi-step support issues where customers need time to gather information between responses. Also use for subscription or account services where the customer identity is stable. Skip persistent chat if your support team uses a pure first-in-first-out queue model or if most customer issues resolve in a single session. Also skip if customer authentication infrastructure is not in place or unreliable.

## Configuration decisions
- Which authentication method will identify returning customers? Azure AD B2C, custom OAuth, or D365 portal login?
- How long should conversations remain open? 1 day (quick issues), 7 days (typical), or 30 days (complex)?
- Should returning customers automatically route to their original agent or any available agent in queue?
- Will conversation history be visible in your customer portal, or only to agents?
- How will you handle conversations that become inactive (auto-close or manual agent review)?

## Gotchas
- If a customer clears their cookies or uses a different browser without logging in, they will not be recognized as a returning customer; a new conversation is created
- Authentication method failures (AD B2C down, OAuth token expired) will block the persistent chat feature; have a fallback non-persistent chat option
- Persistent conversations that exceed the configured lifespan don't auto-resolve; they remain open and may clutter the queue if agents don't manually close them
- If the original agent is no longer available, returning customers will route to any agent in queue; don't assume continuity of support
- Agent notes and conversation tags are preserved, but custom conversation attributes may not persist if the schema changes
- Long-running persistent conversations (30+ days) can create performance issues in the queue; consider archiving old conversations

---

*Source last updated: 2026-04-30 | Review when: authentication system changes or conversation retention policy updates*
