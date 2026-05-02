# Omnichannel REST API

**Category:** Integration & Extensibility
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/develop/omnichannel-api

## What it does
The Omnichannel REST API (and the Dataverse Web API as it applies to contact centre entities) provides programmatic access to D365 Contact Center data and operations for external systems and custom integrations. This covers reading conversation data, queue status, agent availability, and session records; triggering actions like routing a conversation or updating a conversation status; and webhook-style integration using Azure Event Grid (see `feature-azure-event-grid.md`). The API is the access layer for any integration that needs to go beyond what Power Automate connectors and prebuilt connectors support.

## Key facts
- D365 Contact Center data is stored in Dataverse: the Dataverse Web API (OData v4) is the primary programmatic interface for CRUD operations on contact centre entities
- Key entities accessible via Dataverse Web API: `msdyn_ocliveworkitem` (conversations), `msdyn_ocsession` (agent sessions), `msdyn_ocliveworkitemparticipant` (participants), `queue`, `incident` (cases), `systemuser`
- Authentication: OAuth 2.0 with Azure AD: client credentials flow (app registration) or delegated flow (on behalf of a user); app registrations must be granted appropriate Dataverse scopes
- Real-time event access: use Azure Event Grid integration (see `feature-azure-event-grid.md`) rather than polling the REST API for real-time events: polling is expensive and introduces latency
- Omnichannel-specific actions (trigger routing, update conversation status, send notification) are available via Dataverse custom API endpoints (`msdyn_*` actions): not all operations are standard CRUD
- API rate limits: Dataverse applies service protection limits: 6000 requests per 5-minute window per user/application; high-volume integrations should batch requests and handle 429 (rate limit) responses with retry logic
- The Omnichannel JavaScript SDK (`feature-omnichannel-javascript-sdk.md`) is the client-side equivalent for browser-based integrations; the REST API is for server-side integrations

## When to use / skip
Use the REST API for server-side integrations: external systems that need to read conversation data, trigger routing actions, or sync D365 contact centre records with external databases. Also use for custom reporting pipelines that need to extract data programmatically without using Azure Synapse Link.

Don't use the REST API for real-time event consumption, Azure Event Grid is more efficient for that. Don't use it for simple automation between D365 entities, Power Automate is faster to build and maintain.

## Configuration decisions
- Create a dedicated Azure AD app registration for each external system that needs API access: don't share app registrations between different integrations; separate registrations allow separate monitoring, separate credential rotation, and separate permission scopes
- Grant minimum required Dataverse scopes to each app registration: use principle of least privilege; an integration that only reads conversation records should not have write access
- Implement OAuth client credentials flow for server-to-server integration; implement delegated flow only when user-context access is required
- Build retry logic with exponential backoff for all API calls: Dataverse rate limiting (429 responses) is expected at high call volumes; integrations without retry logic will fail under load
- Log all API calls from external systems for audit and troubleshooting: include request ID in logs; Dataverse includes correlation headers in API responses for cross-system tracing

## Gotchas
- Dataverse service protection limits apply per user/application connection, not per request type. An integration that makes 100 calls per minute from a single service account will hit the rate limit: spread load across multiple service accounts or batch requests to stay within limits.
- Entity field names in Dataverse Web API use logical names, not display names. `msdyn_ocliveworkitem` is the logical entity name for the conversation entity; the agent-visible "Active Conversation" is the display name. Documentation and schema browsing are essential: don't guess field names.
- Dataverse Web API returns OData-formatted responses. Integrations must parse OData JSON correctly, including handling of navigation properties (linked record expansion), `@odata.nextLink` pagination for large result sets, and metadata references.
- Custom actions (`msdyn_*` endpoints for omnichannel-specific operations) are not always well-documented: some are internal platform operations not intended for external use. Test custom actions in a non-production environment and monitor for behavioural changes in D365 release waves.
- API access to conversation data is subject to the accessing application's Dataverse security role. An app registration with no security role assigned gets no data. Assign the minimum security role required for the integration's specific data access needs.

## Consultant notes

- Every external system that needs D365 data should have its own app registration with purpose-specific permissions. "We'll use the admin account for all integrations" is a support nightmare waiting to happen: the admin account gets rotated, all integrations break simultaneously, and troubleshooting which integration broke which query is painful. One app registration per integration system is the right architecture.
- Rate limit handling is non-negotiable for any high-volume API integration. A developer who builds an integration without retry logic will discover the failure mode in production, not in UAT with 10 test conversations. Include rate limit and retry testing in the integration test plan.
- API-based reporting extracts (custom pipelines that poll Dataverse for conversation data) tend to grow in scope over time. What starts as "pull yesterday's conversations for reporting" becomes "pull all historical data for analytics," which runs into Dataverse query time limits and large result set pagination. If the reporting requirement is substantial, Azure Synapse Link (see `feature-data-lake-export.md`) is the right architecture: not a polling REST API integration.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft changes Dataverse rate limit policies or adds new Omnichannel-specific API actions*
