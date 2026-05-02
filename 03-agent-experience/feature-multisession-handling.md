# Multi-Session Handling

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/multisession-agent-overview

## What it does
Multi-session handling is the ability for a single agent to manage multiple concurrent conversations within one CSW browser tab. Each active conversation is a session — visible in the left-hand session panel — and agents switch between them by clicking. The number of simultaneous sessions an agent can hold is governed by their capacity profile. Voice typically allows one concurrent session; digital channels (chat, messaging) commonly allow two to five.

## Key facts
- Sessions appear in the left-hand vertical panel in CSW — each session shows the channel icon, customer name (or anonymous), and a conversation state indicator
- Maximum 10 sessions per agent at any one time (platform limit); capacity profiles enforce the practical business limit below this ceiling
- Each channel type has a capacity unit cost configured at the workstream level — e.g., voice = 100 units, chat = 50 units — and capacity profiles define each agent's total capacity pool
- Switching sessions is instant — no loading delay; the previous session's state (form, notes, scroll position) is preserved
- Notification toasts for new incoming conversations appear regardless of which session is currently in focus
- The home session (agent dashboard) is always present in the session panel and cannot be closed; it does not consume capacity
- Conversation accept prompts appear as toast notifications with a timer — if the agent doesn't accept within the configured timeout window, the conversation routes elsewhere (push mode only)
- Session close (X on session) during an active conversation does not end the conversation — it hides the session from view; the conversation remains live

## When to use / skip
Multi-session is always active in CSW — it's not an optional mode. The design question is how many concurrent sessions to allow per agent per channel. Voice contact centres typically keep this at 1 (you can't take two calls simultaneously); chat and messaging centres typically allow 2–4 depending on complexity of the channel and agent skill level.

Don't set digital capacity too high for new deployments. Start conservative (2 concurrent chats per agent), baseline the handle time and quality, then increase if agents are consistently idle.

## Configuration decisions
- Set capacity unit totals on each agent's capacity profile based on channel mix — a pure voice agent should have a capacity ceiling that only allows one voice session; a chat-only agent gets enough for 2–3 concurrent chats
- Configure workstream channel capacity costs thoughtfully — a high-complexity channel (e.g., regulated insurance queries) should have a higher unit cost than a low-complexity channel to reflect realistic agent load
- Set the auto-accept or push timeout window for incoming conversations — if agents are in another session when a new conversation arrives, how long do they have to accept before it re-routes?
- Decide on session overflow behaviour: does a conversation re-queue if the agent doesn't accept, or does it route to another agent? This is configured at workstream level
- If agents handle mixed channels (voice + chat), model capacity carefully — a voice session consuming 100 units from a 150-unit pool leaves only 50 units for a low-complexity chat; confirm this matches the intended agent workload

## Gotchas
- Capacity profile changes apply to new conversations, not ones already in progress. If you update an agent's capacity mid-shift, their existing sessions are unaffected. The new limit kicks in on the next conversation accepted.
- Agents can see all their sessions but only interact with the one in focus. A customer waiting for a chat reply while the agent is in another session doesn't know they're being managed concurrently — response time expectations in SLA must account for multi-session switching time.
- Session close vs conversation end is the most common agent error. Closing the session X does not close the conversation. Agents who close the session panel tab thinking they've ended a chat leave the customer hanging. Train this explicitly.
- If capacity is configured inconsistently across workstreams (e.g., same channel with different capacity costs in different workstreams), agents handling conversations from both workstreams can end up with unexpected concurrent session counts.
- Presence and capacity are related but separate. An agent showing as "Available" has available capacity. An agent at capacity (all slots filled) will appear "Available" in terms of presence but won't receive new push-routed conversations. This distinction confuses supervisors watching real-time dashboards.
- The 10-session platform ceiling includes all sessions — conversations, the home session, and any form-based sessions opened by application tab templates. A complex session template that opens multiple tabs counts against session resources.

## Consultant notes

- The capacity model design is one of the decisions that's hardest to reverse post go-live. If you set capacity unit costs wrong at the workstream level, changing them later requires rebuilding workstream configuration and retraining agents. Do this properly in design: define unit cost per channel based on actual complexity and expected handle time, agree it with the ops team, document it. Don't copy a competitor's setup and assume it maps to this client's channel mix.
- New-to-CSW agents almost always try to handle multi-session by opening multiple browser tabs. The first week of live operation usually surfaces this — supervisors see agents with low concurrent handle rates even when the system shows capacity available. Shadow sessions and post-go-live observation for the first few days catches this quickly. Add "one browser tab" to the agent setup checklist.
- For chat deployments where agents are expected to run 3+ concurrent sessions, include multi-session scenarios in UAT. Have testers run three simultaneous chat conversations and observe how long it takes agents to switch and respond. If response times in multi-session UAT are already hitting SLA thresholds, adjust the concurrent session limit before go-live rather than after.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft raises the 10-session ceiling or changes how capacity profile limits interact with workstream channel costs*
