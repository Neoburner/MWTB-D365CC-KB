# Percent-Based Routing

**Category:** Routing
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-percent-based-routing

## What it does
Percent-based routing distributes incoming conversations across queues according to a configured percentage split rather than skill-based or capacity-based rules. A workstream can be configured to send X% of conversations to Queue A and the remaining percentage to Queue B (or spread across multiple queues). The split applies at conversation ingestion — the routing engine calculates which queue to assign to based on the configured percentages, applying the split in aggregate across incoming volume.

## Key facts
- Configured at the workstream level as a routing rule type alongside skill-based and capacity-based rules
- Percentage is applied across conversation volume — it's a probabilistic split, not a strict alternating pattern (so 50/50 may not be exactly equal for small volumes but converges at scale)
- Supports up to the number of queues configured in the workstream; percentage values must sum to 100%
- Does not override skill or capacity constraints — conversations assigned to a queue via percent routing still require agents with available capacity in that queue
- Can be combined with work classification rules — classification rules run first to categorise the conversation, then percent routing applies to determine queue assignment within a category
- Useful for A/B testing queue configurations, gradually ramping new teams, or load-balancing between geographically distributed queues
- Route-to-queue rules (priority-based routing) take precedence over percent routing — if a route-to-queue rule matches, it supersedes the percentage split

## When to use / skip
Use for load distribution between equivalent queues (e.g., two teams handling the same channel where workload should be split 60/40), A/B testing queue performance, or gradual ramp of a new team (10% initially, increasing over time). Also useful for multi-site deployments where volume needs distributing between locations.

Skip if the routing requirement is about matching the right agent to the right conversation — percent routing is volume distribution, not skills-based matching. Don't use it as a substitute for skill-based routing when agent capability differences are the real concern.

## Configuration decisions
- Define the queue split percentage based on team capacity — if Team A has 30 agents and Team B has 10, a 75/25 split reflects capacity; a 50/50 split will overload Team B
- Plan for what happens when a queue at the receiving end has no available agents — the conversation will wait in queue or overflow; configure overflow rules for both queues to handle unexpected agent shortfalls
- If using percent routing for A/B testing, decide how you'll measure the comparison — the split alone doesn't give you A/B results without reporting configured to segment by queue
- Review the interaction with priority routing rules — if any route-to-queue rules exist in the same workstream, they'll fire before the percentage split for matching conversations

## Gotchas
- Small volume distributions won't match configured percentages closely. At 10 conversations, a 70/30 split might distribute 8/2 or 7/3. At 1000 conversations, it'll be much closer to 700/300. Don't use percent routing where exact distribution for small volumes matters.
- Percent routing does not guarantee equal wait times. If Queue A has more available agents than Queue B, even a 50/50 volume split will produce different wait times. Capacity, not percentage, determines wait time.
- The percentage is not dynamically adjusted based on queue depth or agent availability. If Queue B's team is all on break, conversations keep routing to Queue B and queueing — the system doesn't shift the percentage to compensate. Overflow rules are the mechanism for handling this.
- Changing the percentage split mid-day applies immediately to new conversations — it doesn't retroactively rebalance existing queued conversations.

## Consultant notes

- Percent routing is the right tool for team ramp and A/B scenarios, but clients sometimes reach for it when they actually need skill-based routing. The distinguishing question is: "does it matter which specific agent handles this, or just which team?" If agent capability differences matter, skills routing is right. If teams are equivalent and it's just about volume distribution, percent routing is right.
- A/B testing via percent routing only works if the reporting is set up to distinguish queue performance. Make sure the client has queue-level analytics configured before committing to a percentage split for testing purposes — otherwise the test runs without any way to read the results.
- The interaction with route-to-queue rules is worth documenting in the routing design. If there are any "if condition X, route to queue Y" rules in the workstream, those conversations bypass the percentage split entirely. The percentage split only covers conversations that don't match a route-to-queue rule. Clients who don't know this are confused when they see the actual distribution doesn't match their configured split.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds dynamic percentage adjustment based on queue depth*
