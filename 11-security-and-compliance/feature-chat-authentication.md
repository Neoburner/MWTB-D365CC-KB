# Chat Authentication (OAuth 2.0 JWT)

**Category:** Security and Compliance
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../create-chat-auth-settings](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/create-chat-auth-settings)

## What it does
Validates portal sign-in status for chat customers using OAuth 2.0 JWTs. When a customer authenticates via the portal before opening chat, their identity is verified and context variables (VIP status, cart value, account data) are passed into the conversation. Reps see authentication status in the conversation summary.

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
- **Custom portal JWT implementation is web development work, not admin center config.** The D365 admin creates the auth settings record; the portal dev team builds the signing service and key endpoint. Map this dependency early.
- **Custom status codes on contacts break auto-linkage silently.** If the `sub` claim points to a contact with a non-active status code, identification fails with no error. Audit contact status codes in the target environment before relying on auto-identification.
- **JWT expiry on long portal sessions.** If a customer logs in, browses for an hour, then opens chat, the token may have expired. Work with the portal team on token refresh handling — otherwise authentication will intermittently fail.

---

*Source last updated: 2026-01-22 | Review when: Additional channels gain authentication support, or Power Apps portals authentication mechanism changes*
