# E911 Emergency Calling

**Category:** Voice Features / Compliance
**Applies To:** Standalone / Embedded
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-emergency-calling

## What it does
Emergency calling (E911 in North America, 999 in UK, 112 in EU) compliance configures D365 to route emergency numbers to PSTN without normal workstream logic. When a customer dials 911/999/112, the call bypasses queue routing and connects directly to the Public Safety Answering Point (PSAP) with the agent's registered location. This is a mandatory feature where emergency services regulation applies.

## Key facts
- Routing emergency calls through normal contact centre queues is illegal in regulated jurisdictions (North America, EU, UK, Australia)
- Emergency calls are automatically routed out of D365 directly to PSAP; no agent involvement required
- Agent location must be registered in ACS or Teams Phone configuration for PSAP to identify the caller's address
- Location updates are near-real-time but may lag if agents are remote/mobile; use the last-known location registered
- Emergency calls are not recorded in D365 call history; PSAP handles recording per local law
- ACS and Teams Phone handle E911 routing natively; Direct Routing requires SBC to support E911 pass-through
- Failing to register agent locations exposes the organisation to regulatory penalties (FCC fines up to $10K+ per violation in US)
- E911 configuration is country-specific; different rules apply per jurisdiction (US vs. Canada vs. EU)

## When to use / skip
Use E911 in any jurisdiction where emergency calling is regulated. Skip only if your contact centre is in an unregulated territory (rare) or if you operate a private PBX with no PSTN access (internal calls only). Default to enabling E911; disabling it should require legal sign-off.

## Configuration decisions
- **Location database:** Choose between ACS default location database or integrate with third-party location services (e.g., Intrado, Emergency Reporting)
- **Agent location accuracy:** Decide whether to use office address, regional office, or street-level address (street-level is most accurate but requires mobile location services)
- **Location refresh:** Set how often agent locations are updated (real-time for office-based, periodic for remote agents)
- **Fallback address:** Configure an organisation-wide fallback if an agent's location cannot be determined
- **Emergency contact:** Register a primary contact (e.g., facility manager) who PSAP can reach if clarification is needed
- **Regulatory jurisdiction:** Explicitly configure the country/region to ensure correct PSAP routing rules apply

## Gotchas
- Agent locations are cached; if an agent moves between offices, the old location may persist for 5–10 minutes
- Remote agents may trigger "location unknown" errors if mobile location services are disabled or GPS is unavailable
- PSAP may reject calls with incomplete or invalid address data; always validate address fields
- E911 compliance audits are routine in regulated industries; keep detailed location logs for all agents
- Porting a number *into* a D365 instance may clear E911 registration; reconfigure after porting
- Mass agent location updates (e.g., office relocation) can cause API throttling; batch updates carefully
- Emergency calls cannot be transferred to other agents; the call ends when the agent hangs up (by design)

---

*Source last updated: 2026-04-30 | Review when: Emergency calling regulations change or ACS E911 features expand*
