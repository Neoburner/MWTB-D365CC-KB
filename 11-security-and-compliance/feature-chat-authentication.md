# Chat Authentication (OAuth 2.0 JWT)

**Category:** Security and Compliance
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../create-chat-auth-settings](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/create-chat-auth-settings)

## What it does
Validate portal sign-in status for chat customers using OAuth 2.0 JWTs. Verified customer identity passes context (VIP status, account data) into the conversation.

## Key facts
- **Supported channels: Chat and Apple Messages for Business only** — not SMS, WhatsApp, Facebook, or voice
- Requires: public key URL (endpoint returning RSA256 public key) and a JavaScript client function that retrieves the token
- **Power Apps portals:** use `<portal_base_URL>/_services/auth/publickey` and `auth.getAuthenticationToken` — requires a custom certificate uploaded to the portal
- **Custom portals:** development team must build the JWT signing service and public key endpoint
- JWT `sub` claim should contain the **GUID of the Dataverse Contact or Account** — this auto-links the record to the conversation
- Auto-linkage via `sub` only works for records with **active status codes** — custom status codes break identification silently
- Context variables passed via `lwicontexts` in the JWT payload must match context variable names defined in the workstream

## When to use / skip
Use when the client has an authenticated portal and wants to route/prioritise based on customer identity or attributes, or wants auto-populated customer records without a pre-conversation survey.

## Configuration decisions
- **Which context variables to pass via `lwicontexts`** — define in collaboration with the routing team; these variables can feed classification rules for prioritisation and routing
- **JWT expiry duration** — balance security (shorter) against usability (longer portal sessions); token refresh needs to be handled by the portal team

## Gotchas
- **Custom JWT implementation is a dev task.** D365 admin creates the auth settings; portal devs build the signing service. Map this dependency early.
- **Custom status codes break auto-linkage silently.** Non-active status codes fail with no error. Audit contact status codes before relying on auto-identification.
- **JWT expiry on long portal sessions.** Customer logs in, browses for an hour, opens chat—token's expired. Work with portal team on token refresh or authentication fails intermittently.

---

*Source last updated: 2026-01-22 | Check this: Additional channels gain authentication support, or Power Apps portals authentication mechanism changes*
