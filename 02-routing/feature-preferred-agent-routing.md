# Preferred Agent Routing

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-preferred-agent](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-preferred-agent)

## What it does
Routes work items from a specific contact to a named rep (or up to 3 in priority order) before standard assignment logic runs. If no preferred rep is available, falls back to either standard assignment or leaves the item unassigned.

## Key facts
- **Push-mode workstreams only** — pick mode not supported
- Max **3 preferred reps per contact** — configured manually via the Preferred Representatives matrix; no bulk tool
- Only **presence is checked** for preferred reps — capacity, skills, and assignment rules are bypassed entirely
- Preferred rep must be a **member of the queue** the work item routes to
- Fallback options: next best rep by assignment logic, or leave unassigned in queue
- Customer identification depends on channel — see identification method per channel in Microsoft docs; unauthenticated chat uses pre-survey "Name" field
- Custom security roles need explicit access to `msdyn_preferredagent` and `msdyn_preferredagentcustomeridentity` tables
- Diagnostics trace shows whether preferred routing was attempted and why it fell through

## When to use / skip
Use for relationship-manager or account rep models where continuity matters — customer always speaks to their assigned contact. Skip for high-volume transactional contact centres where rep continuity doesn't improve outcomes; the matrix maintenance overhead isn't worth it.

## Configuration decisions
- Fallback behaviour — "Next best rep" keeps SLA intact; "Unassigned" preserves relationship continuity at the cost of response time. Voice and live chat: use next best. Async channels: unassigned is usually acceptable.

## Gotchas
- **Skills are bypassed for preferred reps.** A preferred rep with the wrong skills still gets the work. For clients using preferred routing alongside strict skill compliance, this needs explicit acceptance.
- **The matrix is manually maintained.** No automated sync with CRM account ownership. Build a process for keeping preferred rep mappings current as staff turn over—stale mappings silently route to ex-employees or wrong reps.

## Consultant notes

- The matrix maintenance process is the part that always gets forgotten at handover. Preferred rep mappings go stale fast — staff turn over, accounts change hands, reps move teams. Build a data management process (who maintains it, how often it's reviewed) into the operational handover as a named task with a named owner.
- Skills being bypassed for preferred reps needs to be an explicit acceptance sign-off if the client uses skill compliance routing. A preferred rep with the wrong language skill or technical certification still gets the work. If that's a compliance issue for the client, this feature isn't suitable for those scenarios without a workaround.
- This is most valuable for relationship-manager or account-based selling models. For volume contact centres, the maintenance overhead rarely justifies the continuity benefit — push back early if the use case doesn't clearly fit.

---

*Source last updated: 2026-02-19 | Review when: Pick-mode support added or bulk configuration tooling introduced*
