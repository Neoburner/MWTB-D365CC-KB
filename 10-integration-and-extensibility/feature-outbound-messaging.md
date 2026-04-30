# Outbound Messaging

**Category:** Integration and Extensibility
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../outbound-messaging](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/outbound-messaging)

## What it does
Sends proactive outbound messages via SMS and WhatsApp using Power Automate flows. Reps can't initiate outbound from the workspace — flows are required.

## Key facts
- Supported channels: **SMS** (ACS or Twilio) and **WhatsApp via Twilio only** — WhatsApp via ACS does not support outbound through this feature
- **Reps cannot initiate outbound from the workspace** — all outbound requires a Power Automate flow
- Three flow types: Automated (event-triggered), Instant (manual), Scheduled
- **WhatsApp Template Console Tab and Templates API deprecated April 2025** — new WhatsApp templates must use Twilio Content Template Builder (Content Template SID, not Template Name)
- **Show in timeline = Yes** creates a Dataverse activity record per message — at bulk scale this causes significant storage growth; use No for campaigns
- `optin` field in the flow's ContactList is required per recipient; D365 does not enforce compliance — the client's consent system must provide accurate opt-in status

## When to use / skip
Use when the client needs system-event-driven or campaign outbound (case updates, appointment reminders, proactive notifications). Skip if the client only needs inbound channels.

## Configuration decisions
- **Show in timeline (Yes/No)** — Yes for individual case-context notifications; No for high-volume campaigns
- **Flow type** — Automated for event-driven (case created/resolved), Scheduled for time-based campaigns, Instant for ad-hoc bulk sends

## Gotchas
- **WhatsApp Template Name is deprecated** (April 2025). Update existing flows to use Content Template SID.
- **Consent is on the client.** D365 sends whatever opt-in status the flow provides. Stale consent data = non-compliant messages. Call this out in design.
- **Timeline storage scales badly.** High-volume campaigns with Show in timeline = Yes will impact storage costs. Use No for campaigns.

---

*Source last updated: 2026-02-10 | Check this: Additional channels added to outbound, or rep-initiated outbound becomes available in workspace*
