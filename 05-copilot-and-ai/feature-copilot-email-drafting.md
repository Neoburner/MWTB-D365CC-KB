# Copilot Email Drafting

**Category:** Copilot and AI
**Applies To:** Standalone + embedded (inline mode standalone/CS only)
**Source:** [learn.microsoft.com/.../copilot-email-drafting](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-email-drafting)

## What it does
AI-generated email drafts using case context. Two modes: help pane mode (draft appears in a side panel) and inline rich text editor mode (draft appears directly in the compose window). Both modes pull from case fields to generate contextually relevant replies.

## Key facts
- **Mode 1 (help pane):** enabled via Copilot Service admin center → Productivity → Copilot for questions and emails → Write an email toggle
- **Mode 2 (inline/contextual):** requires **rich text editor version 2**; enabled in Power Apps app settings → Contextual email drafting with AI; Contact Center standalone and Customer Service only (not embedded)
- Source fields used by Copilot: Case Title, Description, Customer Contact, Subject (configurable), Case Notes, Email Content (**Case Notes and Email Content cannot be removed**)
- **Email template recommendations** is a separate toggle from email drafting — both must be configured independently if both are wanted

## When to use / skip
High-value addition for any deployment where reps regularly compose email responses to customers or cases. Inline mode is more ergonomic than help pane mode — recommend inline (Mode 2) wherever the deployment type supports it.

## Configuration decisions
- Mode 1 vs Mode 2 — Mode 2 (inline) is preferred UX; requires RTE v2 and standalone/CS only; Mode 1 is the fallback for embedded deployment
- Which case source fields to include — only Case Notes and Email Content are fixed; other fields can be tuned to match the client's case data model
- Email template recommendations — decide whether to enable alongside drafting; separate config step

## Gotchas
- **RTE version 2 requirement for inline mode.** If the org is on version 1, there's a migration step before inline mode can be enabled. Confirm RTE version before committing to inline mode in the solution design.
- **Case Notes and Email Content are always included.** If the client has sensitive or automated content in these fields (e.g. system-generated notes, disclaimer footers), Copilot will include them in the draft context. This can produce unexpected draft content — test with real case data.

---

*Source last updated: check Microsoft Learn | Review when: Inline mode becomes available for embedded deployment, or source field constraints change*
