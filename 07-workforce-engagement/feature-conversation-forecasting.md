# Agent Forecasting for Conversations

**Category:** Workforce Engagement
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../configure-agent-forecasting-conversation](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-agent-forecasting-conversation)

## What it does
AI-backed report that predicts conversation volumes and staffing demand from historical data. Produces daily forecasts up to 6 months ahead and 15-minute intraday forecasts up to 6 weeks ahead. Configurable for SLA targets, shrinkage, and concurrency per channel.

## Key facts
- **Standalone only**: not available in embedded deployments
- Minimum **2 weeks of historical data** required before forecasts generate
- Intraday (15-min) forecast uses **most recent 6 weeks only**: older history is not used for the intraday model
- Daily forecast range: up to 6 months if ≥12 months of history available; otherwise half the available history
- **AI bot conversations (unescalated) are excluded** from staffing demand calculation
- First enable: data can take **up to 24 hours** to appear
- Global configuration: Required Service Level (%), Target Answer Time, Shrinkage (%), Concurrency
- **Channel overrides** allow different concurrency/SLA settings per channel (e.g. voice concurrency = 1, chat concurrency = 3)
- Holiday calendar integration available for seasonality modelling
- Read privilege on `msdyn_dataanalyticsreport_forecast` table required for non-admin users to view the report

## When to use / skip
Turn this on for any standalone deployment that needs staffing forecasts. Enable early, more history = better model, so turn it on during UAT to have data ready for go-live.

## Configuration decisions
- **Concurrency per channel**: most critical accuracy lever; voice = 1, chat/messaging = 2–5 depending on client practice; validate with operations team before configuring
- **Shrinkage %**: most clients underestimate; typical range is 20–35%; underconfiguring understates staffing need
- **Channel overrides**: required for any mixed-channel deployment; a single global concurrency value cannot serve both voice and digital channels accurately
- **Historical data start date**: defaults to earliest records up to 2 years back; adjust if there is a known data quality issue in older records

## Gotchas
- **Concurrency misconfiguration kills accuracy.** Chat reps handling 3 conversations at once but concurrency set to 1 = 3x overstated staffing demand.
- **24-hour data lag catches everyone.** Tell the client up front: enable this, then wait a day for data to appear.
- **This is not the same as WFM forecasting** (`feature-wfm-forecasting-capacity.md`). Both exist. This AI report does SLA/concurrency modelling. WFM forecasting plugs into capacity plans and scenario modelling.

## Consultant notes

- Enable this early in the project, not at go-live. More historical data equals a better model. Turning it on during UAT rather than the day of go-live gives the model a few weeks of training data and avoids the "the forecast looks wrong" conversation in the first post-go-live week.
- Concurrency misconfiguration is the accuracy killer to verify upfront. Ask the client's ops team how many conversations a chat rep actually handles simultaneously, not how many the system allows. If reps regularly take 3 simultaneous chats and concurrency is set to 1, the staffing demand output is meaningless.
- This is not the same as WFM forecasting: they do different things. If the client asks "which one should we use?" the answer is usually both, but for different purposes: this for SLA/demand modelling, WFM forecasting for capacity planning and schedule building.

---

*Source last updated: 2025-06-30 | Check this if: Forecast rolls out to embedded, or range limits change*
