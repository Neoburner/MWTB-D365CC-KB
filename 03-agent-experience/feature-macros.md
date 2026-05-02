# Macros

**Category:** Agent Experience
**Applies To:** Standalone (Contact Center); Customer Service
**Source:** [learn.microsoft.com/.../macros](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/macros)

## What it does
Sequences of automated actions triggered by reps or agent script steps. Runs predefined steps — opening records, filling forms, sending emails, resolving cases, triggering Power Automate flows — consistently every time with a single click. The automation engine behind agent scripts.

## Key facts
- Every macro **must start with a "Start macro execution" step** — omitting it causes macro failure
- Three action categories: **Productivity Automation** (open/update records, resolve cases, KB search, OData queries), **Session Connector** (tab operations), **Omnichannel Connector** (link/unlink records to conversations — Contact Center only)
- No branching or conditional logic within a single macro — use separate macros invoked by conditional script steps for branching
- **Flow Connector** actions can trigger Power Automate flows from within a conversation session
- Triggerable via Productivity Pane (manual), agent script step, or `runMacro` API
- Requires: **Productivity tools administrator** to create; **Productivity tools user** or **Customer Service Representative** to use
- Omnichannel Connector actions not available in Customer Service-only deployments (Contact Center standalone only)
- Session context populated from anchor tab only — non-anchor tab values need OData queries to access

## When to use / skip
Use whenever a rep performs the same sequence of manual steps repeatedly — opening a record, pre-filling a form, linking a case. The value is proportional to how repetitive and error-prone the task is. Skip for one-off tasks or highly variable interactions where the script doesn't fit the conversation.

## Configuration decisions
- Which actions to automate — design macros alongside agent scripts; macros are most valuable when embedded in script steps rather than used standalone
- Flow Connector vs native actions — use Flow Connector for back-end integrations with external systems (ERP, external CRM); use native Productivity Automation for Dataverse-only operations

## Gotchas
- **"Start macro execution" is required as the first step.** Anyone building macros for the first time will miss this. Add it to any training or handover documentation for client admins.
- **No branching within a macro.** Complex conditional logic (e.g. different actions based on case category) requires separate macros triggered by conditional script steps, not a single branching macro.
- **Macro names are visible to reps.** Use self-documenting names ("Link Case to Conversation", not "Macro_001")—reps see them in the Productivity Pane and script steps.

## Consultant notes

- "Start macro execution" being mandatory is literally the first thing to cover when training client admins to build their own macros. It's the mistake everyone makes on their first attempt and the resulting error isn't obvious about why the macro failed.
- Macro naming is worth enforcing from day one. Once a production org has "Macro_001" and "New Macro (3)" proliferating, it's painful to clean up. Push for self-documenting names in the naming convention you hand over.
- Flow Connector for external systems vs native Productivity Automation for Dataverse is a clean architectural boundary worth setting in the design document. It stops people building Power Automate flows for things that can be done natively, and vice versa.

---

*Source last updated: 2025-05-05 | Review when: New predefined automation action categories added, or Flow Connector capabilities expanded*
