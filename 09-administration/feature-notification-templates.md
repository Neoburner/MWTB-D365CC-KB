# Notification Templates

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../notification-templates](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/notification-templates)

## What it does
Defines the incoming work item notification shown to reps — title, timeout, accept/reject buttons, up to 4 data fields, and desktop notification behaviour. OOB templates exist for every channel and scenario. Custom templates are assigned to workstreams.

## Key facts
- **Maximum 4 notification fields** per template
- Countdown default: 120 seconds; **setting below 5 seconds prevents desktop notification from showing**
- Desktop notification options: Always / When app is in background / Never (default)
- Desktop notifications require: Windows notifications on, browser permission granted, DND off, service worker enabled
- **SVG icons do not render in desktop notification popups**
- **Autoassign / Autoaccept are preview features** — not for production
- Authenticated vs. unauthenticated templates: system selects automatically based on whether customer is identified in D365
- OOB templates cannot be customised — create new templates
- For **record routing: Microsoft recommends no Reject button** — records are assigned regardless of rejection; the button creates misleading UX

## When to use / skip
Configure on any deployment where reps need context before accepting a work item, or where desktop notifications are needed for reps working across multiple apps/monitors. OOB defaults are reasonable for initial go-live.

## Configuration decisions
- **Which data fields to show** — customer name + case title is the most useful pairing for most scenarios; pre-chat survey responses can be added for live chat
- **Show/hide Reject button** — disabling it reduces gaming and routing delays; discuss with client operations team
- **Desktop notification setting** — "When app is in background" is the right default for most contact centres; "Always" is appropriate for high-priority queues

## Gotchas
- **Pre-chat survey slugs in notification fields** require the exact survey question slug name — if the name doesn't match, the field renders blank.
- **Incognito mode and Windows Focus Assist block desktop notifications** — commonly causes confusion during testing.

---

*Source last updated: 2025-05-20 | Review when: Autoassign/autoaccept reaches GA or new slug types added*
