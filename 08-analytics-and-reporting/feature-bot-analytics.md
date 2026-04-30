# Bot / Self-Service Analytics

**Category:** Analytics & Reporting  
**Applies To:** Both  
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/self-service-analytics

## What it does
Analytics for bot-handled conversations in Contact Center. Tracks containment, escalation patterns, and bot performance by topic without needing manual categorization.

## Key facts

- Key metrics: containment rate, escalation rate, session volume, topic-level resolution, and average handle time
- Prerequisite: Copilot Studio bot, Azure Bot Service, or connected custom bot must be configured
- Bot sessions are linked to omnichannel conversation records automatically
- Allows comparison of bot performance across different intents and topics
- Shows escalation patterns and identifies which interactions bots handle versus agents
- Data aggregates into omnichannel analytics dashboards automatically

## When to use / skip
Turn this on if you have active bots (Copilot Studio, Azure Bot Service, or custom) in your contact centre. Use it to measure bot effectiveness and find weak topics. Skip if you have no bots or legacy automation without conversation linkage.

## Configuration decisions
- Verify bot is connected with conversation handoff enabled
- Confirm bot sessions log as omnichannel conversations
- Configure bot settings to capture escalation and containment signals
- Enable analytics for bot channels in omnichannel settings
- Map bot topics to customer intent categories if you need granular reporting
- Grant analytics and manager roles access to bot reports

## Gotchas
- **Bot analytics only show if bot is properly connected.** Conversations must link to omnichannel.
- **Escalation signals need explicit config.** Not all handoffs auto-populate.
- **Topic analytics depend on bot tagging.** Bad classification = bad insights.
- **Bot metrics lag 1-2 hours.** Not live.
- **Disconnecting a bot kills historical access.** Archive reports before decommissioning.
- **Custom bots need instrumentation.** They may not auto-report escalation and resolution signals.
- **Voice and bot analytics are separate toggles.** Enable both if you need both.

---

*Source last updated: 2026-04-30 | Check this if: Bot implementation changes or new topics emerge*
