# Copilot Verbatim Responses for Knowledge Articles (Preview)

**Category:** Copilot and AI
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-verbatim-responses](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-verbatim-responses)

> ⚠️ **Preview feature** — subject to change before GA.

## What it does
Tags knowledge articles so Copilot returns exact, unmodified text instead of paraphrasing. Configured at the article level by knowledge managers — not in Copilot admin settings. Two scopes: entire article (tag with `doNotSummarize` keyword) or specific sections (tag with the Verbatim icon in the editor).

## Key facts
- **Applies to Ask a Question only** — not email drafting, conversation summaries, case summaries, or any other Copilot feature
- Article-level verbatim: add `doNotSummarize` keyword to the article content; full article returned verbatim
- Section-level verbatim: select a subsection in the editor → Verbatim icon; only that section returned verbatim; rest of article follows standard Copilot behaviour
- Rep experience: verbatim response appears in Ask a Question pane with a source reference link; selecting Check sources opens the article with verbatim content highlighted
- Tagging is done in knowledge article editor — knowledge managers must have access to the KB to configure this
- **Not configurable from Copilot Service admin center** — purely an article-level knowledge management task

## When to use / skip
Use for content where exact wording is legally, regulatorily, or contractually required: legal disclosures, warranty terms, regulatory guidance, standardised troubleshooting procedures. Skip for general informational articles where paraphrased responses are fine.

## Configuration decisions
- Which articles warrant verbatim vs which can be paraphrased — this is a content governance decision for the client's knowledge management team
- Section vs full-article verbatim — section verbatim is more precise; full-article verbatim is appropriate when the entire article is sensitive (e.g. legal disclaimer)

## Gotchas
- **Knowledge managers must configure this, not Copilot admins.** It requires editing published knowledge articles. Ensure knowledge managers understand the tagging mechanisms — `doNotSummarize` keyword and the Verbatim icon — and have access to the KB editor.
- **Preview status.** Tagging methods and behaviour are subject to change before GA.

---

*Source last updated: check Microsoft Learn | Review when: Feature reaches GA, or additional verbatim tagging methods added*
