# Notification Templates

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../notification-templates](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/notification-templates)

## What it does
Defines the incoming work item notification shown to reps, title, timeout, accept/reject buttons, up to 4 data fields, and desktop notification behaviour. OOB templates exist for every channel and scenario. Custom templates are assigned to workstreams.

## Key facts
- **Maximum 4 notification fields** per template
- Countdown default: 120 seconds; **setting below 5 seconds prevents desktop notification from showing**
- Desktop notification options: Always / When app is in background / Never (default)
- Desktop notifications require: Windows notifications on, browser permission granted, DND off, service worker enabled
- **SVG icons do not render in desktop notification popups**
- **Autoassign / Autoaccept are preview features**: not for production
- Authenticated vs. unauthenticated templates: system selects automatically based on whether customer is identified in D365
- OOB templates cannot be customised: create new templates
- For **record routing: Microsoft recommends no Reject button**: records are assigned regardless of rejection; the button creates misleading UX

## When to use / skip
Configure on any deployment where reps need context before accepting a work item, or where desktop notifications are needed for reps working across multiple apps/monitors. OOB defaults are reasonable for initial go-live.

## Configuration decisions
- **Which data fields to show**: customer name + case title is the most useful pairing for most scenarios; pre-chat survey responses can be added for live chat
- **Show/hide Reject button**: disabling it reduces gaming and routing delays; discuss with client operations team
- **Desktop notification setting**: "When app is in background" is the right default for most contact centres; "Always" is appropriate for high-priority queues

## Gotchas
- **Pre-chat survey slugs in notification fields** require the exact survey question slug name: mismatched names render blank fields.
- **Incognito mode and Windows Focus Assist block desktop notifications**: common cause of confusion during testing.

## Consultant notes

- Notification field selection is worth a quick conversation with the client's team leader or supervisor: they'll have strong opinions about what context helps reps prioritise before accepting. Customer name plus queue name is a reasonable default; adding a pre-chat survey field (issue type, product) can significantly reduce the time it takes a rep to decide whether to accept a transfer or pick a specific queue. Keep it to the 4-field limit and make choices that are genuinely useful, not just "fill the available space".
- Desktop notification testing almost always produces confusion during UAT. Incognito mode, Windows Focus Assist, and browser permission prompts that were dismissed will all silently prevent notifications from appearing. Test desktop notifications specifically on a standard-issue client machine with a standard user account: not on a dev laptop with non-standard browser settings: to get a representative result.
- The Reject button decision is worth documenting explicitly in the design. Some clients want it because it feels like proper queue management; others are concerned about reps gaming the system by rejecting conversations selectively. For record routing, the recommendation to remove it is based on the fact that rejection doesn't actually re-route the item in the same way: making the button misleading. Agree the decision with the operations lead and capture it in the design document.

---

*Source last updated: 2025-05-20 | Check this: Autoassign/autoaccept reaches GA or new slug types added*
