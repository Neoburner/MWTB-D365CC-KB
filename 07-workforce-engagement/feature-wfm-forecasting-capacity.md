# WFM Forecasting and Capacity Planning

**Category:** Workforce Engagement
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../wfm-configure-forecast-scenarios](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/wfm-configure-forecast-scenarios)

## What it does
Two complementary WFM features: **Forecasting** predicts conversation/case volumes at daily (up to 6 months) and 15-minute intraday (up to 6 weeks) granularity; **Capacity planning** uses forecast scenarios as inputs to model staffing numbers by channel and queue. Enabled separately but designed to work together.

## Key facts
- Both require WFM package installation and user management setup (`feature-wfm-setup.md`) as prerequisites
- **Standalone only** — not available in embedded
- Forecasting: supports scenario modelling, channel/queue data slicing, and export for external planning
- Capacity planning: connects directly to forecast scenarios — requires Forecasting to also be enabled
- These are separate from the AI-backed forecasting report (`feature-conversation-forecasting.md`), which includes SLA/concurrency modelling

## When to use / skip
Enable both together on any deployment where the client needs WFM-integrated staffing planning. If the client needs scenario modelling ("what if volumes spike 20%?"), these are the right tools. If they just need a staffing demand number, the AI forecasting report may be sufficient.

## Configuration decisions
- Whether to enable both together or start with Forecasting only — Capacity planning has no value without Forecasting, but Forecasting can be used standalone for volume prediction
- Scenario granularity — the client's planning team should define what scenarios are worth modelling (seasonal peaks, marketing campaigns, product launches)

## Gotchas
- **WFM Forecasting ≠ AI Agent Forecasting report.** Two different surfaces, different capabilities. WFM forecasting integrates with capacity plans and scenario modelling. The AI report (`feature-conversation-forecasting.md`) has SLA configuration and concurrency modelling but no capacity plan integration. Clients with sophisticated WFM needs may use both.
- **Capacity planning is inoperable without Forecasting enabled.** Enable both in the same session.

---

*Source last updated: 2026-04-16 | Review when: New WFM forecast features added, or capacity planning integrations expand*
