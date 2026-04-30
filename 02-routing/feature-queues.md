# Queues — Setup & Management

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../queues-omnichannel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/queues-omnichannel)

## What it does
Distribution containers that hold work items and route them to queue members based on a configured assignment method. Queues sit between workstreams (routing logic) and agents (work recipients). Queue type, priority, and assignment method are the three key design decisions.

## Key facts
- Three queue types: **Messaging** (chat/SMS/social/Teams), **Records** (cases/email/activities), **Voice** (inbound/outbound calls)
- Queue type **cannot be changed after creation**
- Queue priority number controls cross-queue assignment order — lower number = higher priority; default queues all share the same priority
- Three OOB fallback queues: Default messaging queue, Default entity queue, Default voice queue — all Omnichannel agents are members; settings (except assignment method) cannot be edited
- Each workstream requires a designated fallback queue — work items route here if classification errors or no rule matches
- Work items can only transfer **within the same queue type** — chat cannot transfer to a voice queue
- Operating hours are optional per queue; if not set, the queue is treated as 24/7 available

## When to use / skip
Queues are required for every routing deployment — they are the fundamental unit of work distribution.

## Configuration decisions
- Queue structure (one per LOB, per tier, per skill set) — design this before building workstreams; queue structure drives everything downstream
- Assignment method per queue — Highest Capacity for throughput, Round Robin for fairness, Least Active for blended voice/messaging teams
- Queue priority numbers — assign deliberately; leaving everything at default makes cross-queue behaviour unpredictable when agents subscribe to multiple queues
- Whether to set operating hours — relevant for any non-24/7 queue

## Gotchas
- **Queue type is permanent.** Plan the queue structure on paper before creating anything. Recreating queues post-go-live is disruptive.
- **Always configure a fallback queue per workstream.** Without it, routing errors cause work items to disappear from the flow with no obvious error.
- **Design queues before workstreams.** The most common setup mistake is building them reactively and ending up with duplicate, inconsistently named queues.

---

*Source last updated: 2026-03-25 | Review when: New assignment methods released or overflow management updates*
