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
Use E911 wherever emergency calling is regulated. Skip only in unregulated territories (rare) or if you're running a private PBX with no PSTN access. Default to enabled — disabling it needs legal approval.

## Configuration decisions
- **Location database** — Use ACS default or integrate a third-party service (Intrado, Emergency Reporting, etc.).
- **Location accuracy** — Office address, regional office, or street-level (street-level is more accurate but needs mobile location services).
- **Location refresh frequency** — Real-time for office-based agents, periodic for remote workers.
- **Fallback address** — What to use if you can't pin down an agent's location.
- **Emergency contact** — Who the PSAP can ring if they need more info (facility manager, etc.).
- **Jurisdiction** — Explicitly set the country/region for correct PSAP routing.

## Gotchas
- **Location caching persists.** Agent moves offices, but the old location sticks around for 5–10 minutes.
- **Remote agents often fail location detection.** Mobile location services off or GPS unavailable = "location unknown" error.
- **PSAP rejects bad address data.** Incomplete or invalid addresses get rejected. Validate all address fields.
- **Compliance audits are routine.** Keep audit logs of all agent locations. You'll need them.
- **Number porting clears E911.** Port a number into D365 and E911 registration vanishes. Reconfigure after porting.
- **Mass location updates cause throttling.** Office relocation? Batch your location updates carefully or the API backs off.
- **Emergency calls can't be transferred.** Call ends when the agent hangs up. That's by design.

---

*Source last updated: 2026-04-30 | Worth revisiting if E911 regulations change or ACS adds new E911 features*
