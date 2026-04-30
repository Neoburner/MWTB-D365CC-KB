# SMS Channel

**Category:** Channels — Digital Messaging
**Applies To:** Standalone + embedded
**Sources:** [sms-channel-overview](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/sms-channel-overview) | [configure-sms-channel-acs](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-sms-channel-acs)

## What it does
Routes inbound SMS conversations to representatives through unified routing. Representatives can reply to customer SMS messages in Copilot Service workspace. Proactive outbound SMS (notifications, campaigns) requires a Power Automate flow — representatives cannot initiate outbound SMS directly.

## Key facts
- Two providers: **Azure Communication Services (ACS)** and **Twilio**
- SMS is **not supported** with Azure Direct Routing — ACS managed numbers or Twilio numbers required
- The same ACS toll-free number can be shared between SMS and the voice channel
- Toll-free number verification (ACS) can take **3–6 weeks** — deliver rates are lower without it
- Representatives **cannot initiate outbound SMS** — proactive outbound requires a Power Automate flow calling the ACS or Twilio API

## When to use / skip
Use when the client wants to support inbound customer SMS or send proactive notifications (appointment reminders, order updates). Not suitable if the client needs representatives to directly initiate outbound text conversations — that workflow requires Power Automate.

## Configuration decisions
- ACS vs Twilio — ACS is preferred if the client is already using ACS for voice; Twilio if they have an existing Twilio account
- Shared voice + SMS number or separate numbers — a single ACS toll-free number can serve both; simpler number management
- Whether proactive outbound is in scope — if yes, scope the Power Automate flow design as a separate work item

## Gotchas
- **"SMS channel" leads clients to expect reps can text customers.** Clarify early that rep-initiated outbound is not available in the workspace. If the client needs this, it requires a Power Automate flow.
- **Toll-free verification is time-sensitive and outside your control.** Submit the ACS toll-free verification application as early as possible — unverified numbers have higher carrier filtering rates. Don't leave this for the final week.
- **Twilio migration has a separate path.** If migrating from Twilio SMS to ACS, use `migrate-config-data-for-sms-channel` — not the standard channel configuration flow.

---

*Source last updated: 2026-02-08 | Review when: Direct outbound SMS from workspace is supported, or additional SMS providers added*
