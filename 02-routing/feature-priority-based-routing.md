# Priority-Based Routing

**Category:** Routing
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-priority-routing

## What it does
Priority-based routing assigns a numerical priority score to incoming conversations so that higher-priority conversations are offered to agents before lower-priority ones waiting in the same queue. When multiple conversations are queuing simultaneously, the routing engine serves them in priority order rather than strictly by arrival time. Priority can be set statically (all VIP customers get priority 1) or dynamically via work classification rules (priority assigned based on conversation attributes at ingestion time).

## Key facts
- Priority is a numeric value: lower number = higher priority (Priority 1 is served before Priority 2, etc.)
- Priority is set at the workstream level as part of the work classification rules, or can be a default priority for all conversations in a workstream
- When multiple conversations are queuing for the same agent, the highest-priority conversation is offered first: priority does not create a separate fast-track queue, it re-sorts what's already there
- Priority can be set based on any work classification rule condition: customer segment (VIP, standard, trial), channel type, product area, escalation flag, etc.
- Priority values interact with agent assignment methods (highest capacity, round robin, custom): priority determines the order conversations are offered, the assignment method determines which agent gets the conversation
- A conversation's priority can be updated mid-queue if a work classification rule re-evaluates it (e.g., if wait time exceeds a threshold, escalate priority)
- Priority does not bypass capacity constraints: a priority 1 conversation still waits if no agents have available capacity in the queue

## When to use / skip
Use when the contact centre has distinct customer tiers or SLA commitments that require faster service for specific customer types. Enterprise support contact centres with premium vs standard customer tiers are the most common use case. Also useful for internal escalations (supervisor-flagged conversations) or channel prioritisation (voice over chat when both are in queue).

Skip for homogeneous contact centres where all customers have the same service level. Adding priority configuration creates maintenance overhead (keeping classification rules current) without benefit when all conversations are equivalent.

## Configuration decisions
- Define priority tiers based on the client's SLA structure: how many priority levels are needed? More than 3–4 becomes difficult to manage and the marginal routing benefit diminishes
- Build priority assignment into work classification rules rather than hardcoding static priorities: classification rules allow dynamic priority based on conversation content, customer record data, or channel
- Define the default priority for conversations that don't match any classification rule: unclassified conversations should have a defined priority, not an undefined state
- Align priority tiers with SLA response time commitments so that the routing behaviour reflects contractual obligations, not arbitrary rankings
- Consider whether to allow agents to manually re-prioritise conversations mid-queue: supervisor conversation controls support priority adjustment for urgent situations

## Gotchas
- Priority re-sorts the queue but doesn't guarantee response time. A priority 1 conversation will wait if all agents are busy with priority 1 conversations that arrived earlier. Priority controls ordering, not absolute response speed.
- Priority values need to be maintained as customer data changes. If a customer's tier changes in the CRM but the D365 work classification rules still reference stale contact fields, their priority won't update. The accuracy of priority-based routing depends on the accuracy of the data it's classifying against.
- Too many priority levels creates noise: agents don't perceive a meaningful difference between priority 3 and priority 4. Most contact centres work well with 2–3 levels: high, standard, low.
- Priority interaction with preferred agent routing: if a conversation has a preferred agent set and that agent has capacity, it goes to the preferred agent regardless of queue priority. Priority affects queue ordering within the general pool, not preferred agent assignment.
- If all conversations are classified as priority 1, priority routing has no effect. This happens when classification rules are too broad: validate that the classification logic produces genuine variation in priority values.

## Consultant notes

- Priority-based routing sounds straightforward but the design conversation is usually complicated by the client's existing SLA tiers, customer segmentation data, and the accuracy of that data in Dataverse. Before building the routing rules, audit the data quality for whatever field priority is based on (customer tier, product, account status). If the source data is unreliable, priority routing will produce unreliable results.
- The "too many priority levels" trap is real. Clients with complex customer tiering sometimes want 8–10 priority levels because their CRM has 8–10 customer segments. Explain that routing priority is about queue ordering, not customer segmentation: and that agents cannot meaningfully differentiate between levels 6 and 7 when they're accepting conversations. Map the client's segments to 2–3 routing priority levels.
- SLA reporting and routing priority should be aligned but they don't have to use the same classification. Priority routing controls which conversation an agent picks up next. SLA tracking controls how long that same conversation was allowed to wait. They're related but separately configured: make sure both are designed, not just one.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds dynamic wait-time-based priority escalation as a native feature*
