# Microsoft Teams Channel (Internal Support)

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-microsoft-teams-channel

## What it does
Deploys a Contact Center bot as a Teams app for internal employees to request support. Agents handle tickets in Contact Center. Teams is internal-facing—IT helpdesk, HR, internal support workflows.

## Key facts
- Requires Teams tenant integration with D365 Contact Center (one-time setup per tenant)
- Bot is deployed as a Teams app; employees add it to their Teams workspace to initiate support requests
- Conversations start in Teams and are routed to D365 Contact Center queues as records
- Agent responses appear in Teams as messages; full conversation threading maintained
- Supports both 1-on-1 Teams chats and group chats (channel @mentions)
- Employee identity is pulled from their Azure AD account; no guest or external users (unless federated with external AD)
- Bot manifest (app configuration) can be customized to show custom greetings, suggested actions, or quick-reply buttons
- Teams app auto-updates when D365 Contact Center bot is updated; no manual version management required
- Requires Teams app admin approval in Microsoft 365 admin center; can be org-wide or selected users only
- Works with Teams for desktop, web, and mobile clients

## When to use / skip
Use Teams for internal IT support, employee self-service (benefits, policies, onboarding), or peer support where employees are already in Teams. Reduces friction vs email or tickets. Skip if your user base is mostly external customers, you lack Teams infrastructure, or internal volume is too low to justify the overhead.

## Configuration decisions
- Which D365 Contact Center bot (Copilot Studio or custom) will handle Teams conversations?
- Will Teams support requests route to a dedicated queue or merge with other incoming requests?
- Which organizational units or departments will have access to the Teams support bot?
- Should Teams conversations trigger escalation workflows (e.g., after 2 hours unresponded)?
- Will you show suggested quick replies or custom actions in the Teams app?
- How will you handle Teams conversations that span multiple days? Auto-close or manual?

## Gotchas
- Bot presence doesn't reflect D365 agent availability; employees may send requests when no agents are online. Design for off-hours bot handling.
- Teams conversation history is visible to all participants; sensitive HR or personal data shouldn't be discussed there. Private chat is better.
- If an employee leaves and their account disables, their ongoing conversations orphan; there's no auto-reassignment.
- Bot rate limiting kicks in on rapid messages; Teams may throttle the response and latency climbs unpredictably.
- Teams file sharing and link previews don't forward to D365; agents only see text, not attachments or embedded media.
- Teams channels (group chats) can have many participants; mention culture (@support bot) must be documented or requests get missed.
- Teams notifications get noisy if support volume is high; agent experience degrades with too many alerts.

---

*Source last updated: 2026-04-30 | Worth checking again if Teams app manifest changes or Azure AD integration updates*
