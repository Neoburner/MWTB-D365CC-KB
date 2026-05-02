# Assignment Methods for Queues

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../assignment-methods](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/assignment-methods)

## What it does
Controls how work items in a queue are matched to agents. Four options: Highest Capacity, Advanced Round Robin, Least Active (OOB), and Custom. Assignment cycles run continuously; work items not matched in a cycle are retried next cycle.

## Key facts
- **Highest Capacity:** assigns to agent with most available capacity matching skills and presence; tie-breaks by round robin
- **Advanced Round Robin:** rotates in order of queue join date, then last assignment timestamp; good for fairness
- **Least Active:** assigns to agent with longest time since last capacity was released; available for **voice and messaging only** (not records); default for new voice/messaging queues
- **Custom:** fully configurable via prioritisation and assignment rulesets; workstream defaults for presence, capacity, and skills **do not apply**: must define explicitly in the custom rules
- OOB assignment methods take priority over custom-method queues when both have the same queue priority number
- Agent decline limit: default **3 attempts**; configurable 1–5 via OData on `msdyn_omnichannelconfiguration`; after limit, agent is excluded from auto-assignment for that item (can still manually pick)
- After **100 agents decline** a single item, auto-assignment stops: supervisor must assign manually
- Assignment cycles trigger on: new work item, presence change, agent added to queue. Records also have a **5-minute periodic trigger**
- **Dynamic Prioritisation (Preview):** AI-driven priority escalation based on wait time or queue transfer; **cannot be combined** with custom prioritisation rules on the same queue

## When to use / skip
Almost all deployments use one of the OOB methods. Use Custom only when out-of-the-box genuinely can't meet the requirement, the most common legitimate reason is needing the `is_working` calendar operator to respect agent shift schedules.

## Configuration decisions
- Least Active vs Highest Capacity: Least Active is better for blended voice/messaging teams; prevents burnout by not re-flooding agents who just finished a call
- Whether to configure custom assignment: adds maintenance overhead; only justified for operating-hours-aware routing or complex multi-stage skill relaxation

## Gotchas
- **Custom assignment requires explicit presence and capacity rules.** Workstream defaults don't carry over. Miss this and work gets assigned regardless of agent availability.
- **The decline limit matters operationally.** If agents miss notifications at go-live (common), items can get stuck after 3 decline cycles. Configure deliberately and test the decline flow in UAT.
- **Dynamic Prioritisation is Preview.** Don't use in production for regulated environments yet.

## Consultant notes

- Simulate the decline flow in UAT before go-live. Go-live week is when agents are learning the workspace and notification sounds: 3 misses is easy to hit accidentally. Know exactly what happens to a work item after 3 declines before the first real customer call.
- Custom assignment is a maintenance burden that almost never gets accounted for in post-go-live support scoping. If a client is asking for it, challenge them hard: if a simple classification tweak combined with an OOB method covers the requirement, take that path. Custom rulesets become orphaned config quickly.
- Dynamic Prioritisation is worth watching for GA but don't put it in any production scope while it's Preview, particularly in regulated environments.

---

*Source last updated: 2026-04-27 | Review when: Dynamic Prioritisation reaches GA or new assignment methods released*
