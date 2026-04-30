# Apple Messages for Business Channel

**Category:** Channels — Digital Messaging
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-apple-messages-for-business-channel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-apple-messages-for-business-channel)

## What it does
Lets customers contact support through the Apple Messages app on iPhone, iPad, and Mac. Supports rich messaging: file attachments, Apple Pay payment requests, and interactive message elements. Asynchronous — conversations persist between sessions.

## Key facts
- **Not self-service.** Requires external Apple Business Register onboarding + Microsoft Support involvement before any D365 config can begin
- Two external dependencies must both complete before Dynamics 365 configuration is possible: Apple (business registration + MSP selection) and Microsoft Support (backend onboarding)
- Supports OAuth 2.0 OpenID Connect for customer identity verification
- Apple Pay requires a separate payment profile configured after initial channel setup
- Rich messages (interactive elements) are configured separately via `create-rich-messages`
- Account ID cannot be encrypted if customer-managed keys are in use

## When to use / skip
Use when the client serves a customer base with high Apple device penetration and wants to meet customers in the native Messages app. Skip if the client's customer base is mixed-platform — the onboarding overhead isn't justified unless Apple-device users are a significant segment.

## Configuration decisions
- Whether to enable Apple Pay — requires a payment profile and separate setup; scope this as a distinct work item if in scope
- Whether to require authentication — OAuth 2.0 OpenID Connect needs an Entra ID app registration (or equivalent IdP); this is an IT security team task, not an admin center task
- Rich message types to enable — assess which interactive elements add value vs add complexity

## Gotchas
- **Longest lead time of any digital channel.** Apple Business Register registration, MSP selection, and Microsoft Support backend onboarding create a multi-week process before any D365 config can start. Start the Apple onboarding at project kick-off, not during implementation.
- **Two parties must act before you can touch anything.** Neither Apple approval nor Microsoft support escalation is within your control. Build buffer into the project plan.
- **Authentication and Apple Pay can be left for a second pass** — the channel can go live without them, but they can't be used until fully configured.

---

*Source last updated: 2026-01-15 | Review when: Apple onboarding becomes self-service, or new rich message types are supported*
