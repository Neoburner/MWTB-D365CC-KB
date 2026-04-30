# Copilot Conversation Summary Format Customisation

**Category:** Copilot and AI
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../customize-copilot-conv-summary](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/customize-copilot-conv-summary)

## What it does
Controls the output format of Copilot-generated live conversation summaries. Two formats: Paragraph (single block of text) or Structured (selectable sections in configurable order with optional omission of unfound sections). Applies to live conversation summaries only — case summary format is separate.

## Key facts
- Two format options: **Paragraph** (Copilot determines structure) and **Structured** (admin selects and orders categories)
- Structured categories available: Root Cause, Customer Issue, Troubleshooting Steps, Outcome, Error Codes
- Error Codes category: admin provides sample codes as pattern hints — Copilot identifies similar patterns in the conversation; not an exact match
- **"Remove information that can't be found" toggle:** when on, empty categories are excluded from the summary entirely; when off, empty category headings appear with no content
- **One global format setting** — no per-workstream or per-team format
- Only the five built-in categories are available for structured format — no custom categories

## When to use / skip
Configure format on any deployment with conversation summaries. Structured format with "remove unfound information" is the recommended default — cleaner output, faster to scan.

## Configuration decisions
- Paragraph vs Structured — Paragraph is simpler but harder for reps to scan on handoffs; Structured is recommended for any deployment with rep handoffs or transfer scenarios
- Which categories to include — tailor to the contact centre type: technical support (include Root Cause + Troubleshooting Steps + Error Codes); retail (exclude Error Codes)
- Category order — put the most actionable information first for the rep receiving the handoff

## Gotchas
- **One global setting for all reps.** If teams have different needs (tech vs billing), the format is a compromise. Design for the highest-volume team and train the rest on interpretation.
- **Error Codes is a pattern hint, not exact matching.** Sample codes help Copilot recognise similar codes — spend 10 minutes populating this with client-specific codes during setup.

---

*Source last updated: 2026-03-26 | Check this after additional structured categories are added or per-workstream format configuration is supported*
