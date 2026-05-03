# Custom Reporting Variables for Historical Bot Dashboard

**Category:** Analytics and Reporting
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/use-custom-reporting-variables-historical-bot-dashboard

## What it does
Lets you segment KPIs in the Omnichannel Historical Bot dashboard using custom variables defined in Copilot Studio — things like line of business, department, campaign type, or region. Also adds exit-pattern analysis at the question-node level so you can see where customers drop out of bot conversations and how that affects deflection and escalation rates.

## Key facts
- GA: February 9, 2026
- Variables are defined in Copilot Studio and configured in Copilot Service admin center > Insights > Omnichannel Historical dashboard
- Requires enabling the "Add advanced historical analytics for bot" checkbox in admin center
- Segmentation works across KPIs: deflection rate, escalation rate, containment
- Variables are captured during voice or chat interactions, prior to escalation or containment
- No engineering effort required to add new dimensions — configured through the admin UI
- Question-node exit analysis shows where customers abandon or are routed out at specific prompts

## When to use / skip
Use this when the client has multiple lines of business or campaigns running through a shared bot and needs to slice bot performance by business segment rather than just by channel or workstream. Also useful for any client doing systematic bot optimisation — exit-pattern data at the question level is what you actually need to identify broken flows. Skip it if the bot is simple, low-traffic, or the client doesn't have the bandwidth to act on granular bot analytics.

## Configuration decisions
- Which business dimensions to expose as reporting variables (line of business, region, campaign, etc.)
- Where in the conversation flow to set variable values — before branching points or at escalation
- Whether to use the built-in dashboard customisation or export to Power BI for richer reporting
- Who owns the Copilot Studio bot vs. who owns the analytics configuration — they may be different teams

## Gotchas
- Variables must be set in the Copilot Studio conversation flow before the escalation or containment point — if the variable is set after escalation it won't be captured in the bot dashboard
- The "Add advanced historical analytics for bot" checkbox must be enabled in admin center — it's off by default and easy to miss during setup
- Historical data only: these variables apply going forward from when they're configured, there's no retroactive population of historical records
- If the client renames or removes a variable in Copilot Studio, the dashboard will have gaps; treat variable names as a data contract

## Consultant notes

- This is the feature that finally lets you answer "how is the bot performing for our enterprise clients vs. SMB?" — clients with segmented customer bases will find this genuinely useful.
- The setup dependency chain is easy to get wrong: variable defined in Copilot Studio → bot published → checkbox enabled in admin center → dashboard customised. If the client does these out of order, variables won't appear in the reporting UI and the debugging trail is non-obvious.
- Question-node exit analysis is the more technically interesting capability here. Pull the client into a review of their top exit nodes early in the project — it often reveals conversation design issues that should be fixed before go-live, not after.
- Data volume matters: if the bot handles high traffic across many branches, the exit-pattern view can be noisy. Set expectations that this requires interpretation, not just dashboarding.

---

*Worth revisiting after next release wave to check if real-time bot analytics gains similar segmentation support*
