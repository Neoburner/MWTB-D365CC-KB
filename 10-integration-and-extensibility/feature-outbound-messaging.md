# Outbound Messaging

**Category:** Integration and Extensibility
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../outbound-messaging](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/outbound-messaging)

## What it does
Enables proactive outbound messages to customers via SMS and WhatsApp, triggered by Power Automate flows (automated, instant, or scheduled). Reps cannot send outbound messages directly from the workspace — a flow is always required.

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
- **WhatsApp Template Name references no longer work** (deprecated April 2025). Any existing outbound flows using Template Name must be updated to Content Template SID.
- **Opt-in compliance is entirely the client's responsibility.** D365 passes whatever opt-in status the flow provides. If the client's CRM has stale consent data, they're sending non-compliant messages. Make this explicit in the solution design.
- **Timeline storage at scale.** High-volume campaigns with Show in timeline = Yes will visibly impact Dataverse storage costs. Default to No for campaigns.

---

*Source last updated: 2026-02-10 | Review when: Additional channels added to outbound, or rep-initiated outbound becomes available in workspace*
