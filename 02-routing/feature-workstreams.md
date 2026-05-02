# Workstreams: Setup & Configuration

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../create-workstreams](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/create-workstreams)

## What it does
The routing container that owns everything for a channel type: routing rules, classification rulesets, work distribution settings, capacity rules, and bot/agent attachment. Every channel instance (a specific chat widget, phone number, SMS number, social account) must belong to a workstream.

## Key facts
- Three workstream types: Messaging (chat/SMS/social/Teams), Record (cases/email/activities), Voice
- Work distribution mode: **Push** (auto-routed to agent) or **Pick** (agent selects from open items); **voice is Push only**
- **Work distribution mode cannot be changed after creation**: must recreate the workstream to switch
- Multiple channel instances of the same type can share one workstream (e.g. two chat widgets on different websites)
- Capacity type: unit-based (legacy) or profile-based (current)
- **Wrap-up capacity blocking** options: Always block (default), Don't block, Custom time (30 sec–60 min auto-release)
- **Representative affinity** (same agent for returning conversations): enabled by default for persistent chat, SMS, social, Teams channels; can be overridden by notification template settings
- Bots/agents can be attached to messaging and voice workstreams; not record routing workstreams
- Deleting a workstream requires: removing intake rules (record routing), closing all associated queue items and live work items

## When to use / skip
Required for every routing deployment. Every channel type and instance needs a workstream. The key design decision is how many to create, one per channel type vs one per line of business.

## Configuration decisions
- Push vs Pick: Push for contact centre (work routed to agent); Pick for back-office (agent selects own work). This decision is permanent at creation.
- Wrap-up capacity blocking: "Always block" is safest; "Custom time" is a good middle ground for predictable after-call work durations; "Don't block" maximises throughput at the cost of potential overload during wrap-up
- Workstream granularity: separate workstreams per line of business allow different routing rules and capacity settings; one workstream per channel type is simpler but forces shared routing logic

## Gotchas
- **Push vs Pick cannot be changed post-creation.** Confirm with the client before you build. Recreating post go-live means reconfiguring all rules, reassigning channels, and retesting.
- **Bot handoff context variables must be configured before attaching a Copilot Studio agent.** Without them, agents start conversations cold: the bot's data doesn't carry over.
- **Asynchronous plug-ins must be enabled** (`DisabledForAsyncProcessing = No`) in some orgs: disabled async plug-ins silently break workstream creation. Check before you start setup.

## Consultant notes

- Push vs Pick needs a proper conversation in requirements, not a quick checkbox. Clients from non-contact-centre backgrounds often don't understand the difference until you walk through a scenario with them. "A chat pops up automatically on your screen" vs "you see a list and choose your next item" lands better than reading the definitions.
- Wrap-up capacity blocking catches people because "Always block" sounds restrictive but is almost always the right default. If a client asks for "Don't block" because they want throughput, explain the overload scenario first: agents getting new work mid-wrap-up is a problem, not a feature.
- Check the async plug-ins setting at the start of any new org setup rather than when you hit a workstream creation error. It's quick to verify and the failure it produces is confusing enough that you don't want to diagnose it mid-sprint.

---

*Source last updated: 2026-02-16 | Review when: Workstream type changes or work distribution mode becomes editable post-creation*
