# Licensing & Subscription Management

**Category:** Administration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/licensing

## What it does
D365 Contact Center and Customer Service have a multi-tier licensing model where different features are available depending on which licences are assigned. Getting licensing right determines which features are available, how many seats are needed, and what the ongoing cost is. Getting it wrong either means paying for features not used, or discovering mid-project that a required capability requires an additional licence that wasn't budgeted.

## Key facts

**Core licence tiers (as of 2026):**
- **D365 Customer Service Professional:** basic case management, knowledge base, standard reporting. No omnichannel channels.
- **D365 Customer Service Enterprise:** full case management, SLA, omnichannel channels (with add-on), Copilot features, WFM (with add-on)
- **D365 Contact Center (standalone):** omnichannel channels + routing without requiring Customer Service Enterprise; aimed at CRM-agnostic deployments
- **D365 Contact Center add-on:** adds omnichannel capability to an existing Customer Service Enterprise environment

**Add-ons that require separate licences:**
- **Digital Messaging & Voice add-on:** required for voice and digital channels beyond basic chat (sometimes included in Contact Center, verify per licence)
- **WFM (Workforce Engagement Management):** separate add-on; not included in base Contact Center or Customer Service Enterprise
- **Conversation Intelligence:** may be included in some Enterprise tiers or require an add-on — verify per agreement
- **Power BI Pro/PPU:** required for any user viewing Power BI embedded reports within CSW
- **Azure Communication Services:** consumption-based; billed per minute for voice, per message for SMS — separate from D365 licence costs

**Named user vs capacity licensing:** D365 licences are per named user (the agent who logs in). ACS is consumption-based and billed per usage, not per seat.

## When to use / skip
Licensing applies to every deployment. The only skip scenario is if someone else (Microsoft, partner, client IT) has already confirmed the licence stack — but it should still be verified before build starts.

## Configuration decisions
- Confirm the licence type per user role: agents, supervisors, administrators, and read-only stakeholders may need different licence tiers
- Verify which add-ons are included in the negotiated agreement vs which need to be added — the licence agreement may include add-ons that aren't active yet
- Assign licences in the Microsoft 365 admin centre to the correct users before provisioning D365 — unprovided licences cause feature access errors during implementation
- Track ACS consumption costs separately — voice contact centres can accumulate significant ACS minute costs; model expected usage volume against ACS pricing before go-live
- Confirm Power BI licensing separately from D365 licensing if embedded analytics or Power BI reports are in scope

## Gotchas
- Licence tiers look similar but gate significant features. Customer Service Professional does not support omnichannel channels. A project scoped as "Customer Service with chat" that is licensed with Professional licences will hit a wall.
- The WFM add-on is frequently missed in initial budget conversations. WFM requires a separate per-user add-on licence on top of Customer Service Enterprise or Contact Center. Clients who discover this after the scope is agreed tend to push back hard on the additional cost.
- Copilot features require specific licence tiers or add-ons depending on the feature. "We have D365 Customer Service Enterprise, so Copilot is included" is not always accurate — some Copilot capabilities require Microsoft Copilot Studio licences or Azure OpenAI consumption, billed separately.
- ACS voice billing is consumption-based and can surprise clients who are used to flat-rate telephony costs. A contact centre handling 10,000 minutes of PSTN calls per month has a real ACS bill that should be modelled against expected call volumes during planning.
- Temporary/seasonal agent increases (e.g., additional agents over Christmas) require additional named user licences for those agents. D365 doesn't support anonymous or shared agent logins.

## Consultant notes

- Do a licence audit at the start of every engagement, even if the client says they have the right licences. Ask for the actual licence count, the licence type, and the add-ons included. Compare this against the feature scope. It's not unusual to find that what was purchased doesn't match what's been scoped, and it's far better to surface this in week one than in week ten.
- ACS cost modelling is a conversation that benefits from real data. Ask the client for their current inbound call volume (minutes per month), outbound call expectations, and SMS volumes. Run these against the ACS published pricing for their region. For voice-heavy deployments, the ACS consumption cost can rival the D365 licence cost — clients who don't see this until their first Azure bill are not happy.
- Licence management in the Microsoft 365 admin centre is separate from D365 configuration. If an agent is configured in D365 but not assigned a licence in the M365 admin centre, they'll encounter feature access errors or won't be able to log in to the correct CSW features. Include licence assignment verification in the go-live readiness checklist.

---

*Source last updated: 2026-04-30 | Pricing and licence tier contents change frequently — always verify against current Microsoft pricing page and the client's actual licence agreement*
