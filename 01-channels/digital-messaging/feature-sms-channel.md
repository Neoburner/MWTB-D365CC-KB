# SMS Channel

**Category:** Channels: Digital Messaging
**Applies To:** Standalone + embedded
**Sources:** [sms-channel-overview](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/sms-channel-overview) | [configure-sms-channel-acs](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-sms-channel-acs)

## What it does
Routes inbound SMS to reps through unified routing. Reps reply in Copilot Service workspace. Proactive outbound SMS (notifications, campaigns) requires a Power Automate flow, reps can't initiate outbound SMS directly from the workspace.

## Key facts
- Two providers: **Azure Communication Services (ACS)** and **Twilio**
- SMS is **not supported** with Azure Direct Routing: ACS managed numbers or Twilio numbers required
- The same ACS toll-free number can be shared between SMS and the voice channel
- Toll-free number verification (ACS) can take **3–6 weeks**: deliver rates are lower without it
- Representatives **cannot initiate outbound SMS**: proactive outbound requires a Power Automate flow calling the ACS or Twilio API

## When to use / skip
Use SMS for inbound customer messages and proactive notifications (appointment reminders, order updates). Skip it if reps need to initiate outbound texts directly, that requires Power Automate.

## Configuration decisions
- ACS vs Twilio: ACS is preferred if the client is already using ACS for voice; Twilio if they have an existing Twilio account
- Shared voice + SMS number or separate numbers: a single ACS toll-free number can serve both; simpler number management
- Whether proactive outbound is in scope: if yes, scope the Power Automate flow design as a separate work item

## Gotchas
- Clients assume SMS means reps can text customers. Clarify early that rep-initiated outbound isn't available in the workspace; Power Automate is required if needed.
- Toll-free verification is time-sensitive and out of your control. Submit the ACS application early: unverified numbers get higher carrier filtering. Don't defer to the final week.
- Twilio migration uses a separate path. If migrating from Twilio SMS to ACS, use `migrate-config-data-for-sms-channel`, not the standard configuration flow.

## Consultant notes

- Rep-initiated outbound SMS comes up on almost every project where SMS is in scope. Cover it explicitly in the first channel scoping call: clients assume reps can text customers from the workspace; the requirement for a Power Automate flow surprises them.
- Toll-free verification lead time needs to be built into the project plan as a fixed milestone, not a later-phase task. 3–6 weeks is the real-world range; submitting in the last fortnight of the project isn't recoverable.
- If the client is already on Twilio for something else, it's usually easier to stay on Twilio for SMS rather than migrate to ACS. Avoid re-platforming unless there's a good reason.

---

*Source last updated: 2026-02-08 | Worth checking again if direct outbound SMS is added to workspace, or new SMS providers become available*
