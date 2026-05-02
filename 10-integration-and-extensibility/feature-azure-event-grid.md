# Azure Event Grid Integration

**Category:** Integration
**Applies To:** Standalone
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-azure-communication-services-location

## What it does
Subscribe to D365 Contact Center events (conversation started, agent assigned, ended, recording ready, transcription complete) via Azure Event Grid. Route to Logic Apps, Azure Functions, or webhooks to trigger CRM sync, analytics, or workforce management without polling.

## Key facts
- D365 Contact Center publishes events to Azure Event Grid; your subscription filters and routes events to handlers
- Event types: ConversationStarted, AgentAssigned, ConversationEnded, RecordingReady, TranscriptionReady, SentimentAnalyzed
- ACS Event Grid setup requires an Event Grid topic in the same Azure subscription as your ACS resource
- Event Grid guarantees at-least-once delivery; subscribers must be idempotent (no duplicate processing)
- Event Grid events include conversation ID, agent ID, customer phone, duration, and outcome; additional context must be queried via Dataverse API
- Event Grid supports multiple subscribers (fanout); one conversation-ended event can trigger case creation, analytics update, and WFM sync in parallel
- Event latency is typically 1-5 seconds; not suitable for real-time call steering (use webhook in IVR for that)
- Event Grid requires explicit configuration of the topic and subscription; there is no default Event Grid integration

## When to use / skip
Use for side-effect integrations (CRM updates, analytics, WFM sync) based on conversation lifecycle. Skip if you only need conversation logging — D365 already records them. Use for high-volume async work (10K conversations/day); low-volume integrations may be fine with a simple webhook.

## Configuration decisions
- Create an Azure Event Grid topic in the same subscription and region as your ACS resource
- Define event subscriptions in Event Grid: filter by event type (e.g., only RecordingReady events)
- Use Azure Functions or Logic Apps as the endpoint; implement idempotence (check if event already processed before updating CRM)
- Map Event Grid conversation ID to Dataverse conversation record via REST API lookup before processing
- Log all Event Grid events to Application Insights or Azure Monitor for troubleshooting
- Set up deadletter queues for failed events; implement manual retry logic or escalation

## Gotchas
- Events contain metadata only — no transcript. Query Dataverse after RecordingReady for actual content.
- Event Grid is eventually consistent — transcripts may not be available immediately on ConversationEnded.
- One topic per ACS resource. Multiple ACS = multiple topics.
- Failed deliveries retry for 24 hours with exponential backoff. Broken endpoints keep retrying.
- Network connectivity required — whitelist Event Grid IP ranges if your Function is firewalled.

## Consultant notes

- Event Grid is the right integration pattern when the client needs to trigger external systems based on conversation lifecycle events at scale — CRM sync, analytics pipelines, WFM feeds. The at-least-once delivery guarantee means downstream handlers must be idempotent, which is a development requirement that needs to be in scope. If the dev team doesn't account for duplicate events, the integration will produce duplicate CRM updates or double-counted analytics at some point.
- The eventually consistent caveat on transcripts is the one most likely to cause integration failures in production. A handler that triggers immediately on `ConversationEnded` and then queries Dataverse for the transcript will frequently get a null or incomplete result because transcript processing hasn't completed yet. Implement a short delay or a `TranscriptionReady` event subscription if the handler needs transcript content.
- The dead letter queue setup is worth the extra configuration time. Event Grid retries failed deliveries for 24 hours — if the downstream Azure Function is broken, you'll get 24 hours of retry noise and then silent event loss. Dead letter queues turn that into a diagnosable backlog rather than undetected data loss. Set them up from the start rather than adding them after the first incident.

---

*Source last updated: 2026-04-30 | Check this: Azure Event Grid releases new event types or Microsoft adds streaming transcription events*
