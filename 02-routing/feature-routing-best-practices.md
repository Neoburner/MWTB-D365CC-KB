# Routing Design Best Practices & Optimisation

**Category:** Routing
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/unified-routing-best-practices

## What it does
This is a reference for routing design principles rather than a single configurable feature. D365 Unified Routing has enough moving parts (workstreams, queues, classification rules, assignment methods, capacity profiles, skill matching) that poor design choices compound, what looks sensible in isolation creates performance or management problems at scale. This doc covers the key design decisions and the mistakes that appear most often in real deployments.

## Key facts (routing architecture principles)
- Workstreams should be designed around channel type and handling behaviour, not around team structure: team assignments happen at the queue level
- One workstream per channel type is the baseline; split workstreams when handling behaviour genuinely differs (e.g., VIP voice has a different IVR flow than standard voice)
- Queues are the assignment unit: agents should be in queues that reflect their actual skills and coverage, not organisational hierarchy
- Work classification rules run at conversation ingestion: they should be as lean as possible; every additional rule condition adds processing time
- Skill-based routing accuracy depends on skill assignment accuracy: stale or incorrect skill records produce incorrect routing
- The "Highest Capacity" assignment method is the default and works well for most deployments; switch to custom assignment rules only when there's a specific business requirement that Highest Capacity can't meet
- Capacity profiles should be designed with a single decision in mind: push vs pick mode is permanent per workstream; decide before build

## Routing design principles

**Workstream scope:** Keep workstreams focused. A workstream that tries to handle inbound voice, outbound voice, and chat with a single set of rules becomes unmaintainable. Separate concerns: create separate workstreams for meaningfully different handling patterns.

**Queue design:** Create queues around agent capability groups, not org chart lines. A queue named "London Team" means nothing for routing: "Technical Support: Tier 2" or "Billing: Spanish" maps to actual capability and routing logic.

**Skill taxonomy:** Define skills before building routing rules. Skills that are added ad hoc without a taxonomy end up duplicated, inconsistently applied, and unmaintainable. A 30-minute skill taxonomy session at the start of the project saves significant rework later.

**Work classification rule efficiency:** Classification rules run sequentially. Put the most common cases first and the edge cases last. A rule that matches 80% of conversations should be at the top, not rule 12 of 15.

**Assignment method choice:** Highest Capacity routes to the agent with the most available capacity: good for volume management. Round Robin distributes evenly regardless of individual agent load: good for equity. Custom rules are for scenarios where neither standard method applies. Don't over-engineer: most deployments work well with Highest Capacity.

**Testing routing logic:** Use the Routing Diagnostics tool to trace specific conversation routing decisions (see `feature-routing-diagnostics.md`). Test routing with realistic data, not idealised test cases: include edge cases like unmatched skills, empty queues, and at-capacity scenarios.

## Configuration decisions
- Document the routing design in a routing matrix before building: workstream, channel type, classification rule conditions, target queue, assignment method, and capacity weight for each conversation type
- Define skill taxonomy with the ops team, not just from org charts; skills should reflect what agents actually do, not their job title
- Set capacity weights that reflect realistic conversation handling load: voice at 1 concurrent session, chat at 0.5 (allowing 2 concurrent) is a common starting point but should be validated against the client's actual multi-task expectation
- Review classification rules for performance impact: more than 15–20 conditions per workstream classification set is a signal the design is too complex
- Plan for routing rule maintenance: who updates routing rules when new products, queues, or teams are added? Without an owner, routing becomes stale over time

## Gotchas
- Routing rules are not version-controlled in D365: if you change a routing rule, the previous version is gone. For critical routing logic, document the rules externally (in a routing design doc) before making changes.
- Empty queues cause conversations to wait indefinitely. If all agents in a queue go offline, conversations queue but never route unless overflow rules are configured. Always configure overflow for queues that could genuinely empty out of hours or during absence spikes.
- Skills assigned to agents but not to workstream classification rules are invisible to routing. A skill exists only when it's both assigned to agents and referenced in routing. Audit both sides.
- Work classification runs at conversation creation. If the data used for classification (customer record fields) is stale at the time of classification, routing is based on stale data. This is most common for outbound conversations where customer data is pre-loaded.
- Routing diagnostics is the first troubleshooting tool, not the last resort. Use it proactively during UAT to verify that test conversations route as expected before go-live.

## Consultant notes

- The routing matrix document is the single most valuable deliverable from the routing design phase. Not because D365 needs it: the system doesn't care: but because it forces the client to commit to decisions (which queue handles which conversation type, what skills are required) before build begins. Conversations about routing design that happen in the configuration tool, not in a document, tend to be slower and produce more backtracking. Get the matrix agreed on paper first.
- Capacity weight design is routinely underspecified. Clients list their channel types and agents without thinking about what concurrent handling looks like. Run through specific scenarios in the design session: "If an agent is in a voice call, can they take a chat simultaneously? If yes, what's the max?" The answers define the capacity weights. This conversation takes 30 minutes in design and saves days of capacity model rework after go-live.
- Routing maintenance ownership should be decided before handover, not after. The question is: "who updates the routing rules when the business changes?": new product lines, new queues, agent team restructures. In many projects this gets left to "IT will handle it" and then IT doesn't know what the rules mean. The routing matrix doc and a basic admin training session for whoever owns routing changes is the minimum viable knowledge transfer.

---

*Source last updated: 2026-04-30 | Revisit when Microsoft publishes updated routing best practices or adds new routing rule types*
