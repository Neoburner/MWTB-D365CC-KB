# Copilot Email Drafting

**Category:** Copilot and AI
**Applies To:** Standalone + embedded (inline mode standalone/CS only)
**Source:** [learn.microsoft.com/.../copilot-email-drafting](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-email-drafting)

## What it does
AI-generated email drafts from case context. Two modes: help pane (draft in side panel) or inline editor (draft in compose window). Both pull from case fields to generate contextual replies.

## Key facts
- **Mode 1 (help pane):** enabled via Copilot Service admin center → Productivity → Copilot for questions and emails → Write an email toggle
- **Mode 2 (inline/contextual):** requires **rich text editor version 2**; enabled in Power Apps app settings → Contextual email drafting with AI; Contact Center standalone and Customer Service only (not embedded)
- Source fields used by Copilot: Case Title, Description, Customer Contact, Subject (configurable), Case Notes, Email Content (**Case Notes and Email Content cannot be removed**)
- **Email template recommendations** is a separate toggle from email drafting: both must be configured independently if both are wanted

## When to use / skip
High-value for any deployment where reps regularly compose emails to customers. Inline mode is more ergonomic, use Mode 2 wherever your deployment type supports it.

## Configuration decisions
- Mode 1 vs Mode 2: Mode 2 (inline) is preferred UX; requires RTE v2 and standalone/CS only; Mode 1 is the fallback for embedded deployment
- Which case source fields to include: only Case Notes and Email Content are fixed; other fields can be tuned to match the client's case data model
- Email template recommendations: decide whether to enable alongside drafting; separate config step

## Gotchas
- **RTE v2 requirement for inline mode.** If the org is on v1, migrate first before enabling inline. Confirm version before committing to inline in design.
- **Case Notes and Email Content are always included.** If the client has sensitive or automated content in these fields (system notes, disclaimers), Copilot includes them in the draft. Test with real data.

## Consultant notes

- Confirm the rich text editor version before committing to inline mode in the design. One question to the client's CRM admin saves a potential rebuild mid-sprint. If they're on v1, factor the migration into the project scope before promising Mode 2.
- Case Notes and Email Content always being included is worth testing with real case data. Clients with verbose system notes, automated disclaimer fields, or dev debug text in Case Notes will find all of that surfacing in Copilot drafts. Test it with realistic data, not clean demo records.
- Email template recommendations being a separate toggle is the gap that generates a "we thought this was included" conversation. If the client wants both drafting and template suggestions, confirm both toggles are configured as part of the Copilot setup checklist.

---

*Source last updated: check Microsoft Learn | Check this after inline mode becomes available for embedded deployment or source field constraints change*
