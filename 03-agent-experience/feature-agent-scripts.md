# Agent Scripts

**Category:** Agent Experience
**Applies To:** Standalone (Contact Center); Customer Service
**Source:** [learn.microsoft.com/.../agent-scripts](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/agent-scripts)

## What it does
Provides step-by-step guidance to reps in the Productivity Pane during interactions. Scripts are ordered steps that can be text instructions, macros, or references to other scripts. They surface automatically based on session type and can be conditionally selected by conversation context.

## Key facts
- Scripts are linked to **session templates**: they surface when the matching session type opens; a session template can have multiple scripts
- Three step action types: Text instruction (display only), Macro (executes automation), Script (loads a nested script)
- **Default script selection** per session template is controlled by expression-based conditions (evaluated at session open time)
- Requires: **Productivity tools administrator** role to create; **Productivity tools user** role for reps to use scripts
- Productivity Pane must be enabled (on by default)
- Steps can use slugs (e.g. `Hi {customer}`) to personalise instructions using session context values

## When to use / skip
Use for any contact centre with structured interaction flows: compliance disclosures, new hire onboarding, tiered support scripts, sales conversions. Skip if reps are fully autonomous knowledge workers with highly variable interactions, the script overhead becomes friction without value.

## Configuration decisions
- Macro-backed steps vs text-only steps: text-only informs; macro-backed steps actually do the work (open records, fill forms, send email). Richer scripts use macros extensively.
- Conditional default script selection: if different teams or customer segments need different scripts in the same session type, configure expression-based selection rather than separate session templates
- Script chaining via nested Script steps: useful for modular designs (shared wrap-up script reused across multiple scripts)

## Gotchas
- **Scripts only appear in Copilot Service workspace.** Customer Service Hub doesn't show the Productivity Pane.
- **Expression-based default selection is evaluated once at session open.** It doesn't dynamically switch scripts mid-conversation if context changes.

## Consultant notes

- Build scripts and macros together, not separately. A script that's all text-only steps is something reps start ignoring within a week. The real value is macro-backed steps that actually do the work: open the record, pre-fill the form, link the case. Design them in parallel.
- Expression-based default script selection is worth designing upfront if multiple teams or customer segments share a session type. Retrofitting conditional script selection after go-live means touching session templates that agents are already used to: do it right in the design phase.
- Copilot Service workspace being mandatory is the implicit blocker to check if any agents are on Customer Service Hub at go-live. Scripts simply won't appear for them and you'll spend time diagnosing something that isn't a config error.

---

*Source last updated: 2025-04-14 | Review when: Script step types expanded or dynamic mid-conversation script switching supported*
