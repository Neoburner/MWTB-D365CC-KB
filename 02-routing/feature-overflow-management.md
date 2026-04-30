# Overflow Management

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../manage-overflow](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/manage-overflow)

## What it does
Defines what happens to a work item when a queue can't serve it — queue full, outside operating hours, or predicted wait too long. Two trigger points: pre-queue (before the item enters the queue) and post-queue (while it's already waiting).

## Key facts
- **Pre-queue conditions:** Out of operating hours, Work item limit exceeds (1–100), Average wait time threshold (voice only, 30 sec–60 min)
- **Post-queue conditions:** Wait time in queue exceeds (voice: 1–60 min; messaging: 1 min–2 days; records: 3 min–2 days)
- **Voice pre-queue actions:** Assign anyway, Direct callback, End call, Transfer to queue, Transfer to external number, Voicemail
- **Messaging pre-queue actions:** Assign anyway, End conversation, Transfer to queue
- **Post-queue voice actions (transferred/overflowed items):** Transfer to queue and Transfer to external number only — callback/voicemail not available for these
- Pre-queue check runs **once only** — if supervisor transfers after overflow fires, no further pre-queue checks occur
- **Fallback queue always bypasses overflow** — items routed to fallback are always accepted
- Queue count for work item limit condition updates every **10 seconds** — brief burst overflow possible near threshold
- **Rule-specific overflow overrides** can be set per route-to-queue rule — overrides queue-level defaults for specific work items (e.g. VIP work never ends a call, even if the queue's default is "End call")
- **AI-powered immediate overflow (Preview):** fires instantly when no eligible rep is available, without time-based conditions; configured via Conversation Orchestration playbooks

## When to use / skip
Always configure overflow for production deployments. Without it, customers wait indefinitely when queues are full or closed. Direct callback is the highest-value voice overflow action for most contact centres.

## Configuration decisions
- Pre-queue vs post-queue conditions — both serve different scenarios; pre-queue handles arrival-time decisions, post-queue handles already-waiting items that breach SLA
- Direct callback vs voicemail vs transfer — callback is best for voice when reps will be available soon; voicemail for after-hours; transfer to another queue for cross-team coverage
- Rule-specific overrides — use for tiered service (VIP customers bypass the same overflow actions that apply to standard customers on the same queue)

## Gotchas
- **Operating hours on a queue auto-creates an overflow condition** that cannot be deleted — only its action can be changed.
- **Out-of-hours overflow must be explicitly tested in UAT.** Testers work during business hours and almost never test this scenario. Deliberately set a queue to "out of hours" during testing.
- **Voice post-queue actions are restricted for transferred/overflowed items.** A call that's already been transferred or overflowed once can only be transferred again or sent to an external number — not offered callback or voicemail. Plan multi-hop overflow scenarios accordingly.
- **AI-powered immediate overflow is Preview.** Don't use in production for regulated environments yet.

---

*Source last updated: 2026-04-27 | Review when: AI-powered immediate overflow reaches GA or new overflow action types added*
