# Facebook Channel

**Category:** Channels — Digital Messaging
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-facebook-channel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-facebook-channel)

## What it does
Routes Facebook Messenger conversations from a company's Facebook Business Page into unified routing queues. Representatives receive and respond to messages in Copilot Service workspace. Asynchronous — conversations persist between sessions.

## Key facts
- Requires a Facebook app (Developer Portal) with Messenger product added; needs App ID, App secret, and Page access token
- Page access tokens **expire randomly** — refresh on a 60-day schedule
- Standard 24-hour messaging window applies; **Facebook message tag** extends this to 7 days — must be enabled in both D365 (workstream Behaviors) **and** in the Facebook Developer Portal
- `pages_messaging` permission is required before non-app-role users can message the page; without it, development mode limits messaging to testers only
- **Business Asset User Profile Access** is a separate Facebook approval required to display the customer's username (not just their ID)
- Data flows outside organisational compliance and geo boundaries (including GCC) when this channel is enabled

## When to use / skip
Use when Facebook Messenger is a meaningful customer contact channel for the client's market. Skip for B2B clients where customers are unlikely to use Facebook Business pages for support.

## Configuration decisions
- Facebook message tag (7-day window extension) — decide before go-live; must be configured in both places
- Business Asset User Profile Access — initiate approval early if customer name display is a requirement; approval is manual and can take weeks
- Whether to support file attachments — toggle in workstream User features

## Gotchas
- **Development mode blocks customers during UAT.** Facebook app in dev mode only accepts messages from users with a role in the app. Add test accounts as Testers in App Roles, or move to live mode before production testing.
- **Access token expiry is silent.** When a Page access token expires, message delivery stops with no obvious error in the admin center. Establish a 60-day token refresh reminder in the operational runbook.
- **Both sides of the message tag must be enabled.** D365 workstream Behaviors toggle alone is not sufficient — the Facebook Developer Portal must also have the human agent tag enabled. Missing either half means the 7-day window doesn't work.

---

*Source last updated: 2026-01-20 | Review when: Facebook API changes affect webhook configuration, or access token lifecycle changes*
