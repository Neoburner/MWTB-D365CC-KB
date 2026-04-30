# Wrap-Up / After Contact Work (ACW)

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-after-conversation-work

## What it does
Wrap-up (ACW) is the period after an agent ends a conversation where they complete notes, select disposition codes, or handle post-interaction work before becoming available for the next contact. Can be configured as auto-ending (agent becomes available after timer expires), supervisor-forced (supervisor must close the wrap-up session), or unrestricted (no timer). During wrap-up, the agent's presence state and capacity consumption are configurable independently.

## Key facts
- Wrap-up timer can be disabled entirely, set to auto-end after N minutes, or require supervisor intervention to close
- Agent presence during wrap-up (e.g., "Wrap-Up," "Away," or still "Busy") is a separate setting from capacity; an agent can consume capacity while in wrap-up or be unavailable for routing
- Disposition codes are user-configurable and often required for compliance, quality assurance, or reporting workflows
- The conversation itself closes independently of wrap-up closure — an agent can still do wrap-up work after the customer has disconnected
- Wrap-up is tracked in agent availability reports and affects queue wait time perception (agents in wrap-up are not available for inbound)
- Capacity is not automatically released when wrap-up starts; you must configure capacity behavior separately

## When to use / skip
Use ACW when you have post-call processes: quality assurance notes, capture customer feedback, issue categorization, or internal routing to fulfillment teams. Wrap-up is essential in compliance-heavy environments (financial services, healthcare) and contact centers with high first-contact resolution expectations. Skip or disable wrap-up only in high-volume, low-touch channels (e.g., high-speed chat where issues are fully resolved in conversation) where post-work adds no value. Even then, consider keeping it for at least disposition reporting to enable analytics.

## Configuration decisions
- **Wrap-up timer mode:** Choose between disabled, auto-end (with duration), or supervisor-controlled based on process maturity and agent discipline
- **Capacity release timing:** Decide if agents release capacity immediately upon conversation end, or only after wrap-up closes
- **Required fields:** Define which fields (notes, disposition, tags) are mandatory vs. optional to balance compliance needs with agent friction
- **Default disposition code:** Pre-select a "no disposition" or "resolved" code to reduce clicks for simple cases
- **Presence state during wrap-up:** Align with business rules—some centers keep agents "Busy" to prevent new assignments, others shift to "Away" for visibility
- **Timer enforcement:** If auto-end is enabled, set duration based on average post-call work time (typically 2–5 minutes) to avoid timeout frustration

## Gotchas
- Wrap-up presence state is not the same as availability for routing. Agents can appear "Available" while their capacity is consumed in wrap-up.
- If wrap-up timer is too short, agents rush or skip notes. If too long, queue wait times appear inflated (agents in wrap-up won't accept new work).
- Disposition codes are not required by default. If compliance or reporting depends on them, enforce via form validation, not training alone.
- Supervisor-controlled wrap-up can become a bottleneck if supervisors are also taking contacts. Ensure a supervisor queue and monitoring.
- Metrics can be skewed. "Average Handle Time" may exclude wrap-up by default, making agents seem faster than they are.
- Conversation close and wrap-up close are separate events. Failing to track the difference obscures process inefficiencies.

---

*Source last updated: 2026-04-30 | Review when: Configuration changes, after agent feedback on timer duration, or during AHT baseline reviews*
