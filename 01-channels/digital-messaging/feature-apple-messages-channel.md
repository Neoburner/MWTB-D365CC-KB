# Apple Messages for Business Channel

**Category:** Channels — Digital Messaging
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-apple-messages-for-business-channel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-apple-messages-for-business-channel)

## What it does
Customers contact support via Apple Messages on iPhone, iPad, and Mac. Supports rich messaging: file attachments, Apple Pay, interactive elements. Async—conversations persist between sessions.

## Key facts
- **Not self-service.** Requires external Apple Business Register onboarding + Microsoft Support involvement before any D365 config can begin
- Two external dependencies must both complete before Dynamics 365 configuration is possible: Apple (business registration + MSP selection) and Microsoft Support (backend onboarding)
- Supports OAuth 2.0 OpenID Connect for customer identity verification
- Apple Pay requires a separate payment profile configured after initial channel setup
- Rich messages (interactive elements) are configured separately via `create-rich-messages`
- Account ID cannot be encrypted if customer-managed keys are in use

## When to use / skip
Use Apple Messages if the customer base has high Apple device penetration and you want to meet them in the native app. Skip if the base is mixed-platform—the onboarding overhead isn't justified unless Apple users are significant.

## Configuration decisions
- Whether to enable Apple Pay — requires a payment profile and separate setup; scope this as a distinct work item if in scope
- Whether to require authentication — OAuth 2.0 OpenID Connect needs an Entra ID app registration (or equivalent IdP); this is an IT security team task, not an admin center task
- Rich message types to enable — assess which interactive elements add value vs add complexity

## Gotchas
- Longest lead time of any digital channel. Apple Business Register registration, MSP selection, and Microsoft Support backend onboarding take weeks before you can touch D365 config. Start Apple onboarding at project kick-off, not during implementation.
- Two parties must move before you can do anything. Apple approval and Microsoft support escalation are out of your control. Build buffer into the timeline.
- Authentication and Apple Pay can ship in a second phase—the channel goes live without them, but you'll need them fully configured to use them.

---

*Source last updated: 2026-01-15 | Revisit when Apple onboarding becomes self-service, or new rich message types land*
