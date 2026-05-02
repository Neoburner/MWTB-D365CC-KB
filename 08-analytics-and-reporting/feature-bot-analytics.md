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

## Consultant notes

- Containment rate is the headline metric every client with a bot wants to report, and this dashboard is where it comes from. That makes the configuration accuracy critical — if escalation signals aren't explicitly configured, the containment figure is understated, which either flatters the bot unfairly or masks a performance problem depending on which direction the error goes. Verify the escalation signal configuration with a test conversation before treating the containment rate as reliable.
- Custom bots are the high-risk case here. Copilot Studio agents and Azure Bot Service bots have relatively predictable instrumentation behaviour. Custom bots built on third-party frameworks or legacy platforms often don't emit the right signals without additional development. Confirm instrumentation requirements with the bot development team early — don't assume the analytics will just work.
- Archive the bot analytics reports before decommissioning any bot. Clients who retire a Copilot Studio agent mid-project to rebuild it lose historical containment and escalation data permanently. If historical performance data matters for the business case, pull and save the relevant reports before disconnecting.

---

*Source last updated: 2026-04-30 | Check this if: Bot implementation changes or new topics emerge*
