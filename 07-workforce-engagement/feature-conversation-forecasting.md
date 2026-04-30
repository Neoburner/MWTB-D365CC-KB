# Agent Forecasting for Conversations

**Category:** Workforce Engagement
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../configure-agent-forecasting-conversation](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-agent-forecasting-conversation)

## What it does
AI-backed report that predicts conversation volumes and staffing demand from historical data. Produces daily forecasts up to 6 months ahead and 15-minute intraday forecasts up to 6 weeks ahead. Configurable for SLA targets, shrinkage, and concurrency per channel.

## Key facts
- **Standalone only** — not available in embedded deployments
- Minimum **2 weeks of historical data** required before forecasts generate
- Intraday (15-min) forecast uses **most recent 6 weeks only** — older history is not used for the intraday model
- Daily forecast range: up to 6 months if ≥12 months of history available; otherwise half the available history
- **AI bot conversations (unescalated) are excluded** from staffing demand calculation
- First enable: data can take **up to 24 hours** to appear
- Global configuration: Required Service Level (%), Target Answer Time, Shrinkage (%), Concurrency
- **Channel overrides** allow different concurrency/SLA settings per channel (e.g. voice concurrency = 1, chat concurrency = 3)
- Holiday calendar integration available for seasonality modelling
- Read privilege on `msdyn_dataanalyticsreport_forecast` table required for non-admin users to view the report

## When to use / skip
Enable on any standalone deployment where the client needs staffing forecasts. Enable early — the model improves with accumulated history, so enabling at UAT means usable data is available at go-live.

## Configuration decisions
- **Concurrency per channel** — most critical accuracy lever; voice = 1, chat/messaging = 2–5 depending on client practice; validate with operations team before configuring
- **Shrinkage %** — most clients underestimate; typical range is 20–35%; underconfiguring understates staffing need
- **Channel overrides** — required for any mixed-channel deployment; a single global concurrency value cannot serve both voice and digital channels accurately
- **Historical data start date** — defaults to earliest records up to 2 years back; adjust if there is a known data quality issue in older records

## Gotchas
- **Concurrency misconfiguration is the single biggest accuracy problem.** If chat reps handle 3 conversations simultaneously but concurrency is set to 1, staffing demand will be 3x overstated.
- **24-hour delay on first enable is commonly unexpected.** Set this expectation before any scheduled feature review.
- **This is a separate surface from WFM forecasting** (`feature-wfm-forecasting-capacity.md`). Both exist. This AI report includes SLA/concurrency modelling; WFM forecasting integrates with capacity plans and scenario modelling.

---

*Source last updated: 2025-06-30 | Review when: Forecast available in embedded deployment, or forecast range limits expand*
