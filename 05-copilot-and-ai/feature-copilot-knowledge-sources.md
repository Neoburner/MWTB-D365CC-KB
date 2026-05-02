# Copilot Knowledge Sources from Copilot Studio (Preview)

**Category:** Copilot and AI
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-knowledge-sources](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-knowledge-sources)

> ⚠️ **Preview feature**: subject to change before GA.

## What it does
Extends Copilot's Ask a Question beyond D365 KB to sources configured in a Copilot Studio agent: websites, SharePoint, uploaded files, Dataverse tables, and enterprise data via Microsoft Graph connectors.

## Key facts
- **Applies to Ask a Question only**: does not affect case summaries, conversation summaries, email drafting, or any other Copilot capability
- Supported source types: Public website, SharePoint, File upload, Dataverse, Microsoft Graph connectors
- **Copilot connectors (enterprise data) are NOT supported**: must use Microsoft Graph connectors for enterprise data
- Configuration is done in Copilot Studio: not manageable entirely from Copilot Service admin center
- Changes to knowledge sources require publish in Copilot Studio before taking effect
- Custom instructions configured in the Copilot admin center **do not apply** when Copilot Studio knowledge sources are in use

## When to use / skip
Use when knowledge extends beyond D365 KB, SharePoint docs, policies, product manuals. Skip if KB is entirely within D365 and Preview status is a concern for production.

## Configuration decisions
- Which source types to enable: start with the highest-value source (usually SharePoint or uploaded files); each adds crawl/indexing complexity
- Graph connectors vs other sources: Graph connectors are the enterprise data path but require existing Graph connector infrastructure

## Gotchas
- **Custom instructions are silently bypassed.** Custom tone/style instructions don't carry over to Copilot Studio sources. Reps will notice inconsistent response style.
- **Preview status.** Not production-critical for regulated industries until GA. Configuration and behaviour are subject to change.
- **Copilot connectors ≠ Graph connectors.** Confusing naming. Clients asking about "Copilot connectors" as knowledge sources need to redirect to Graph connectors instead.

## Consultant notes

- Custom instructions being silently bypassed when Copilot Studio sources are in use creates a noticeable inconsistency in rep experience. If reps notice Copilot responding differently to the same question depending on which source answered it, this is why. Make sure the client understands this before extending to Copilot Studio sources.
- Preview status means this shouldn't be in production scope for regulated industries without an explicit client sign-off acknowledging the risk. Don't deploy it as a standard feature: position it as a roadmap item until GA.
- Copilot connectors vs Graph connectors naming confusion is real. Clients and partners referring to "Copilot connectors" as a knowledge source need redirecting to the Graph connector path. Worth clarifying in any pre-sales or discovery conversation where this feature comes up.

---

*Source last updated: check Microsoft Learn | Check this after feature reaches GA or additional knowledge source types are supported*
