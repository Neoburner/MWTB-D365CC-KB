# Copilot Knowledge Sources from Copilot Studio (Preview)

**Category:** Copilot and AI
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-knowledge-sources](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-knowledge-sources)

> ⚠️ **Preview feature** — subject to change before GA.

## What it does
Extends Copilot's Ask a Question capability beyond the D365 knowledge base to knowledge configured in a Copilot Studio agent: public websites, SharePoint, uploaded files, Dataverse tables, and enterprise data via Microsoft Graph connectors.

## Key facts
- **Applies to Ask a Question only** — does not affect case summaries, conversation summaries, email drafting, or any other Copilot capability
- Supported source types: Public website, SharePoint, File upload, Dataverse, Microsoft Graph connectors
- **Copilot connectors (enterprise data) are NOT supported** — must use Microsoft Graph connectors for enterprise data
- Configuration is done in Copilot Studio — not manageable entirely from Copilot Service admin center
- Changes to knowledge sources require publish in Copilot Studio before taking effect
- Custom instructions configured in the Copilot admin center **do not apply** when Copilot Studio knowledge sources are in use

## When to use / skip
Use when the client's knowledge extends beyond the D365 KB — SharePoint documentation, policy files, product manuals. Skip if the client's KB is entirely within D365 knowledge articles and the Preview status is a concern for production deployments.

## Configuration decisions
- Which source types to enable — start with the highest-value source (usually SharePoint or uploaded files); each adds crawl/indexing complexity
- Graph connectors vs other sources — Graph connectors are the enterprise data path but require existing Graph connector infrastructure

## Gotchas
- **Custom instructions are silently bypassed.** Any custom tone/style instructions configured for Ask a Question with D365 KB do not carry over to Copilot Studio-sourced knowledge. Reps will notice inconsistent response style.
- **Preview status.** Do not use as a production-critical feature for regulated industries until GA. The configuration interface and behaviour are subject to change.
- **Copilot connectors ≠ Graph connectors.** This is a confusing naming distinction. Clients who ask about "Copilot connectors" expecting to use them as knowledge sources will need to redirect to Graph connectors instead.

---

*Source last updated: check Microsoft Learn | Review when: Feature reaches GA, or additional knowledge source types supported*
