# Copilot Service Workspace: Agent Interface Overview

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/csw-overview

## What it does
Copilot Service Workspace (CSW) is the model-driven Power App that agents use to handle contacts. It replaces the legacy Customer Service Hub for contact centre deployments and is the only interface that supports multi-session conversation handling, the Copilot panel, and the full omnichannel experience. Think of it as the shell, everything else (customer summary, communication panel, Copilot) renders inside it.

## Key facts
- CSW is a model-driven app built on Unified Interface: it's the app agents open in the browser, not a separate application install
- Supports up to 10 concurrent sessions per agent (subject to capacity profile limits)
- Left-hand session panel shows all active conversations; clicking a session switches context without losing any open work
- Each session has tabs: one default tab (usually the Customer Summary / Active Conversation form) and optional additional tabs configured via application tab templates
- Home session is always present and shows the agent's default home dashboard; it cannot be closed
- CSW is the only app that supports Copilot (Copilot Studio AI agent handoff, Copilot suggestions, knowledge search panel)
- The app name in the environment app list is "Customer Service workspace": that's CSW regardless of whether it's Contact Center standalone or embedded Customer Service
- Keyboard shortcuts are available for session switching (Ctrl+Shift+number keys) and conversation accept/reject: worth including in agent training

## When to use / skip
Every D365 Contact Center deployment uses CSW as the agent interface, there's no alternative for omnichannel. Legacy Customer Service Hub does not support live conversation handling, Copilot, or multi-session. If any agent is still opening Customer Service Hub to handle contact centre conversations, that's a training gap, not a valid workflow.

The one edge case: some clients have agents who do case-only work with no live channel handling. Those agents can remain in Customer Service Hub or a custom app if CSW's multi-session nav is confusing for them. But anyone touching live conversations needs CSW.

## Configuration decisions
- Set CSW as the default app for the agent security role so it opens automatically rather than requiring agents to navigate from the app picker
- Decide on the default home page for the home session: most deployments show the agent's queue or a custom dashboard; the out-of-box default is the Customer Service Agent Dashboard
- Configure session templates and application tab templates before go-live: these control what opens in each session and tab when a conversation is accepted
- Assign agents the correct experience profiles; experience profiles control which features are visible in CSW (Copilot, channels, scripts, etc.)
- Determine whether agents need Dynamics 365 Customer Service Enterprise licence or just the Contact Center add-on: CSW functionality varies by licence

## Gotchas
- CSW browser tab ≠ session. Agents sometimes open multiple browser tabs thinking that's how you handle multiple conversations. Multi-session is within a single CSW browser tab; opening a second browser tab creates a separate app instance and can cause session conflicts.
- The home session cannot be closed. Agents find this confusing initially: there's always a "Home" tab that can't be removed. Frame it in training as the agent's dashboard, not an extra conversation.
- Unsaved work in a session is not lost when switching sessions, but any unsaved changes in forms will prompt on close. Agents who switch sessions frequently will encounter save prompts when they eventually close a session: train them to save as they go.
- CSW requires specific browser support (Chromium-based browsers recommended). Safari has known rendering issues. Check the client's browser policy early: locked-down environments sometimes restrict Chrome.
- Experience profiles control feature visibility but not data access. An agent without the right security role can still see the feature if it's in their experience profile: but might hit access denied errors on the underlying record.
- The app picker shows all apps the agent has access to. If agents can see Customer Service Hub and CSW, they'll sometimes open the wrong one. Remove excess app access at go-live.

## Consultant notes

- The "browser tab vs session" confusion is the most reliable agent training gap on every deployment. Agents come from other systems where multitasking means multiple browser tabs. Spend time in initial training demonstrating the session panel explicitly and having agents practise switching between two simultaneous conversations within a single CSW tab. If you don't cover this, you'll get support calls from supervisors asking why agents "can only handle one conversation at a time."
- Set the default app programmatically if you can, or include it in the agent setup guide: the app picker is the first thing agents see and it has multiple options that look similar. "Customer Service workspace" vs "Customer Service Hub" vs whatever the client's IT team has added is confusing. A single correct bookmark or start page solves it.
- Experience profiles and licence type interact in ways that trip up go-live readiness checks. An agent might have CSW access and appear correctly set up, but miss Copilot features because their experience profile wasn't updated or they're on the wrong licence tier. Build an agent access verification checklist that covers: correct app access, experience profile assigned, licence confirmed, and a quick feature smoke test (accept a test conversation, confirm Copilot panel appears, confirm knowledge search works).

---

*Source last updated: 2026-04-30 | Revisit if Microsoft restructures the app model or renames CSW in a future release wave*
