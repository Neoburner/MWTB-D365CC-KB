# LINE Channel

**Category:** Channels — Digital Messaging
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-line-channel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-line-channel)

## What it does
Routes LINE messages to D365 queues. Reps send and receive in Copilot Service workspace. Async. Requires a LINE Business account and LINE Messaging API channel in the LINE Developers console.

## Key facts
- Needs three values from the LINE Developers console: Channel ID, Channel secret, Channel access token (long-lived)
- Webhook URL from admin center must be entered in the LINE Developers console with the Webhook toggle on
- Contact/account record linking is done by the representative on the first conversation — not automatic
- Long-lived token doesn't expire on a schedule but the LINE Messaging API channel must remain active
- Data flows outside organisational compliance and geo boundaries (including GCC) when this channel is enabled

## When to use / skip
Use LINE only for clients in Japan, Thailand, Taiwan, or Southeast Asia where it's dominant. Don't include it in scope unless the client specifically needs this market.

## Configuration decisions
- File attachments — toggle per direction (customer-to-rep and rep-to-customer) in workstream User features
- Whether to add an AI agent to the workstream for initial triage before human rep

## Gotchas
- Contact record linking is a rep task, not automatic. Reps must manually link the LINE profile to the correct contact on first interaction. Without training, you lose CRM value.
- LINE Messaging API channel must stay active. If the client deactivates or changes it in LINE's console, the integration breaks. Add this to your ops handover docs.
- Privacy disclosure required. Data sharing with LINE and geographic flows must be acknowledged in the client's data processing assessment—important for regulated industries.

## Consultant notes

## Consultant notes

- If a client outside Japan, Thailand, Taiwan, or Southeast Asia asks for LINE, find out who they're actually trying to reach. It's usually a specific customer segment (e.g. Japanese expats, APAC regional teams) — confirm that before putting the channel in scope, because it adds disproportionate complexity for a small user base.
- Manual contact record linking is the silent data quality problem across all social channels in D365, not just LINE. Make it part of onboarding training and build a Dataverse view that shows conversations with no linked contact, so supervisors can audit compliance.
- In regulated industries (financial services, healthcare), the data residency and privacy disclosure requirement for LINE needs to go through the client's DPO or legal team before the channel is enabled. Don't treat it as an implementation detail — it can hold up go-live.


---

*Source last updated: 2026-01-15 | Worth checking again if LINE API changes affect webhooks*
