# Knowledge Analytics

**Category:** Analytics and Reporting
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../enable-knowledge-search-insights](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-knowledge-search-insights)

## What it does
Two dashboards tracking rep knowledge search behaviour: **Article insights** (which articles are accessed, how often, rep feedback ratings) and **Search term insights** (what terms reps search, search volume, no-result rates). Internal rep search only — does not track customer portal search.

## Key facts
- Two separate dashboards: Article insights (main toggle) and Search term insights (**separate checkbox** — not enabled by the main toggle)
- Default access: System Administrator, Knowledge Manager, CSR Manager
- Custom roles need Read on `msdyn_dataanalyticsreport_ksinsights` table
- **Internal search only** — customer portal/self-service search not tracked
- Article feedback ratings only populate if rep feedback is enabled in Knowledge Management settings (`feature-knowledge-management.md`)
- Custom workspace apps require App Designer navigation entry

## When to use / skip
Turn this on for any deployment with a knowledge base. Search term insights shows content gaps — always enable it alongside the base report.

## Configuration decisions
- No additional configuration beyond enabling both toggles

## Gotchas
- **Search term insights needs its own checkbox.** Easy to miss. Enable both at once.
- **Feedback scores are blank if rep feedback isn't enabled** in Knowledge Management. Check that first.
- **This is the main feedback loop for Copilot quality.** High-volume searches with no results = articles you need to write or fix.

## Consultant notes

- The search term insights dashboard is the most useful thing in this section and the one most likely to be left disabled. Enable both toggles at once — there is no good reason to have Article insights without Search term insights, and the no-result search data is the single best indicator of knowledge gaps you'll get from the system without any extra effort from the team.
- Check that rep feedback is enabled in Knowledge Management settings before enabling this analytics report. If it isn't, the feedback scores column is blank and the client will conclude the analytics aren't working. It's a two-minute check during UAT but easy to skip if you're working through a long configuration list.
- Frame search term insights in the handover as a content improvement tool, not just a usage report. A high-volume search term that returns no results is an article that needs to be written. A term that returns three articles but has low open rates suggests the article titles or metadata don't match how reps describe the problem. That framing tends to drive actual knowledge base maintenance rather than just leaving the dashboard open.

---

*Source last updated: 2025-06-20 | Check this if: Customer-facing search analytics ship, or new quality signals appear*
