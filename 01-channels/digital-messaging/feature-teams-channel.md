# Microsoft Teams Channel (Internal Support)

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-microsoft-teams-channel

## What it does
Deploys a D365 Contact Center bot as a Teams app, enabling internal employees to request support via Teams chat while agents handle tickets in the Contact Center. Unlike external channels, Teams is positioned as an internal employee communication channel for IT helpdesk, HR inquiries, or internal support workflows.

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
Use Teams channel for internal IT support, employee self-service (benefits, policies, onboarding), or peer support workflows where employees are already in Teams. It reduces friction vs. email or ticket systems for internal users. Skip Teams if your user base is primarily external customers, or if you lack Teams infrastructure. Also skip if your internal support volume is very low (overhead of setup not justified).

## Configuration decisions
- Which D365 Contact Center bot (Copilot Studio or custom) will handle Teams conversations?
- Will Teams support requests route to a dedicated queue or merge with other incoming requests?
- Which organizational units or departments will have access to the Teams support bot?
- Should Teams conversations trigger escalation workflows (e.g., after 2 hours unresponded)?
- Will you show suggested quick replies or custom actions in the Teams app?
- How will you handle Teams conversations that span multiple days? Auto-close or manual?

## Gotchas
- Teams bot presence and availability don't reflect D365 agent availability; employees may send requests when no agents are online (design for off-hours handling via bot escalation)
- Teams conversation history is visible to all participants; don't discuss sensitive HR or personal data in Teams chats (private chat recommended)
- If an employee leaves the organization and their account is disabled, their ongoing Team conversations orphan; no automatic reassignment
- Bot rate limiting: if an employee sends many messages in rapid succession, Teams may throttle the bot response; latency increases unpredictably
- Teams file sharing and link previews are not forwarded to D365; agents only see message text, not attachments or embedded media
- Teams channels (group chats) can have many participants; mention culture (e.g., @support bot) must be documented or employees will miss their request
- Teams desktop notifications may be noisy if support request volume is high; agent experience can degrade with too many Teams alerts

---

*Source last updated: 2026-04-30 | Review when: Teams app manifest changes or Azure AD integration updates*
