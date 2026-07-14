# Bullseye Routing

> **Status:** Public Preview — behaviour may change.

**Category:** Routing
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-bullseye-routing

## What it does
Bullseye routing assigns a conversation by starting with a tight, targeted pool of users in a queue and progressively widening that pool over time until someone eligible picks it up. You configure the expansion as levels inside a conversation orchestration playbook: Level 0 is the innermost ring, and each subsequent level adds more user groups after a wait-time threshold. Earlier levels stay active as later ones open up, and they keep higher assignment priority.

## Key facts
- Configured entirely through [conversation orchestration](feature-conversation-orchestration.md) playbooks — there's no separate "bullseye" toggle. It's a playbook pattern built on levels and wait times.
- Assignment is cumulative: adding Level 1 doesn't drop Level 0. Once expanded, all active levels are considered together, with earlier levels ranked higher.
- Levels are built from **user groups**, not individual queue members. When a user group is attached to a queue, its members become part of the queue automatically — you don't add them to the queue separately.
- Minimum wait time for a level is 30 seconds; each subsequent level must match the previous wait time or increase by at least 10 seconds. Level 1 is the exception — it can be set to 0 seconds.
- Levels sharing the same wait time expand at the same moment, but user-group priority is still preserved (an earlier level outranks a later one even when they fire together).
- Within a level, when several reps are equally eligible, the queue's own assignment strategy (round robin, highest capacity, least active) breaks the tie. **Custom assignment is not supported** with bullseye.
- All the usual eligibility checks still apply — presence, capacity, and skills (if skill-based routing is on).
- A fallback option runs after all levels are exhausted: either assign to any eligible user in the queue, or restrict to users within the defined groups.
- Wait time is measured cumulatively from the first assignment attempt to a human rep. Transferring the conversation to another queue resets it back to Level 0.
- Playbooks only surface user groups **common across all the queues** selected in that playbook. If your queues don't share groups, you need separate playbooks per queue.

## When to use / skip
Use it when you want your best-matched or most senior people to get first crack at a conversation, but you can't afford to let it sit unassigned if they're all busy. Tiered expertise models are the obvious fit — expert group first, regional group after 30 seconds, general group after 60 — where you'd rather a slightly-less-ideal rep answer than let the customer wait indefinitely.

Skip it if a flat queue with a single assignment method already meets your SLA, or if your escalation logic is really about priority or overflow rather than progressive matching. Bullseye adds real configuration and testing overhead; don't reach for it when priority-based routing or a straightforward overflow playbook would do.

## Configuration decisions
- Decide how many rings you actually need. Three levels (targeted / regional / catch-all) covers most real designs; more than that gets hard to reason about and slow to expand through.
- Design your user groups first — by skill, language, region, whatever your expansion logic keys off. The whole model falls apart if the groups don't map to how you want the pool to widen.
- Set wait times against your answer-time SLA, not arbitrary round numbers. Remember the cumulative measurement: Level 2 at 45s fires 15s after a Level 1 set to 30s, not 45s after it.
- Choose the fallback behaviour deliberately — "any eligible user in the queue" versus "stay within the defined groups." These give very different outcomes when the inner rings can't answer.
- Decide whether to layer dynamic prioritisation or overflow playbooks on the same queue. Bullseye can coexist with them, but you need to think about how they interact.

## Gotchas
- Only user groups that are **common to every queue in the playbook** show up during configuration. Pick queues that don't share groups and you'll find the level configuration frustratingly empty — split them into separate playbooks.
- A queue transfer wipes the wait-time clock and restarts evaluation at Level 0 in the new queue. If you're chaining transfers, the customer effectively re-enters the innermost ring each time.
- Custom assignment strategies don't work with bullseye. If a queue relies on custom assignment today, moving it to bullseye quietly changes tie-breaking to round robin / highest capacity / least active.
- Same-wait-time levels expand simultaneously — handy, but easy to misread as sequential when you're eyeballing a config. Priority order between them is still enforced even though they open together.
- It's a preview built on top of conversation orchestration, so it inherits orchestration's prerequisites. If orchestration isn't enabled and configured, there's no bullseye to configure.

## Consultant notes

- The design work here is really user-group design, not routing config. Clients tend to think in terms of "senior vs junior" or "tier 1 vs tier 2," but bullseye needs those tiers expressed as concrete user groups attached to the right queues. Spend the workshop time on group membership and how it's maintained — if group membership drifts, the inner rings stop matching who you think they match.
- Watch the shared-user-group constraint in multi-queue designs. Clients often want one playbook spanning several queues for tidiness, then discover only the intersection of groups is offered. It's usually cleaner to accept one playbook per queue than to contort the group model to force a common set.
- The cumulative wait-time behaviour catches people in UAT. Testers expect "Level 2 = 45 seconds" to mean 45 seconds after Level 1 opened, and file a bug when it fires at 45 seconds from the start. Walk through a worked timeline example with the client before UAT so it's understood as designed, not defective.
- Because it's preview and custom assignment isn't supported, confirm no queue you're migrating depends on custom assignment before you switch it over — otherwise you'll silently change assignment behaviour at go-live.

---

*Public preview built on conversation orchestration — worth revisiting at GA and after the next release wave for supported-assignment and multi-queue changes.*
