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
Use this feature to acquire, release, and port numbers as your contact centre scales. Skip only if you manage numbers via a carrier portal and never integrate them with D365 (rare, usually only for Direct Routing with carrier-managed DIDs).

## Configuration decisions
- **Number quantity:** Calculate based on concurrent calls and geographic distribution (e.g., 10 agents × 4 calls per agent = 40 numbers for overflow)
- **Geography:** Choose numbers in regions matching your customer base (local numbers increase answer rates)
- **Toll-free vs. geographic:** Toll-free (1-800) has higher cost but wider geographic reach; geographic numbers are cheaper
- **Number porting timeline:** Plan porting during low-traffic periods; allow 3–4 weeks and test routing before cutover
- **LNP carrier letter:** Obtain Letter of Authorization (LOA) from your current carrier before porting
- **Fallback routing:** Configure overflow numbers and backup queues before releasing old numbers
- **Conservation pool:** If using ACS PSTN, do not release numbers immediately; keep a small pool in reserve for failover

## Gotchas
- Porting requests can be rejected if the account holder name or address doesn't match the original; verify account details with old carrier first
- Number release is immediate and irreversible; once released, the number returns to carrier inventory and cannot be recovered
- Porting a number to a different Azure region requires deleting and re-importing; brief interruption expected (30 min–2 hours)
- Direct Routing numbers require SBC configuration before porting; empty SBC routes cause calls to fail silently
- Vanity numbers (1-800-FLOWERS) are expensive and slow to port; reserve 6–8 weeks lead time
- Geographic restrictions: Some countries ban call routing across borders (e.g., EU data residency rules); local numbers must terminate locally
- When a workstream references a released number, the workstream becomes "orphaned"; D365 does not automatically remove the reference

---

*Source last updated: 2026-04-30 | Review when: LNP regulations change or ACS geographic coverage expands*
