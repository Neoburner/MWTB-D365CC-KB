# Agent Inbox Enhancements

**Category:** Agent Experience
**Applies To:** Both
**Source:** [learn.microsoft.com — Boost service representative productivity with inbox enhancements](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/boost-service-representative-productivity-inbox-enhancements)

## What it does
Lets admins configure what shows on conversation cards in the agent inbox, and how conversations open when clicked. Agents get filter and sort controls based on user groups alongside the existing queue filters.

## Key facts
- **Card layout customisation** applies to the conversation entity only — admins can add, remove, or reorder fields displayed on each card
- **Open behaviour** can be set to: open as a new session, or open within the inbox panel itself (messaging channels only — voice is excluded)
- **User group filtering** added to the inbox alongside queue filtering; agents can switch between them
- GA: October 31, 2025 (2025 Wave 2)
- Configured in the Copilot Service Admin Center under the inbox settings

## When to use / skip
Worth configuring on any deployment where agents handle messaging conversations. The default card layout is generic — adding contextually relevant fields (queue, case reference, customer name) is a quick win that most clients notice in UAT. Skip only if the contact centre uses voice-only workstreams, where inbox customisation has no effect.

## Configuration decisions
- Which fields to show on the conversation card: no hard limit documented, but keep it to 4–5 fields max or it gets cluttered
- Open behaviour: "new session" preserves full context panel; "open within inbox" is quicker for agents doing triage but loses the side-by-side session layout — agree with the client before go-live
- User group configuration: requires user groups to be set up in advance; if the client hasn't done this yet, queue-only filtering is the default

## Gotchas
- The open behaviour applies per channel type on the workstream — it's not a global setting. If you have multiple messaging workstreams, you'll need to configure each one.
- Card field changes are live immediately. If you're testing layout changes in a shared UAT environment, agents will see them mid-session.
- User group filtering is only useful once groups are actually populated. Clients who haven't got group assignments sorted before go-live will see empty filter options and assume it's broken.

## Consultant notes

- Inbox card layout is one of those small things that generates outsized feedback from agents in UAT. Get the client's operations team to define which fields matter to them before you configure anything — it's a 30-minute conversation that saves multiple rounds of change requests.
- The "open within inbox" behaviour looks appealing in demos but watch for the UX implication: agents who need to cross-reference customer history lose the side panel when working in this mode. Preview agents are often fine with it, but experienced multi-taskers usually prefer new session. Run both past the client's senior agents before committing.
- If the deployment has user groups configured, make sure they're synced before UAT. Empty user group dropdowns in the inbox filter are a common source of "it's not working" tickets that waste UAT time.

---

*Worth revisiting if the inbox card entity support expands beyond conversation, or when voice open behaviour becomes configurable*
