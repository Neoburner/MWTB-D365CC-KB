# Conversation Orchestration using AI-Powered Playbooks

> **Status:** Public Preview — behaviour may change.

**Category:** Routing  
**Applies To:** Standalone / Embedded  
**Source:** [Configure conversation orchestration in Dynamics 365 Contact Center (preview)](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-conversation-orchestration)

## What it does

Conversation orchestration actively monitors every conversation throughout its lifecycle — from queue entry through resolution — and responds automatically when conditions change. Instead of static routing rules firing at a single point, you define playbooks that watch for specific trigger events (wait time thresholds, no agents available, conversation transferred) and execute actions like priority boosts or overflow transfers. Playbooks are written in natural language and executed by the Service Operations Agent.

## Key facts

- Available for **voice and live chat channels only** in the current preview release
- Playbooks consist of a **trigger event**, up to **10 conditions** (with up to 2 context variables each), and a set of **actions**
- Supported trigger events include: conversation waiting in queue, conversation transferred
- Supported actions include: increase priority (0–10,000 range), trigger overflow (route to voicemail, transfer to queue, redirect to number)
- Playbooks have two statuses: **Draft** (editable, not active) and **Active** (live, changes require Save & Publish)
- You cannot have two active playbooks for the **same scenario on the same queue** — this is a hard conflict
- Different scenarios on the same queue (e.g. wait-time prioritisation + availability overflow) **can** run simultaneously
- Requires a **Pay-as-you-go Azure subscription** — consumption billing applies when the agent runs
- Requires unified routing, at least one queue and workstream, and a voice or messaging channel configured
- Dynamic prioritisation from playbooks is **incompatible with custom prioritisation rules** on a queue — remove custom rules before enabling

## When to use / skip

Use this if you need adaptive routing logic that responds to real-time conditions — queues filling up, wait times spiking, agents going offline — without manually re-configuring workstream rules for each scenario. It's particularly useful for organisations handling variable demand across multiple queues where static overflow rules aren't granular enough.

Skip it if you only have a single queue or predictable, stable traffic. The PAYG billing model means every playbook execution costs money; low-volume contact centres will likely find this overkill. Also skip it if any of your queues rely on custom prioritisation rules — the two are mutually exclusive.

## Configuration decisions

- Which trigger events make business sense for each queue (wait time threshold vs. immediate availability check)
- Priority score increments — the 0–10,000 range is wide; agree an internal convention before deploying across multiple queues to avoid conflicting priorities
- Overflow actions per queue: voicemail, transfer to another queue, redirect to a number — this needs to be pre-agreed with operations
- Whether to run different scenario playbooks on the same queues or segment by queue
- How to handle the conflict rule for same-queue/same-scenario playbooks — who owns the canonical active playbook per queue

## Gotchas

- **Editing active playbooks is locked at Save** — you must use Save & Publish, which immediately goes live. There's no staging for active playbooks outside of deactivating them first.
- **Cross-playbook conflicts are only detected at publish time**, not when saving as draft. You can happily save a conflicting draft; the error only surfaces when someone tries to publish.
- **Diagnostics require a custom query** — there's no built-in dashboard for playbook execution tracking in the current preview. You need to set up queries against the conversation diagnostics data in Application Insights.
- **Removing custom prioritisation from a queue is permanent** — if you switch a queue to playbook-driven prioritisation and then deactivate the playbook, the queue has neither mechanism active until something is re-configured.
- **PAYG billing is mandatory** — the Power Platform Pay-as-you-go plan must be set up with an Azure subscription before you can configure conversation orchestration. This is a blocker if procurement hasn't approved the Azure subscription.

## Consultant notes

- Clients consistently underestimate the queue-mapping exercise. Before any playbook is written, you need a definitive list of which queues handle which conversation types and what their acceptable wait thresholds are. Without that, you end up with conflicting active playbooks across queues and a chaotic publish process.
- The natural-language playbook authoring sounds great in demos, but in UAT you'll find that ambiguous prompts produce inconsistent condition matching. Spend time with the client defining precise trigger wording using the provided templates rather than freeform language.
- The PAYG billing model catches procurement teams off-guard in scoping. Raise it as a dependency early — the Azure subscription approval can take weeks in regulated industries, and it's a hard blocker.
- Preview features in D365 CC have a history of behaviour changes between preview and GA, particularly around condition logic and the context variables available per channel. Build this into your testing plan and don't make firm promises about specific variable support until GA.

---

*Worth revisiting at GA — condition types, supported channels, and billing model may change materially from the preview release.*
