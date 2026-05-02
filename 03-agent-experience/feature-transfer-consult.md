# Transfer and Consult Settings

**Category:** Agent Experience
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../enable-transfer-consult](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-transfer-consult)

## What it does
Controls how reps can reach other reps or queues during a live conversation. Default OOB: rep-to-rep consult and transfer-to-queue. Additional capabilities, consult to queue (intelligent selection), direct transfer to rep, wrap-up time after transfer, and FetchXML rep/queue filtering, require explicit enablement.

## Key facts
- **OOB defaults:** consult with specific rep (enabled), transfer to queue (enabled), consult to queue (disabled), direct transfer to rep (disabled)
- **Consult to queue:** system selects the most eligible rep from a queue; configurable countdown timer per channel before timeout
- **Direct transfer to rep:** adds a Representatives tab on the communication panel; requires explicit toggle
- **Wrap-up after transfer:** provides wrap-up time when a rep transfers; depends on Block capacity for wrap-up being configured in the workstream: toggle alone has no effect without workstream config
- **Capacity blocking during consult:** off by default for rep-to-rep consults; must be explicitly enabled
- **FetchXML filters:** disabled by default; without them, all reps and queues are visible across all teams; required for multi-team or multi-BU deployments to restrict visibility
- Consult inbox view (to track active consult sessions) requires a custom view with specific conditions: no OOB consult-specific view exists

## When to use / skip
Required config on any deployment with more than one team or one queue. Consult to queue should be enabled by default, it's almost always preferable to requiring reps to know who's available.

## Configuration decisions
- Consult to queue vs direct consult: consult to queue routes to the most eligible rep; direct consult requires the rep to pick a person manually; most deployments should enable consult to queue
- FetchXML filters: define which reps and queues are visible per context; critical for multi-team deployments to prevent accidental cross-team transfers
- Capacity blocking during consult: decide whether a rep engaged in a consult should be blocked from receiving new work; surface this in the capacity design discussion

## Gotchas
- **Wrap-up after transfer requires workstream wrap-up config.** Enabling the toggle without configuring Block capacity for wrap-up in the workstream does nothing: common missed dependency.
- **FetchXML filters are off by default.** In multi-team orgs, reps can see all teams' queues and reps in the consult/transfer panel without filtering. Visibility and compliance risk that's easy to miss.
- **Consult inbox view is not OOB.** Reps in high-consult-volume roles need to track active consults. Won't have a view unless explicitly configured.

## Consultant notes

- FetchXML filters being off by default is the multi-team deployment risk that's easy to miss. Without filters, reps can see and transfer to queues across all teams and business units: which is both an operational problem (accidental misdirects) and potentially a compliance one. Enable filters on any deployment with more than one team from day one.
- Wrap-up after transfer requiring workstream config is one to add to the setup checklist. The toggle alone does nothing. It's a two-step dependency that's easy to tick off as complete when it isn't.
- Consult to queue should be enabled by default on most deployments. Requiring reps to know which specific person is available for a consult doesn't scale: consult-to-queue removes that cognitive overhead and routes to the best available rep automatically.

---

*Source last updated: 2026-01-23 | Review when: Consult/transfer options expanded for voice-specific scenarios*
