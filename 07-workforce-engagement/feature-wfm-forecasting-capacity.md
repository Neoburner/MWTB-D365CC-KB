# WFM Forecasting and Capacity Planning

**Category:** Workforce Engagement
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../wfm-configure-forecast-scenarios](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/wfm-configure-forecast-scenarios)

## What it does
Two linked WFM features: **Forecasting** predicts conversation/case volumes daily (up to 6 months) and in 15-minute blocks (up to 6 weeks). **Capacity planning** uses those forecasts to model staffing by channel and queue. Enabled separately, but they're meant to work together.

## Key facts
- Both require WFM package installation and user management setup (`feature-wfm-setup.md`) as prerequisites
- **Standalone only**: not available in embedded
- Forecasting: supports scenario modelling, channel/queue data slicing, and export for external planning
- Capacity planning: connects directly to forecast scenarios: requires Forecasting to also be enabled
- These are separate from the AI-backed forecasting report (`feature-conversation-forecasting.md`), which includes SLA/concurrency modelling

## When to use / skip
Turn on both together if the client needs WFM-integrated staffing planning, especially for scenario modelling ("what if we spike 20%?"). If they just want a staffing-demand number, the AI forecasting report alone is enough.

## Configuration decisions
- Whether to enable both together or start with Forecasting only: Capacity planning has no value without Forecasting, but Forecasting can be used standalone for volume prediction
- Scenario granularity: the client's planning team should define what scenarios are worth modelling (seasonal peaks, marketing campaigns, product launches)

## Gotchas
- **WFM Forecasting ≠ AI Agent Forecasting report.** Different tools, different UX. WFM forecasting plugs into capacity planning. AI report has SLA/concurrency config but no capacity plan integration. Sophisticated shops use both.
- **Capacity planning won't work without Forecasting.** Enable both at once.

## Consultant notes

- The two-tool story is the main thing to land with clients early. Omnichannel conversation forecasting (`feature-conversation-forecasting.md`) handles SLA and concurrency modelling. WFM forecasting handles volume prediction and feeds capacity planning. They're not duplicates: they serve different audiences (ops reporting vs. workforce planning). If you let the client discover this mid-project, you'll spend time explaining why they appear to have overlapping features.
- If the client has an existing WFM tool (Verint, NICE, Calabrio), explore whether they want to replace it or run WFM forecasting alongside it for Contact Center-specific volumes. The export capability supports the latter, but you'll need to agree on a single source of truth for headcount decisions.
- Enable both Forecasting and Capacity planning together from the start. Enabling Forecasting alone and coming back to Capacity planning later means the client runs part of the workflow for weeks without the planning output: that makes it hard to validate the forecast quality in context.

---

*Source last updated: 2026-04-16 | Check this if: New WFM features drop, or capacity planning integrations expand*
