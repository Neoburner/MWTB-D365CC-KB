# Conversation Diagnostics

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/conversation-diagnostics

## What it does
Conversation Diagnostics is a per-conversation troubleshooting and visibility tool available to agents and supervisors during or after a conversation. It displays the routing path taken by a specific conversation, classification decisions made by the system, assignment events, queue transitions, and any errors or warnings encountered. This allows agents and supervisors to understand *why* a conversation was routed to them and to identify blockages or system issues without leaving the conversation interface.

## Key facts
- Visible within the conversation timeline as a separate panel or sidebar; can be opened by agents or supervisors at any time during or after the interaction
- Shows complete routing flow: initial classification, queue assignment, skill matching, escalation decisions, and hand-offs
- Displays both successful and failed routing steps, including fallback logic if primary routing rules didn't apply
- Includes timestamps for each routing event, helping identify where conversations are delayed
- Requires no additional configuration; enabled by default in supported channels
- Data is conversation-specific; does not provide aggregate routing analytics (use Routing Diagnostics in Admin for that)
- Agents can share diagnostic information with supervisors or compliance teams for escalation documentation

## When to use / skip
Use Conversation Diagnostics when an agent is confused about why they received a conversation, when a conversation took an unexpected path, or when investigating quality issues related to skill mismatch. Supervisors use it to coach agents on routing logic or to troubleshoot why customers were escalated multiple times. Skip it if your routing is simple (single queue, no skills), the output will be minimal and add no value. Do not use it as a performance metric tool; it is not designed for bulk analytics.

## Configuration decisions
- **Visibility permissions:** Define which agent roles can view their own conversation diagnostics vs. supervisors viewing all
- **Diagnostic data retention:** Decide how long to retain routing event logs (30/90/180 days) for compliance and troubleshooting
- **Display detail level:** Choose whether to show simplified (essential steps only) or detailed (every rule evaluation) diagnostics to reduce cognitive load
- **Integration with escalation workflow:** Configure diagnostics to auto-populate escalation tickets with routing context when agents request escalation
- **Audit trail:** Determine if diagnostics access is logged for compliance purposes

## Gotchas
- Conversation Diagnostics shows what happened but not why the rules were written that way. Agents still need training on business logic behind routing.
- If a conversation was mis-classified by AI or intent detection, diagnostics show the classification that was applied, not the "correct" one. Investigation must look upstream.
- Diagnostics can expose business logic (routing rules, skill hierarchies) to agents, which some orgs consider sensitive. Consider role-based filtering.
- High detail level diagnostics can overwhelm agents in fast-paced channels. Simplify the view for chat/social agents.
- If a conversation is transferred multiple times, the diagnostics panel grows very long. UX optimization is needed for visibility.
- Diagnostics rely on clean data logging upstream. If routing events aren't logged correctly, diagnostics will be incomplete or inaccurate.

## Consultant notes

- The distinction between Conversation Diagnostics (per-conversation, agent/supervisor-facing) and Routing Diagnostics (aggregate, admin-facing) is worth clarifying in handover documentation. They're different tools for different audiences and the naming confuses people.
- Business logic exposure is worth thinking about in the security design. Detailed diagnostics surface routing rule names and skill hierarchy information: some clients consider that internal config to be sensitive, particularly in multi-BU or franchise deployments where teams shouldn't know each other's routing setup.
- Useful for coaching, not performance measurement. It's a troubleshooting and explanation tool. Don't let supervisors try to use it as a productivity metric: the data it surfaces isn't structured for that and the interpretations will be wrong.

---

*Source last updated: 2026-04-30 | Review when: Routing rule changes, after agent feedback on diagnostic clarity, or during troubleshooting investigations*
