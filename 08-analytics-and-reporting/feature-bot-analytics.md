# Bot / Self-Service Analytics

**Category:** Analytics & Reporting  
**Applies To:** Both  
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/self-service-analytics

## What it does

Analytics reporting on automated interactions and bot-handled conversations within D365 Contact Center. Tracks bot performance independently and at the topic level, showing containment rates, escalation patterns, and effectiveness across different customer intents.

## Key facts

- Key metrics: containment rate, escalation rate, session volume, topic-level resolution, and average handle time
- Prerequisite: Copilot Studio bot, Azure Bot Service, or connected custom bot must be configured
- Bot sessions are linked to omnichannel conversation records automatically
- Allows comparison of bot performance across different intents and topics
- Shows escalation patterns and identifies which interactions bots handle versus agents
- Data aggregates into omnichannel analytics dashboards automatically

## When to use / skip

Deploy Bot Analytics when you have active bot implementations (Copilot Studio, Azure Bot Service, or custom bots) integrated with your contact center. Use to measure bot effectiveness, identify topics that bots struggle with, and optimize bot training. Skip if you have no bot implementation or use legacy automation without conversation linkage.

## Configuration decisions

- Ensure bot is connected via Copilot Studio or Azure Bot Service with conversation handoff enabled
- Verify bot sessions are logging as omnichannel conversations in conversation activity table
- Configure bot settings to capture escalation and containment signals explicitly
- Enable analytics for bot channels in omnichannel settings
- Map bot topics to customer intent categories for granular reporting
- Configure analytics roles to allow analysts and managers access to bot reports

## Gotchas

- Bot analytics only appear if bot is properly connected and conversations are linked to omnichannel
- Escalation signals must be explicitly configured in bot; not all handoffs auto-populate as escalations
- Topic-level analytics depend on bot correctly tagging conversations; poor classification reduces insight value
- Bot performance metrics may lag 1-2 hours behind live bot activity
- Disconnecting a bot removes analytics access to that bot's historical data; archive reports before decommissioning
- Custom bots may require additional instrumentation to feed escalation and resolution signals
- Bot analytics must be enabled separately from voice analytics if both are deployed

---

*Source last updated: 2026-04-30 | Review when: Bot implementation changes or new topics are added*
