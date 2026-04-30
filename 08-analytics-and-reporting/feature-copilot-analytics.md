# Copilot Analytics

**Category:** Analytics and Reporting
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-analytics](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-analytics)

## What it does
Dashboard tracking how reps use Copilot features — which features are being used, how often, and across which interaction types (cases, emails, conversations). Primary tool for measuring Copilot adoption post-deployment.

## Key facts
- **Not independently enabled** — requires Copilot help pane and Copilot summaries both opted in first
- Up to **24-hour provisioning delay** after enabling before data appears
- Interaction tracking scope is configurable: cases, emails, conversations can be included/excluded
- Tracks usage, not quality — high usage does not confirm good Copilot output quality

## When to use / skip
Enable alongside Copilot during initial setup. If a client wants Copilot ROI data, this is the primary source. No reason to skip if Copilot is in scope.

## Configuration decisions
- **Which interaction types to track** — enable all three (cases, emails, conversations) unless there is a specific exclusion reason; granularity is always more useful than aggregate data

## Gotchas
- **Enable at the same time as Copilot, not after.** The 24-hour delay means enabling post-go-live loses the first day of production data. Enable during UAT.
- **Usage ≠ quality.** Supplement Copilot analytics with transcript recording and knowledge analytics to get a complete picture of Copilot effectiveness.

---

*Source last updated: 2025-05-06 | Review when: New Copilot interaction types trackable, or analytics content expands*
