# Enhanced Customer Authentication

**Category:** Security and Compliance
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/identify-customers-enhanced-authentication

> **Status:** Planned: no public preview. GA: Sep 2026

## What it does
Expands authentication options for the live chat widget to include OAuth 2.0 alongside existing JWT-based auth, aligns auth configuration with Copilot Studio, and adds mid-conversation authentication, letting an anonymous customer prove their identity during an active live chat without starting over.

## Key facts
- GA: Sep 2026; no public preview phase announced
- Adds OAuth 2.0 as an authentication method alongside the existing JWT approach: both will be supported
- Authentication configuration aligned with Copilot Studio, so a single auth method works across D365 CC and CS agents
- Mid-conversation authentication: a rep or AI agent can trigger an auth prompt mid-chat for a customer who started anonymously
- Existing auth setup (JWT-based) continues to work; OAuth 2.0 is additive
- Covers synchronous live chat only: async channels not mentioned

## When to use / skip
Mid-conversation auth is the headline here. Use it if you have use cases where customers start a chat without logging in (browse/triage flows) but then need to authenticate to access account-specific data. OAuth 2.0 support is worth switching to if your identity provider already speaks OAuth 2.0 and the JWT token setup has been fiddly to maintain. Skip the whole thing for Sep 2026 if your deployment is going live before then, the existing auth will hold.

## Configuration decisions
- Decide whether to migrate existing JWT auth to OAuth 2.0 or run both in parallel
- Design the mid-conversation auth trigger: which event (rep action, intent detection, AI agent escalation) will prompt the customer to authenticate?
- Align with Copilot Studio agents if any AI agents in your workstreams need the same identity: the shared auth model is the point here
- Test mid-conversation auth UX carefully: a poorly timed auth prompt will frustrate customers

## Gotchas
- "Aligned with Copilot Studio" likely means your CS agent and CC agent need to share the same identity provider config. If they've been set up independently, this will require coordination to untangle.
- Mid-conversation auth in live chat resets session-level context in some systems: check whether Copilot conversation summaries and entity records pick up the authenticated identity retroactively.
- OAuth 2.0 is listed alongside JWT, not replacing it. Don't assume a migration is required: but if you're setting up fresh from Sep 2026, OAuth 2.0 is probably the right default.

## Consultant notes

- This is a planned feature, not yet GA (September 2026). Don't scope it into a project going live before then. The existing JWT-based chat authentication is the current standard and works fine for production deployments. Check back at GA to see whether the OAuth 2.0 implementation matches the preview documentation before committing to it.
- The mid-conversation authentication capability is the genuinely new design pattern here. Current chat auth is all-or-nothing at session start: either the customer is authenticated when they open the chat, or they're not. Mid-conversation auth enables browse-first, authenticate-when-needed flows, which is a different UX pattern that opens up new use cases (anonymous triage to authenticated account support). Worth considering in solution design for deployments going live post-September 2026.
- If the deployment includes both Contact Center and Copilot Studio agents, the shared auth model between them is the practical benefit of this feature. Currently, D365 CC and CS agents can have separate auth configurations that create inconsistency. The alignment is worth planning for if the deployment has both components: flag it in the design so whoever implements auth knows which components need to share configuration when the feature reaches GA.

---

*Revisit when GA notes are published in Sep 2026 to confirm identity provider requirements and mid-conversation auth configuration steps.*
