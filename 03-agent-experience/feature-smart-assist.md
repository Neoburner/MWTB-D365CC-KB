# Smart Assist

**Category:** Agent Experience
**Applies To:** Standalone (Contact Center); Customer Service
**Source:** [learn.microsoft.com/.../smart-assist](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/smart-assist)

> ⚠️ **AI-suggested similar cases and knowledge articles deprecated** as of June 2, 2025. Custom bot-based smart assist remains supported.

## What it does
Displays real-time recommendations to reps in the Productivity Pane during conversations. Recommendations come from a custom smart assist agent (Azure Bot Service) wired into the workstream. The native AI suggestion engine (similar cases/knowledge articles) is deprecated.

## Key facts
- **Native AI suggestions (similar cases and KB articles) are deprecated**: no longer available; transition to Copilot's Ask a Question feature or a custom smart assist agent
- Custom smart assist agents must use **Azure Bot Service**: Copilot Studio agents are NOT supported for smart assist
- Recommendations only appear **after the rep has sent a message**: not shown on conversation acceptance
- Multiple smart assist agents can be added to a single workstream
- Available across all channels **except Entity Records routing** (live chat, voice, SMS, Facebook, custom messaging)
- End conversation command is not supported in smart assist agents
- Setup requires: create an application user with the bot's app ID → assign Omnichannel agent role → add to workstream Advanced settings → Smart assist bots

## When to use / skip
Use when there is a custom recommendation engine or external knowledge system to surface in-conversation. With native AI suggestions deprecated, this feature is primarily relevant for clients with existing Azure Bot Service investments or complex custom recommendation logic. For standard KB article suggestions, Copilot's Ask a Question is now the better path.

## Configuration decisions
- Custom bot vs Copilot: for most new deployments, Copilot Ask a Question (see `feature-copilot-help-pane.md`) replaces what smart assist's native AI did; smart assist custom bots are for specialised recommendation use cases beyond KB search

## Gotchas
- **Don't plan around the deprecated native AI suggestions.** Any client reference to "smart assist suggesting knowledge articles" is functionality that no longer exists. The replacement is Copilot's Ask a Question.
- **Copilot Studio agents cannot be used here.** Smart assist is Azure Bot Service only. Non-obvious constraint that surprises teams standardised on Copilot Studio.

## Consultant notes

- The deprecation of native AI suggestions needs to be in every discovery conversation where smart assist is mentioned. Clients referencing "smart suggest," "article suggestions," or "similar cases" are describing functionality that no longer exists. The replacement path is Copilot's Ask a Question: redirect them there.
- Azure Bot Service only (Copilot Studio not supported) is non-obvious for teams that have standardised on Copilot Studio for everything else. Raise it before anyone starts building: discovering it mid-sprint when the bot is already half-built is not a good day.
- For most new deployments the answer to "do we need smart assist?" is now "use Copilot instead." Reserve custom smart assist bots for clients with specialist recommendation engines or external knowledge systems that have no Copilot integration.

---

*Source last updated: 2026-04-15 | Review when: Copilot Studio support added for smart assist, or feature further deprecated*
