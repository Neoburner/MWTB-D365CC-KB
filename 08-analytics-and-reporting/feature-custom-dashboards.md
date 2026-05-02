# Custom Dashboards & Report Extensibility

**Category:** Analytics & Reporting
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/customize-reports

## What it does
D365 Contact Center's standard analytics dashboards (Historical Analytics, Real-Time Analytics, Intraday Insights) cover the most common contact centre KPIs out of the box. When those don't meet the client's specific reporting requirements, D365 offers several extensibility paths: custom Power BI reports connected to Dataverse, custom model-driven app dashboards using Dataverse views, and embedded Power BI content within the CSW workspace. This doc covers the options, their trade-offs, and the design decisions that determine which path to use.

## Key facts
- **Dataverse views as dashboards:** Model-driven app dashboards can include Dataverse view components — table-based reports based on any entity and any filter. These are simple, low-maintenance, but limited to tabular/list presentation
- **Power BI connected to Dataverse:** Power BI Desktop connects to Dataverse via the Dataverse connector; reports built here can be published to Power BI Service and shared with users who have Power BI Pro/PPU licences
- **Embedded Power BI in CSW:** Published Power BI report pages can be embedded as application tabs in session templates, making them accessible to agents and supervisors from within the workspace without leaving D365
- **Azure Synapse Link / Data Lake export** (see `feature-data-lake-export.md`): for clients who need raw data for advanced analytics, the export option feeds Dataverse data to external analytical platforms
- Standard dashboards are read-only — columns, filters, and layout are fixed; the only way to change them is to build a parallel custom report
- Custom reports have full flexibility but introduce a maintenance obligation — schema changes in D365 can break Power BI reports if table/column names change
- Row-level security in Power BI: supervisors should only see data for their own queues — this requires row-level security configuration in the Power BI report that mirrors D365 security role queue membership

## When to use / skip
Custom dashboards are justified when: the standard reports don't show a KPI the business actively monitors; the presentation format is wrong for the audience (e.g., executives need a one-page summary, not the standard operational report); or data from outside D365 needs to be combined with D365 data in a single view.

Don't build custom dashboards because the standard ones look too technical or the client wants their logo on a report. Custom reports have ongoing maintenance costs — build them only when the standard product genuinely can't meet the need.

## Configuration decisions
- Identify the specific reporting gaps against the standard dashboards before designing any custom report — fill only actual gaps, not cosmetic preferences
- Choose the right extension mechanism for each gap:
  - Aggregate KPI not in standard reports → Power BI connected to Dataverse
  - Tabular list of records with specific filters → Dataverse view dashboard
  - Real-time queue/agent data → use standard Real-Time Analytics (Power BI is not real-time)
  - Data combined from D365 and external systems → Power BI with multiple connectors or Synapse Link
- For Power BI reports embedded in CSW: each user viewing an embedded report needs a Power BI Pro or Premium Per User licence — include this in the licence count
- Assign a named owner for custom reports who is responsible for testing them after each D365 release wave
- Document the report data model — which Dataverse tables and fields each report uses — so that maintenance can be done by someone other than the original builder

## Gotchas
- Power BI is not real-time. Even with DirectQuery mode (which queries Dataverse live), there's a noticeable latency and query load. For live operational monitoring, use the native Real-Time Analytics dashboards. Power BI is for historical, trend, and aggregate analysis.
- Schema changes in D365 break Power BI reports silently — the report continues to load but shows missing data or errors for any field that was renamed, removed, or moved to a different table. Test custom reports after each D365 major release.
- Power BI row-level security is separate from D365 security roles. A supervisor whose D365 role restricts them to certain queues can access all queue data in a Power BI report unless the Power BI report has its own RLS configured to match. This is a common security gap in embedded report deployments.
- Custom model-driven app dashboards (Dataverse views) require the user to have appropriate security roles for the entities displayed — just like any D365 form. If a view shows conversation records, the user needs read access to the conversation entity.
- Embedded Power BI in CSW application tabs requires the report to be in a Power BI workspace that the embedding configuration has access to. Changes to the Power BI workspace (report moved, workspace permissions changed) can break the embedded view without any D365 change.

## Consultant notes

- The "we want custom reports" conversation should start with a thorough demo of the standard analytics. Most clients have never seen the full extent of what's in Omnichannel Historical Analytics, Copilot Analytics, Topics Analytics, and the real-time dashboards. Running through all the standard reports first almost always reduces the custom report backlog significantly — not because the client was wrong to ask, but because they didn't know what already existed.
- Power BI licence cost is routinely missed in project budgets. If the plan involves embedding Power BI in CSW or distributing reports to supervisors via Power BI Service, each viewer needs a Pro or PPU licence. For a contact centre with 30 supervisors, this is real cost. Include it in the solution costing conversation early.
- Report maintenance ownership is the question that determines whether custom reports are a sustainable investment. A Power BI report built by an external consultant and handed over to a client with no Power BI skills will degrade silently over time. Either build in training, assign an internal Power BI owner, or scope the ongoing maintenance as part of a managed service.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds configurable columns or custom KPI tiles to the native dashboards*
