# Facebook Channel

**Category:** Channels: Digital Messaging
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-facebook-channel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-facebook-channel)

## What it does
Routes Facebook Messenger conversations from a Facebook Business Page into queues. Reps receive and respond in Copilot Service workspace. Async, conversations persist between sessions.

## Key facts
- Requires a Facebook app (Developer Portal) with Messenger product added; needs App ID, App secret, and Page access token
- Page access tokens **expire randomly**: refresh on a 60-day schedule
- Standard 24-hour messaging window applies; **Facebook message tag** extends this to 7 days: must be enabled in both D365 (workstream Behaviors) **and** in the Facebook Developer Portal
- `pages_messaging` permission is required before non-app-role users can message the page; without it, development mode limits messaging to testers only
- **Business Asset User Profile Access** is a separate Facebook approval required to display the customer's username (not just their ID)
- Data flows outside organisational compliance and geo boundaries (including GCC) when this channel is enabled

## When to use / skip
Use Facebook if Messenger is a real customer channel in the client's market. Skip it for B2B where customers won't use Facebook Business pages for support.

## Configuration decisions
- Facebook message tag (7-day window extension): decide before go-live; must be configured in both places
- Business Asset User Profile Access: initiate approval early if customer name display is a requirement; approval is manual and can take weeks
- Whether to support file attachments: toggle in workstream User features

## Gotchas
- Development mode blocks real customers during UAT. Facebook dev mode only accepts messages from app testers. Add test accounts to App Roles or move to live mode before UAT.
- Token expiry is silent. Page access tokens expire with no visible error in the admin center. Set up a 60-day refresh reminder in your ops runbook.
- Message tag requires both D365 and Facebook enabled. The workstream Behaviors toggle alone isn't enough: the Facebook Developer Portal must also have the human agent tag on. Miss either side and the 7-day window breaks.

## Consultant notes

- Development mode blocking real customers is the single most common Facebook UAT failure. "Move to live mode" belongs on every go-live checklist: it's a 30-second task that's easy to forget when you're in the middle of a busy cutover.
- Token expiry needs to be in the client's ops runbook as a recurring calendar task, not just a footnote in the handover document. It expires silently, breaks the channel, and then someone notices a week later when customer messages have been going nowhere. A 60-day reminder is the fix.
- Business Asset User Profile Access approval is manual and can take weeks. If the client needs customer names to display (not just IDs), initiate this Facebook approval at the start of the project, not during configuration.

---

*Source last updated: 2026-01-20 | Worth checking again if Facebook API changes affect webhooks, or the token lifecycle changes*
