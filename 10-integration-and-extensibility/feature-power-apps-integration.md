# Power Apps: Custom Apps & Embedded Experiences

**Category:** Integration & Extensibility
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/power-apps-integration

## What it does
Power Apps integration within D365 Contact Center covers two use cases: embedding custom canvas apps or model-driven app components within the CSW agent workspace (as application tabs or embedded controls), and building standalone Power Apps that surface contact centre data for non-agent users (supervisors, management, back-office teams). Power Apps is the low-code app building platform on Power Platform, and CSW's application tab template system supports loading Power Apps URLs as embedded tabs within agent sessions.

## Key facts
- **Canvas apps embedded in CSW:** a canvas app URL can be added as an application tab template, loading the app as a tab within the agent's conversation session. The app can receive conversation context (conversation ID, customer ID) via URL parameters
- **Model-driven app customisation:** CSW itself is a model-driven app; custom pages, forms, and components built in the Power Apps model-driven app editor are the primary way to extend the CSW interface
- **PCF (Power Apps Component Framework) controls:** custom React/TypeScript components that can be embedded in model-driven app forms: used for bespoke visualisations, integrations, or UI elements not available natively
- Power Apps canvas apps require a Power Apps Per App or Per User licence for any user who interacts with the app: verify this is included in the overall licence plan
- Context passing to embedded canvas apps is done via URL query parameters: the application tab template can pass dynamic values (conversation ID, customer account number) when the tab opens
- Canvas apps embedded in CSW can call Dataverse, external APIs (via Power Automate cloud flows or direct connectors), and SharePoint: making them a lightweight integration surface for external data
- Model-driven app customisation (forms, views, dashboards) does not require an additional Power Apps licence beyond the D365 licence

## When to use / skip
Embed canvas apps when an agent needs to interact with data or a workflow that lives outside D365 and can't be surfaced by a standard application tab (URL-based external site). Canvas apps add a rich interactive layer for external system integration that a plain iframe can't match.

Model-driven app customisation (forms, views, PCF controls) is appropriate for extending the CSW interface with custom fields, visualisations, or reordered layouts. This is the right approach for anything that is Dataverse-data-based.

Skip canvas app embedding for simple read-only external content, a plain website application tab is sufficient for that. Canvas apps add value when interactivity (data entry, data retrieval, state management) is needed.

## Configuration decisions
- Design context passing before building: decide which conversation and customer IDs need to be passed to the canvas app at session start, and how the canvas app will use them
- Canvas apps embedded in CSW must be published to a Power Apps environment that the CSW users can access: the app is not embedded in D365 itself, it's loaded from Power Apps
- Verify Power Apps licence coverage for all users who will interact with embedded canvas apps: model-driven app customisations use the D365 licence; canvas apps require a separate Power Apps entitlement
- For PCF controls: engage a developer; PCF development requires TypeScript and the Power Apps component framework CLI: it's not a configurator task
- Test canvas app load time inside the CSW iframe: canvas apps can have longer load times than native D365 forms; slow-loading embedded apps frustrate agents during conversation handling

## Gotchas
- Canvas apps embedded as application tabs don't inherit D365 security: the canvas app has its own data connection (via connectors) and access control. A canvas app that connects to Dataverse will use the Dataverse connector which respects D365 security roles; a canvas app that connects directly to SharePoint or an external API uses its own authentication.
- Context passing via URL parameters exposes conversation IDs and customer IDs in the browser address bar/history. For environments with strict data handling requirements, verify this is acceptable or implement a server-side context retrieval pattern instead.
- Canvas app sessions in CSW don't end when the conversation session ends: if an agent has a canvas app tab open and closes the conversation session, the canvas app may retain state. Ensure the canvas app handles session cleanup gracefully.
- Power Apps Per App licences are per-app, per-user, per-month. If the client has multiple canvas apps embedded in CSW, each app's users need a separate per-app licence. Power Apps Per User is more cost-effective once users need two or more apps.
- PCF controls in model-driven apps interact with the form rendering pipeline. A PCF control that causes rendering errors will break the entire form for affected users. Any PCF control should be tested in isolation and in combination with other form elements before go-live.

## Consultant notes

- Canvas app embedding in CSW is a pattern that works well but adds development and licence complexity. Before committing to a canvas app for an agent-facing use case, ask: could a plain website application tab (URL-based) or a model-driven app customisation achieve the same outcome? If the answer is yes, use the simpler approach. Canvas apps are the right tool when interactivity with external data is genuinely needed.
- Licence conversations for Power Apps are often separate from D365 licence conversations and catch clients mid-project. A canvas app embedded in CSW used by 100 agents at £5/app/user/month is £500/month in additional licence cost that wasn't in the original budget. Surface this early.
- The PCF development investment is worth it for bespoke visualisations or complex integrations that can't be built in configuration. It's not worth it for things like reordering form fields or changing label colours: those are model-driven app form editor tasks that anyone with admin access can do. Calibrate where custom development effort is actually needed.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft changes how canvas apps are licensed in D365 environments or if Power Apps embedding in CSW gains new context-passing capabilities*
