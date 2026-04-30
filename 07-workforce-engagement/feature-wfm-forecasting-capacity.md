# WFM Forecasting and Capacity Planning

**Category:** Workforce Engagement
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../wfm-configure-forecast-scenarios](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/wfm-configure-forecast-scenarios)

## What it does
Two linked WFM features: **Forecasting** predicts conversation/case volumes daily (up to 6 months) and in 15-minute blocks (up to 6 weeks). **Capacity planning** uses those forecasts to model staffing by channel and queue. Enabled separately, but they're meant to work together.

## Key facts
- Both require WFM package installation and user management setup (`feature-wfm-setup.md`) as prerequisites
- **Standalone only** — not available in embedded
- Forecasting: supports scenario modelling, channel/queue data slicing, and export for external planning
- Capacity planning: connects directly to forecast scenarios — requires Forecasting to also be enabled
- These are separate from the AI-backed forecasting report (`feature-conversation-forecasting.md`), which includes SLA/concurrency modelling

## When to use / skip
Turn on both together if the client needs WFM-integrated staffing planning, especially for scenario modelling ("what if we spike 20%?"). If they just want a staffing-demand number, the AI forecasting report alone is enough.

## Configuration decisions
- Whether to enable both together or start with Forecasting only — Capacity planning has no value without Forecasting, but Forecasting can be used standalone for volume prediction
- Scenario granularity — the client's planning team should define what scenarios are worth modelling (seasonal peaks, marketing campaigns, product launches)

## Gotchas
- **WFM Forecasting ≠ AI Agent Forecasting report.** Different tools, different UX. WFM forecasting plugs into capacity planning. AI report has SLA/concurrency config but no capacity plan integration. Sophisticated shops use both.
- **Capacity planning won't work without Forecasting.** Enable both at once.

---

*Source last updated: 2026-04-16 | Check this if: New WFM features drop, or capacity planning integrations expand*
