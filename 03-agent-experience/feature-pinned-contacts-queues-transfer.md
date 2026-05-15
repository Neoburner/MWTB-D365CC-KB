# Pinned Contacts and Queues During Consult and Transfer

**Category:** Agent Experience  
**Applies To:** Standalone / Embedded  
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/use-pinned-contacts-queues-during-consult-transfer

## What it does

Lets agents pin frequently-used contacts and queues in the consult and transfer panel, so they don't have to search every time. Admins can push pinned items to agents centrally, or allow agents to manage their own pins. Items can be scoped by business unit.

## Key facts

- Configured in **Copilot Service Admin Center** > **Productivity** page
- Three configuration modes: admin-pushed pins (fixed for agents), agent-managed pins (agents pin their own), or a mix
- Business unit scoping: admins can show different pinned items to different BU groups
- GA: May 2026
- Applies to the consult/transfer panel within the communication panel — not a separate UI

## When to use / skip

Worth enabling on any implementation with recurring transfer patterns — especially where agents regularly consult the same specialist team or transfer to specific queues (e.g., escalation queues, retention teams, technical support). If your client's agents transfer to dozens of different destinations and there's no clear pattern, pinning adds configuration overhead without much payoff. Best suited to contact centres with defined routing tiers where agents know in advance who they'll be consulting.

## Configuration decisions

- Who controls the pins: admin-managed (consistent, lower agent overhead) vs. agent-managed (flexible, higher maintenance); or a combination where admins pin the essentials and agents add their own
- Business unit scoping: if the client has distinct agent groups handling different products or regions, BU-scoped pins keep the list relevant
- What to pin: determine the most commonly consulted contacts and escalation queues from transfer data before configuring — don't just pin everything and let agents decide
- Whether to enable agent self-pinning at all — some clients prefer to lock down the agent experience and push everything from admin

## Gotchas

- "Pinned items" are contacts and queues in the transfer/consult panel specifically — this doesn't affect the agent's contact list elsewhere in the workspace or any other UI surface
- If business units aren't configured in the implementation, BU-scoped pinning won't work; check the BU setup before designing around it
- Agent-managed pins don't persist across sessions if the agent's browser profile is cleared — worth flagging to agents as a known limitation
- The Productivity page in Admin Center has multiple settings; confirm you're in the right section before configuring, or you'll end up touching unrelated productivity features

## Consultant notes

- This is a low-effort, high-visibility quality-of-life win. Frame it as part of agent experience optimisation rather than a configuration project in its own right
- Transfer data analysis usually reveals that 80% of transfers go to the same 5–10 destinations. Pull that data before going into the admin configuration conversation — it makes the pinning strategy obvious and clients appreciate that you've done the homework
- Post-go-live, check whether agent-managed pins are actually being used if you've enabled them. Low adoption usually means the admin-pushed pins covered everything already, or agents found the pinning mechanism confusing
- BU scoping is straightforward to set up if BUs are clean; if the client's BU structure is messy (a common situation), push for admin-managed flat pins to avoid the scoping headache

---

*Low maintenance once set up; check in after go-live to see if agent-managed pins are actually being used*
