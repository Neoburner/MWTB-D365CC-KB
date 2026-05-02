# Power BI Embedded Analytics

**Category:** Analytics & Reporting
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-customer-service-analytics-insights-csh

## What it does
Power BI Embedded Analytics in the D365 Contact Center context refers to embedding Power BI report pages directly within the Copilot Service Workspace, as application tab templates accessible from agent or supervisor sessions. This allows custom Power BI reports to appear inside CSW without agents or supervisors needing to navigate to a separate Power BI portal. The embedding uses the standard application tab template mechanism and the Power BI report viewer component available in model-driven Power Apps.

## Key facts
- Power BI report pages are embedded as iframes within application tab templates in CSW: configured in Copilot Service Admin Center under application tab templates
- Users viewing embedded Power BI reports need a Power BI Pro or Premium Per User (PPU) licence: the embedding mechanism doesn't bypass Power BI licensing
- Reports embedded this way use the viewer's D365 identity: the user's Azure AD account is used for Power BI authentication, so Power BI workspace permissions must be configured for all D365 users who will view the embedded report
- Row-level security in the Power BI report controls what data each viewer sees: D365 security roles do not automatically apply in the embedded Power BI view
- The report renders inside the application tab; it's effectively a web-based iframe with the Power BI report page loaded. Navigation within the Power BI report (page tabs, drill-throughs) works within the iframe
- Embedded reports refresh based on their Power BI dataset refresh schedule: they are not real-time unless DirectQuery mode is used
- The Power BI report must be published to a Power BI workspace (not just Power BI Desktop) before it can be embedded

## When to use / skip
Use when the client's reporting requirements are better served by a custom Power BI report than by the standard D365 analytics dashboards, AND when users need that report accessible from within CSW without switching applications. The within-CSW embedding is the value, it keeps supervisors or agents in their primary workspace.

If users are comfortable navigating to Power BI Service separately, the embedding overhead (application tab template configuration, licence verification, Power BI workspace setup) may not be worth it. Embedding adds value for users who work entirely within CSW and would find a separate browser tab disruptive.

## Configuration decisions
- Publish the Power BI report to a Power BI workspace and obtain the report URL or embed URL for the application tab template configuration
- Create an application tab template in Copilot Service Admin Center with type "Website" pointing to the Power BI report embed URL
- Assign Power BI Pro or PPU licences to all users who will view the embedded report: verify this in the licence count before configuration
- Configure Power BI workspace permissions for the D365 user group: at minimum, Viewer permission on the workspace
- Configure row-level security in the Power BI report if different supervisors should see different subsets of data: test this explicitly with multiple user accounts
- Add the application tab template to relevant session templates so the Power BI tab appears automatically for the right conversation types or user roles

## Gotchas
- Power BI Pro licence is per-user, billed monthly. A contact centre with 50 supervisors who need embedded Power BI access will have 50 Pro licences as an ongoing cost. Include this in the total cost of ownership calculation.
- The embed URL is workspace-specific and report-specific. If the Power BI report is moved to a different workspace or the workspace URL changes, the application tab template will break and show a blank iframe. Power BI workspace changes require a corresponding update to the application tab template.
- DirectQuery mode for near-real-time data in Power BI creates query load on Dataverse. For large environments with many concurrent Power BI viewers in DirectQuery mode, this can impact Dataverse API performance. Test under load before deploying widely.
- Power BI embedded in an iframe doesn't support all Power BI features: some navigation elements, export functions, and cross-report drill-through features may not work within the iframe context. Test the full report feature set inside the CSW iframe, not just in standalone Power BI.
- If the embedded report contains PII or sensitive conversation content, the iframe can potentially be inspected by browser developer tools. Not a standard security risk for normal use, but relevant for environments with strict data access controls.

## Consultant notes

- Power BI licensing is the most common go-live blocker for embedded analytics. Organisations often get to the point of embedding a report and discover that supervisors don't have Power BI Pro licences: or assume the D365 licence covers it. It doesn't. Confirm Power BI licensing status in the first week of the project if embedded Power BI is in scope.
- The row-level security configuration in Power BI needs to be tested with real user accounts, not admin accounts that bypass RLS. The most reliable way to validate that supervisors see only their own team's data is to log in as a supervisor-role test account and view the embedded report. Admin accounts often bypass RLS, creating false confidence in the security configuration.
- Embedded Power BI is a convenience feature, not a performance feature. If the same report is available in Power BI Service, the data it shows is identical whether it's embedded in CSW or opened in a browser tab. The value is workflow convenience: users stay in CSW. If users don't find value in staying in CSW (e.g., they always have multiple browser tabs open anyway), the embedding investment may not be justified.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft introduces native Power BI embedding that automatically applies D365 security roles to the Power BI report*
