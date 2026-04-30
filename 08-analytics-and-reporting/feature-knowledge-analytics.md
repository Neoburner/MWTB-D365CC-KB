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
Enable on any deployment with an active knowledge base. Search term insights is where KB content gaps are found — enable it without exception alongside the base report.

## Configuration decisions
- No additional configuration beyond enabling both toggles

## Gotchas
- **Search term insights has a separate checkbox** from the main enable toggle. It's easy to miss. Enable both at the same time.
- **Article feedback scores will be blank** if knowledge article rep feedback wasn't enabled in Knowledge Management. Check that setting first.
- **This is the feedback loop for Copilot quality.** High-volume search terms with no-result responses in Search term insights identify exactly which articles need to be written or improved.

---

*Source last updated: 2025-06-20 | Review when: Customer-facing search analytics added, or new quality signals surfaced*
