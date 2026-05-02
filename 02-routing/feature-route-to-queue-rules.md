# Route-to-Queue Rules

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-route-to-queue-rules](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-route-to-queue-rules)

## What it does
The final classification stage in unified routing. Evaluates enriched work item attributes and sends each item to a specific queue. A workstream has exactly one route-to-queue ruleset. If no rule matches, the item goes to the fallback queue.

## Key facts
- **One route-to-queue ruleset per workstream**: cannot have multiple (unlike classification rulesets)
- Default hit policy: **Hit-all**: all rules are evaluated; if multiple match, the first matching queue is used unless that queue is overflowing (then tries next); unlike classification which stops at first match per ruleset
- **Hit-first** option: stops at first match regardless of overflow; simpler but removes overflow intelligence
- **Percentage-based routing:** split volume across up to **5 queues** per rule, percentages must sum to 100; slight runtime variance at low volumes
- Conditions can reference any work item attribute including those set by classification rulesets
- Avoid more than **15 link-entity elements** in a single rule condition: causes timeout errors
- **Rule-specific overflow overrides** can be defined per rule, independently of queue-level defaults

## When to use / skip
Required for any routing deployment. Every work item must be routed to a queue, route-to-queue rules are how that decision is made.

## Configuration decisions
- Hit-all vs Hit-first: Hit-all gives overflow-aware routing automatically; Hit-first is simpler and more predictable but overflow doesn't redirect to another queue
- Rule order: with Hit-all, put specific rules before broad/catch-all rules; the first matching queue is used
- Percentage-based routing: use for multi-vendor or load-balancing scenarios; removes need for external load balancers
- Rule-specific overflow overrides: configure for any customer segment that needs different overflow behaviour than the queue default (e.g. VIP customers never get an "End call" action)

## Gotchas
- **Hit-all vs classification first-match is a frequently misunderstood distinction.** Classification stops at first match per ruleset; route-to-queue evaluates all rules. Admins maintaining rules post-go-live often get confused by this.
- **A well-designed route-to-queue ruleset is short.** If you have 20+ rules, classification rulesets aren't doing enough work. Complex routing logic belongs in classification, not here. Route-to-queue should be simple: "if X equals Y, go to queue Z."
- **Test every rule permutation.** Misrouted items in production are hard to diagnose retroactively if diagnostics weren't enabled from day one.

## Consultant notes

- A well-designed route-to-queue ruleset is short. If you're approaching 10+ rules, classification upstream isn't doing enough work. Complex routing logic belongs in classification rulesets: route-to-queue should be simple: "if topic equals X, go to queue Y."
- Hit-all vs Hit-first needs to be explicitly decided and documented in the design. Hit-all is the right default for most deployments, but admins maintaining rules post-go-live often don't understand the distinction. Document it clearly in the handover.
- Test every rule permutation in UAT and verify via routing diagnostics, not just by checking where the work landed. The trace tells you which rules actually fired: confirming the right agent got the work isn't the same as confirming the right rule matched.

---

*Source last updated: 2025-04-21 | Review when: New hit policy options or percentage routing queue limit changes*
