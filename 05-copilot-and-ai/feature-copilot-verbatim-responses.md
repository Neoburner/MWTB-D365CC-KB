# Copilot Verbatim Responses for Knowledge Articles (Preview)

**Category:** Copilot and AI
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-verbatim-responses](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-verbatim-responses)

> ⚠️ **Preview feature**: subject to change before GA.

## What it does
Tags knowledge articles so Copilot returns exact, unmodified text instead of paraphrasing. Configured at article level by knowledge managers, not in Copilot admin. Two scopes: entire article (tag with `doNotSummarize`) or specific sections (tag with Verbatim icon).

## Key facts
- **Applies to Ask a Question only**: not email drafting, conversation summaries, case summaries, or any other Copilot feature
- Article-level verbatim: add `doNotSummarize` keyword to the article content; full article returned verbatim
- Section-level verbatim: select a subsection in the editor → Verbatim icon; only that section returned verbatim; rest of article follows standard Copilot behaviour
- Rep experience: verbatim response appears in Ask a Question pane with a source reference link; selecting Check sources opens the article with verbatim content highlighted
- Tagging is done in knowledge article editor: knowledge managers must have access to the KB to configure this
- **Not configurable from Copilot Service admin center**: purely an article-level knowledge management task

## When to use / skip
Use for content where exact wording is legally, regulatorily, or contractually required: legal disclosures, warranty terms, regulatory guidance, standardised troubleshooting procedures. Skip for general informational articles where paraphrased responses are fine.

## Configuration decisions
- Which articles warrant verbatim vs which can be paraphrased: this is a content governance decision for the client's knowledge management team
- Section vs full-article verbatim: section verbatim is more precise; full-article verbatim is appropriate when the entire article is sensitive (e.g. legal disclaimer)

## Gotchas
- **Knowledge managers configure this, not Copilot admins.** Requires editing published articles. Make sure knowledge managers understand the tagging mechanisms (`doNotSummarize` keyword and Verbatim icon) and have KB editor access.
- **Preview status.** Tagging methods and behaviour are subject to change before GA.

## Consultant notes

- This is a knowledge management team task, not a Copilot admin task. Whoever owns the KB needs to understand the `doNotSummarize` tag and the Verbatim section icon: it's done in article editing, not in the admin centre. Include KB editors in the Copilot training, not just Copilot admins.
- Identify and tag compliance-critical articles before Copilot is enabled for reps, not after. Discovering that Copilot has been paraphrasing legal disclaimers for two weeks in production is an uncomfortable conversation. Build the tagging work into the pre-go-live checklist.
- Section-level verbatim is usually preferable to full-article verbatim. Most articles have a mix of general information (fine to paraphrase) and specific terms or procedures (require verbatim). Section tagging is more precise and gives Copilot room to be useful on the rest of the article.

---

*Source last updated: check Microsoft Learn | Check this after feature reaches GA or additional verbatim tagging methods are added*
