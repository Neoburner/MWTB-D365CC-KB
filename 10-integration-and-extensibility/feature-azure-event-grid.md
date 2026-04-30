# Azure Event Grid Integration

**Category:** Integration
**Applies To:** Standalone
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-azure-communication-services-location

## What it does
Azure Event Grid enables subscription to D365 Contact Center events (conversation started, agent assigned, conversation ended, recording ready, transcription complete) and triggers downstream integrations in near real-time. Events are published to an Event Grid topic, from which custom subscribers (Logic Apps, Azure Functions, Webhooks) can consume them. The ACS Event Grid integration specifically handles voice call lifecycle and recording/transcription readiness notifications, allowing you to trigger CRM sync, analytics pipelines, or workforce management updates without polling.

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
Use Event Grid when you need to trigger side-effect integrations (CRM updates, analytics pipelines, third-party WFM sync) based on conversation lifecycle. Skip Event Grid if you only need to log conversations to Dataverse—D365 Contact Center already records conversations natively. Use Event Grid for high-volume, asynchronous integrations (e.g., 10K conversations/day); for low-volume integrations, a simple webhook may suffice.

## Configuration decisions
- Create an Azure Event Grid topic in the same subscription and region as your ACS resource
- Define event subscriptions in Event Grid: filter by event type (e.g., only RecordingReady events)
- Use Azure Functions or Logic Apps as the endpoint; implement idempotence (check if event already processed before updating CRM)
- Map Event Grid conversation ID to Dataverse conversation record via REST API lookup before processing
- Log all Event Grid events to Application Insights or Azure Monitor for troubleshooting
- Set up deadletter queues for failed events; implement manual retry logic or escalation

## Gotchas
- Event Grid events do NOT include the full conversation transcript; they only include metadata (ID, start time, duration, outcome)
- To get the transcript after RecordingReady, you must query the Dataverse conversation record; the event does not include transcript content
- Event Grid is eventually consistent; if you update CRM immediately upon ConversationEnded, the transcript may not be available yet in Dataverse
- Event Grid topic is tied to one ACS resource; if you have multiple ACS resources, you need separate Event Grid topics
- Failed Event Grid deliveries are retried with exponential backoff; a broken endpoint can be retried for up to 24 hours
- Event Grid requires network connectivity; if your Azure Function is behind a firewall, you must whitelist Event Grid IP ranges

---

*Source last updated: 2026-04-30 | Review when: Azure Event Grid releases new event types or Microsoft adds streaming transcription events*
