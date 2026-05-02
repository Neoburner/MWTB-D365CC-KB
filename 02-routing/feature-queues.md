# Queues: Setup & Management

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../queues-omnichannel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/queues-omnichannel)

## What it does
Distribution containers that hold work items and route them to queue members based on a configured assignment method. Queues sit between workstreams (routing logic) and agents (work recipients). Queue type, priority, and assignment method are the three key design decisions.

## Key facts
- Three queue types: **Messaging** (chat/SMS/social/Teams), **Records** (cases/email/activities), **Voice** (inbound/outbound calls)
- Queue type **cannot be changed after creation**
- Queue priority number controls cross-queue assignment order: lower number = higher priority; default queues all share the same priority
- Three OOB fallback queues: Default messaging queue, Default entity queue, Default voice queue: all Omnichannel agents are members; settings (except assignment method) cannot be edited
- Each workstream requires a designated fallback queue: work items route here if classification errors or no rule matches
- Work items can only transfer **within the same queue type**: chat cannot transfer to a voice queue
- Operating hours are optional per queue; if not set, the queue is treated as 24/7 available

## When to use / skip
Queues are required for every routing deployment, they are the fundamental unit of work distribution.

## Configuration decisions
- Queue structure (one per LOB, per tier, per skill set): design this before building workstreams; queue structure drives everything downstream
- Assignment method per queue: Highest Capacity for throughput, Round Robin for fairness, Least Active for blended voice/messaging teams
- Queue priority numbers: assign deliberately; leaving everything at default makes cross-queue behaviour unpredictable when agents subscribe to multiple queues
- Whether to set operating hours: relevant for any non-24/7 queue

## Gotchas
- **Queue type is permanent.** Plan the queue structure on paper first. Recreating queues post-go-live is disruptive.
- **Always configure a fallback queue per workstream.** Without it, routing errors cause work items to vanish silently.
- **Design queues before workstreams.** Common mistake: build them reactively and end up with duplicate, inconsistently named queues.

## Consultant notes

- Queue design on paper first is non-negotiable. Every project where queues get built reactively ends up with poorly named duplicates, inconsistent priority numbers, and settings that contradict each other. One whiteboard session before anyone touches the admin centre saves days of cleanup.
- Queue type being permanent is worth putting on a printed checklist for the config sprint. If a client adds a voice channel six months after go-live, they'll need a voice queue regardless of what exists. Think ahead in the design phase.
- Fallback queue per workstream is the quiet gap. Miss it and routing errors drop work silently: no error, no alert, just items disappearing. Always configure it and verify it explicitly via routing diagnostics in UAT.

---

*Source last updated: 2026-03-25 | Review when: New assignment methods released or overflow management updates*
