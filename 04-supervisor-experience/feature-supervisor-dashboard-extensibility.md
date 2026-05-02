# Supervisor Dashboard Extensibility (Custom Metrics)

**Category:** Supervisor Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/customize-supervisor-dashboard

## What it does
D365 Contact Center's real-time supervisor dashboards (Real-Time Analytics, Intraday Insights) support limited extensibility — supervisors or admins can add additional KPI cards, adjust visible columns in conversation grids, and embed Power BI reports within the supervisor workspace. Custom metrics that don't exist in the standard dashboards require either Power BI embedded views or custom model-driven app forms that surface Dataverse data. This isn't a single feature so much as the set of options available when the standard dashboards don't show what the client needs.

## Key facts
- Out-of-the-box supervisor dashboards (Real-Time Analytics, Intraday Insights, Ongoing Conversations) are largely fixed — column order and visible fields have limited configuration
- Custom metric tiles can be added to the supervisor home page by embedding Power BI report pages or custom PCF (Power Apps Component Framework) controls
- Power BI reports connected to Dataverse can surface custom metrics not in the standard dashboards — average handle time per skill, conversation volume by custom field, NPS correlation with queue, etc.
- The Real-Time Analytics dashboard can be extended with custom KPI cards if a developer implements a PCF control — this is a code investment, not a configuration task
- Dataverse views can be added as dashboard tiles for aggregate metrics on any entity
- Azure Data Lake export (see `feature-data-lake-export.md`) enables advanced analytics in external tools (Synapse, Databricks) for clients who need metrics beyond what Power BI can surface from Dataverse
- Microsoft periodically adds new metrics to standard dashboards — verify whether a required metric has been added natively before building custom

## When to use / skip
Pursue custom dashboard extensions when the standard dashboards genuinely don't show something the client's operations team needs for daily management — not because the client wants a bespoke look and feel. Every customisation adds a maintenance obligation.

The most common valid use cases: custom KPIs from external data sources combined with D365 data, executive summary dashboards, SLA compliance visualisations with custom thresholds, or channel-specific metrics the standard dashboards don't aggregate correctly.

## Configuration decisions
- Identify the specific metric gaps before designing any custom dashboard — get the ops team to list the KPIs they need and verify each against the standard dashboards; fill only actual gaps
- For Power BI extension: set up a Dataverse connector in Power BI, build the report on the correct entities (conversation, queue, agent, session), and embed via workspace app tab template or Power BI dashboard embedding in D365
- For PCF custom controls: engage a developer; PCF controls require TypeScript and React development against the Power Apps Component Framework — this is not a configurator task
- Define who maintains custom Power BI reports post-go-live — custom reports need updating when schema changes, new queues are added, or metrics definitions change

## Gotchas
- Power BI embedded in D365 requires a Power BI Pro or Premium Per User licence for every user viewing embedded reports. If supervisors don't have this licence, embedded reports won't load. This is a licensing item that's easy to miss in the overall licence count.
- Custom Power BI reports have a data freshness lag determined by the dataset refresh schedule — not real-time. For live operational metrics, Power BI is the wrong tool; use the native real-time dashboards. Power BI is for trend analysis and aggregated historical views.
- PCF controls in model-driven apps interact with the D365 form framework. A poorly implemented PCF control can slow down the entire supervisor form or cause rendering issues on certain browsers. Any PCF development should include performance testing in the client's target browser.
- Custom dashboard components are not upgrade-safe — each D365 release wave can change the form structure that the custom component sits in, requiring re-testing and sometimes re-deployment.
- Dataverse data accessed via Power BI is subject to the viewing user's security role. If a supervisor's security role doesn't include access to certain queue or agent records, those records won't appear in their Power BI view even if the report is built to show them.

## Consultant notes

- The most productive conversation to have with clients who ask for "custom dashboards" is to first show them every standard dashboard and what it contains. Most clients don't know the full extent of what's there out of the box, and often what they're asking for already exists. Reserve custom dashboard work for genuine gaps after that discovery exercise.
- Power BI is the right answer for historical and trend analysis; it's the wrong answer for live operational monitoring. Make this distinction explicit in the design phase. A supervisor who needs to see live queue depth cannot rely on a Power BI report that refreshes every hour. Standard dashboards for live; Power BI for post-hoc.
- The maintenance cost of custom dashboards is routinely underestimated. A Power BI report built against the current Dataverse schema works until Microsoft changes an entity, adds a required relationship, or the client adds new queues that the report doesn't handle. Assign a clear maintenance owner and include dashboard maintenance in the ongoing support scope. Without this, custom dashboards become stale silently.

---

*Source last updated: 2026-04-30 | Revisit when Microsoft adds configurable KPI tiles to the standard supervisor dashboards natively*
