# WFM AI Credit Estimation

**Category:** Workforce Engagement Management  
**Applies To:** Standalone / Embedded  
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/use/workforce-management-credit-estimation

## What it does

Translates WFM forecast scenarios into projected AI credit consumption estimates for supported AI agents. Workforce planners select AI agents, specify what percentage of forecasted volume each agent will handle, and get projected monthly credit usage — total, average, and peak. Helps with AI adoption modelling and budget planning before go-live.

## Key facts

- Requires WFM to be set up and a forecast scenario to be configured and run first
- Supported agents for estimation: **Quality Evaluation Agent**, **Case Management Agent**, **Customer Intent Agent**
- Output metrics: total credit consumption, average monthly consumption, maximum monthly consumption for the forecast period
- Estimates are projections only — actual consumption varies with conversation complexity, volume fluctuations, and runtime conditions
- Does not represent a billing commitment; Microsoft explicitly cautions against treating these as billing guarantees
- Accessible from the forecast scenario output view in **Copilot Service Workspace > Workforce Management > Forecasting**

## When to use / skip

Use this in any pre-sales or solution design conversation where AI agents are part of the scope and the client wants to understand credit costs before committing. Particularly valuable when a client is evaluating which AI agents to enable and at what coverage rate — the estimator lets you model different scenarios (e.g., "what if Quality Evaluation Agent handles 50% vs. 80% of conversations?"). Skip it if the client hasn't got WFM configured — the tool depends on forecast scenarios and won't be usable without them.

## Configuration decisions

- Which AI agents to include in the estimate — don't include agents the client hasn't decided to purchase or enable
- Coverage percentage per agent: this is the key modelling variable. Get input from the client on their intended AI coverage targets, then model high/medium/low scenarios
- Forecast horizon: longer horizons give better peak consumption data but are less accurate; align with the client's budget planning cycle
- How to use the output: estimates are for internal planning conversations, not for quoting to the client as a billing figure

## Gotchas

- Estimates are based on forecasted volume, not actuals — if the forecast is inaccurate, the credit estimate will be inaccurate. Don't quote these numbers in commercial conversations without this caveat
- The three supported agents (Quality Evaluation, Case Management, Customer Intent) don't cover every AI feature — real-time voice agents, Copilot for agents, and other AI capabilities are not included in the estimator. The total credit picture is larger than what this tool shows
- "Maximum monthly consumption" can look alarming if forecast peaks are high. Make sure the client understands this is a worst-case monthly scenario, not a typical figure
- Credit consumption per AI agent interaction is not publicly documented in detail — Microsoft provides the estimation tool precisely because the per-unit rate varies. You can't back-calculate from these numbers to a per-conversation credit cost with confidence

## Consultant notes

- This is a useful tool for bridging the gap between "we want AI agents" and "what will it cost us in credits" — a conversation that typically happens awkwardly in commercial negotiations. Having a structured estimate from the WFM tool is more defensible than a back-of-envelope figure
- The dependency on WFM forecasting means clients who aren't yet using WFM can't access the estimator. If credit planning is a blocker in the sales cycle, this is an argument for implementing WFM sooner
- In practice, the estimate is most useful for demonstrating relative cost differences between scenarios (e.g., 50% AI coverage vs. 90%) rather than absolute credit numbers. Frame it that way when presenting to clients
- Validate the estimates against actual consumption once the client has been live for a few months — this builds credibility for future planning cycles and helps refine the coverage percentage assumptions

---

*Validate estimates against actuals after first 60–90 days of live operation*
