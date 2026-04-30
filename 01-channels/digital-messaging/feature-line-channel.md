# LINE Channel

**Category:** Channels — Digital Messaging
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-line-channel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-line-channel)

## What it does
Routes LINE Messaging conversations into D365 unified routing queues. Representatives send and receive messages in Copilot Service workspace. Asynchronous. Requires a LINE Business account and a LINE Messaging API channel in the LINE Developers console.

## Key facts
- Needs three values from the LINE Developers console: Channel ID, Channel secret, Channel access token (long-lived)
- Webhook URL from admin center must be entered in the LINE Developers console with the Webhook toggle on
- Contact/account record linking is done by the representative on the first conversation — not automatic
- Long-lived token doesn't expire on a schedule but the LINE Messaging API channel must remain active
- Data flows outside organisational compliance and geo boundaries (including GCC) when this channel is enabled

## When to use / skip
Use specifically for clients operating in Japan, Thailand, Taiwan, or Southeast Asian markets where LINE is a dominant messaging platform. Not applicable elsewhere — don't include in scope unless the client has a concrete need for this market.

## Configuration decisions
- File attachments — toggle per direction (customer-to-rep and rep-to-customer) in workstream User features
- Whether to add an AI agent to the workstream for initial triage before human rep

## Gotchas
- **Contact record linking is a rep workflow task, not automatic.** Representatives need to manually link the LINE social profile to the correct contact on first interaction. Without training on this step, the CRM data value of the channel is significantly reduced.
- **LINE Messaging API channel must stay active.** If the client deactivates or changes their LINE Messaging API channel in LINE's console, the integration breaks. Build this into the operational handover documentation.
- **Privacy disclosure required.** Data sharing with LINE and geographic data flows must be acknowledged in the client's data processing assessment — particularly relevant for clients in regulated industries.

---

*Source last updated: 2026-01-15 | Review when: LINE API changes affect webhook configuration*
