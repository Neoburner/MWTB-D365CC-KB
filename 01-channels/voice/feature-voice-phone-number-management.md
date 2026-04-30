# Phone Number Management & Porting

**Category:** Voice Channel Setup
**Applies To:** Standalone / Embedded
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/manage-phone-numbers

## What it does
Phone Number Management covers the full lifecycle of DIDs in D365 Contact Center: acquiring new numbers from ACS, releasing unused numbers, porting numbers into D365 from another carrier (Direct Routing), and managing number-to-workstream bindings. All phone numbers are ultimately managed in ACS or Teams Phone; D365 references them via routing configuration.

## Key facts
- ACS PSTN numbers are purchased as monthly subscriptions; release to stop recurring charges immediately
- Number porting (Local Number Portability, LNP) varies by jurisdiction: US (1–3 weeks), EU (1–2 weeks), Australia (2–3 weeks)
- Porting is disabled if the number is associated with other Microsoft services (Teams, Skype); requires deprovisioning first
- Direct Routing numbers are not provisioned by Microsoft; you own them and route them through your SBC
- When a number is released, all workstreams using that number become inactive; no automatic failover to a backup number
- Number formats: D365 expects E.164 format (+1-555-0123); local formats must be normalised during import
- Geographic numbers are tied to their jurisdiction; cannot route a US number through EU infrastructure (compliance risk)
- One DID can route to multiple queues via call flows (e.g., 1-800-SUPPORT → IVR → English queue or Spanish queue)

## When to use / skip
Use this to acquire, release, and port numbers as you scale. Skip only if you manage numbers in a carrier portal and never bring them into D365 (rare — usually Direct Routing with carrier-managed DIDs).

## Configuration decisions
- **Number quantity** — Calc based on concurrent calls and geography. 10 agents × 4 calls each = 40 numbers for overflow.
- **Geography** — Pick regions that match your customer base. Local numbers get better answer rates.
- **Toll-free vs. geographic** — Toll-free costs more but reaches further; geographic numbers are cheaper.
- **Porting timeline** — Plan for low-traffic periods. Allow 3–4 weeks, test routing before cutover.
- **LNP paperwork** — Get a Letter of Authorization (LOA) from your current carrier before you port.
- **Fallback routing** — Set up overflow numbers and backup queues before you release old numbers.
- **Reserve pool** — Don't release numbers immediately. Keep a small pool handy for failover.

## Gotchas
- **LNP rejects if account details don't match.** Verify account holder name and address with the old carrier first.
- **Number release is permanent.** Released number goes back to carrier inventory. You can't get it back.
- **Cross-region porting needs delete + re-import.** Brief outage expected (30 min–2 hours).
- **Direct Routing requires SBC config before porting.** Empty SBC routes = silent call failures.
- **Vanity numbers take forever.** 1-800-FLOWERS is expensive and slow. Plan 6–8 weeks ahead.
- **Geographic restrictions apply.** Some countries forbid cross-border routing (EU data residency). Local numbers must stay local.
- **Released numbers orphan workstreams.** Workstream still references the number. D365 won't clean that up automatically.

---

*Source last updated: 2026-04-30 | Worth revisiting if LNP regulations shift or ACS adds new geographies*
