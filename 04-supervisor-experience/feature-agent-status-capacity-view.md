# Agent Status & Capacity View

**Category:** Supervisor Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/agent-status

## What it does
The Agent Status & Capacity view gives supervisors a real-time list of all agents currently logged into D365 Contact Center — their current presence state, how much of their capacity is consumed, which conversations they're handling, and how long they've been in their current state. It's the agent-level companion to queue-level monitoring, letting supervisors manage individual agent availability rather than just aggregate queue health.

## Key facts
- Accessible from the Real-Time Analytics section in CSW or from the Omnichannel supervisor dashboard
- Shows per-agent: name, current presence (Available, Busy, Away, Do Not Disturb, custom presence), capacity consumed vs total, active conversation count, and time in current state
- Supervisors can change an agent's presence directly from this view — useful for pulling an agent out of a queue or forcing a break
- Capacity consumed shows as a fraction (e.g., 75/100 units) based on the agent's capacity profile and active conversations
- Agents who are offline or not logged into CSW do not appear in the view
- The view updates in near-real-time (with a short polling lag — not instant)
- Filter options: by queue membership, by channel, by presence state, by team (if teams are configured)
- Supervisors can initiate internal chat to an agent directly from this view

## When to use / skip
Use as the primary tool for floor management — monitoring which agents are available, who is at capacity, who has been in the same state too long (e.g., an agent stuck in wrap-up for 20 minutes). This view is most valuable in high-volume contact centres where supervisors are actively managing agent availability throughout the shift.

Less valuable for small teams with light volume where supervisors can manage through observation. For those environments, the queue-level dashboards are sufficient.

## Configuration decisions
- Supervisors need the correct omnichannel security role (Omnichannel Supervisor) to access agent status views — verify role assignment in go-live readiness checks
- Configure queue filtering so supervisors only see agents in their own team's queues if the contact centre has team-based supervision — showing all agents in a large contact centre to every supervisor creates noise
- If using custom presence states, ensure those states appear correctly in the view and that supervisors understand what each custom state means — non-standard presence labels require documentation for supervisors

## Gotchas
- Presence state shown is the agent's self-set or system-set presence, not necessarily their actual activity. An agent on a call appears as "Busy" but an agent who has manually set themselves to "Away" to avoid contacts also appears as "Away" — the supervisor view doesn't distinguish voluntary absence from natural busy state.
- Supervisors can change an agent's presence from this view, but agents can change it back immediately. Presence changes from the supervisor view are not enforced locks — they require agent cooperation or a separate escalation conversation.
- The polling lag means the view can be 15–30 seconds behind actual state. For a fast-moving contact centre, this is acceptable; for supervisors expecting instant feedback on presence changes, it can be frustrating.
- Agents who are logged in but have closed the CSW browser tab (without ending their session) may continue to appear as Available until the session timeout kicks in. This is an agent behaviour issue — train agents to use the correct logout/go offline process, not just close the browser.
- Capacity percentages require understanding the capacity profile design to interpret correctly. A supervisor who doesn't know that "voice = 100 units" and "chat = 50 units" won't understand why an agent at 75/100 can't take another voice call but could theoretically take a chat.

## Consultant notes

- The supervisor training session for this view should include explicit instruction on the difference between presence state and capacity. "Available" with 50/100 capacity consumed means the agent can take more work. "Available" with 100/100 consumed means they're technically at capacity and won't receive push-routed conversations even though they show as available. That distinction is not obvious from the UI alone and supervisors who don't understand it will be confused when available-looking agents don't receive new contacts.
- Supervisor presence override capability should be covered in the operational runbook — specifically, when and why a supervisor would change an agent's presence state. Without a defined protocol, either supervisors use it arbitrarily and create conflict with agents, or they never use it when they should (e.g., agent is stuck in a bad presence state due to a client disconnection issue).
- Queue filter configuration for supervisors is worth getting right before go-live. In a large contact centre, a supervisor whose view shows 200 agents across all queues cannot monitor their own team of 15 effectively. Set up the default queue filter to scope each supervisor's view to their relevant queues as part of the experience profile or supervisor role configuration.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds enforcement capabilities to supervisor presence override or changes the polling interval*
