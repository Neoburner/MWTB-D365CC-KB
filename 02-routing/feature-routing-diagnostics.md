# Routing Diagnostics

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../unified-routing-diagnostics](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/unified-routing-diagnostics)

> ⚠️ **Deprecated.** Monitor Microsoft deprecation notices for removal timeline and replacement tooling.

## What it does
Step-by-step trace of how each work item moved through the routing engine — intake, classification, route-to-queue, and agent assignment. The primary tool for diagnosing misrouted items, stuck assignments, and routing logic errors.

## Key facts
- Diagnostics data generated up to **5 minutes after** a work item is processed — not real-time
- Setting change takes up to **15 minutes** to activate after enabling
- Four stages traced per work item: Intake → Classification → Route to queue → Assignment
- Assignment stage shows: preferred agent outcome, assignment method used, capacity/presence/skills checked, total assignment attempts, and status reason
- Assignment criteria details only shown for **OOB assignment methods** — custom assignment shows limited detail
- Assignment failure status reason updates **hourly** during sustained failure; total attempts count may lag
- Diagnostics data stored in Dataverse — accumulates over time; must be periodically purged via Manage routing diagnostics data
- Supervisors can access diagnostics for their visible queues — control read-only permissions if config visibility is a concern

## When to use / skip
Enable from day one in UAT and keep enabled in production until a replacement tool is available. Despite being deprecated, it remains the only tool for routing trace verification.

## Configuration decisions
- Whether to restrict supervisor access to diagnostics — supervisors who can click through from a diagnostics record can reach workstream and rule configurations; review during security design
- Purge schedule — set a periodic purge process in the operational runbook for high-volume environments

## Gotchas
- **Enable in UAT, not just production.** Every routing test in UAT should be verified via the diagnostics trace—confirming the right agent got the work is not enough. The trace shows which rules fired and which were skipped.
- **Storage accumulates silently.** In high-volume environments, diagnostics data can consume significant Dataverse storage. Build a purge schedule into the operational runbook from go-live.
- **The deprecation is real but no replacement exists yet.** Don't build long-term workflows dependent on this tool, but don't disable it until a replacement is confirmed.

## Consultant notes

- Enable from day one in UAT and make verifying the trace part of the UAT test process for every routing scenario. Seeing the right agent got the work isn't enough — the trace tells you which rules actually fired, which were skipped, and why. That's what you need to sign off the routing design with confidence.
- Build the purge schedule into the operational runbook at handover. High-volume environments will accumulate significant Dataverse storage silently. It's the type of ongoing maintenance that gets forgotten until someone notices storage costs have crept up.
- Deprecated but still the only tool. Don't disable it until a confirmed replacement exists. Document its status in the handover so the client doesn't switch it off thinking it's redundant.

---

*Source last updated: 2025-04-29 | Review when: Deprecation timeline confirmed or replacement tooling released*
