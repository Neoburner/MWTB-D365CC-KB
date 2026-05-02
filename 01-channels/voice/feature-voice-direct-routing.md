# Direct Routing (Bring Your Own Carrier)

**Category:** Voice Channel Setup
**Applies To:** Standalone / Embedded
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-bring-your-own-number

## What it does
Direct Routing allows you to connect your existing SIP trunk (from any IETF-compliant carrier) directly to D365 Contact Center via Azure Communication Services. You provision your own numbers and SIP infrastructure, then route inbound calls through your Session Border Controller (SBC) into D365. Outbound calls exit via your carrier's trunk.

## Key facts
- Requires a Session Border Controller (SBC) certified for ACS Direct Routing; Microsoft maintains an approved list (Ribbon, Audiocodes, Metaswitch, etc.)
- Your SBC must be on the public internet with a valid TLS certificate and static public IP
- You keep ownership of phone numbers and carrier relationship; numbers don't have to be purchased from Microsoft
- Inbound calls hit your SBC first, then route to ACS, then to D365—adds 50–100ms latency vs. ACS PSTN
- Calling Plans (Teams Phone) numbers cannot be used with Direct Routing; requires dedicated DID block from your carrier
- ACS still handles media transport; your carrier provides signalling only
- Number porting into Direct Routing is faster than ACS PSTN (typically 2–4 weeks) because the number stays with your carrier
- SBC capacity is your responsibility; misconfigured SBCs cause silent call failures or one-way audio

## When to use / skip
Use Direct Routing if you've got a carrier relationship you want to keep, own your numbers, or need carrier-level control (transcoding, custom routing, PBX failover). Skip it if you want a fully managed setup, need to go live fast, or don't have SBC expertise on the team.

## Configuration decisions
- **SBC selection:** Choose an SBC vendor based on your budget, carrier compatibility, and HA requirements (single SBC, redundant pair, or regional cluster)
- **SBC location:** Host on-premises, in a co-location facility, or in the cloud (AWS, Azure); cloud SBCs reduce latency if your agents are remote
- **Trunk configuration:** Define SIP trunk parameters—IP ranges, ports, media encryption (TLS/SRTP), dial plan transformations
- **Number format:** Map your carrier's number scheme (E.164, national format) to D365 expectations via dial plan rules
- **Outbound routing:** Route all outbound calls back through the SBC or split by destination (internal vs. external)
- **Failover strategy:** Configure backup SBCs or fallback to a secondary carrier trunk
- **Media bypass:** Enable if your SBC and D365 agents share low-latency network; disable for cloud-based agents

## Gotchas
- SBC TLS certificate must be valid and trusted by Azure; self-signed certs cause auth failures that are hard to debug
- Dial plan rules are complex and easy to misconfigure—test number transformations in a lab SBC before going live
- One-way audio often stems from SBC firewall rules or NAT traversal settings; requires packet captures to troubleshoot
- ACS IP whitelisting is strict; if your SBC IPs change (e.g., failover to backup), calls drop until the whitelist is updated
- SBC vendor support is essential; unresponsive SBC vendors can leave you blind to configuration issues
- Media encryption (SRTP) adds CPU overhead on the SBC; ensure SBC is sized for your concurrent call volume
- Inbound number translations (DID mapping) must match D365 workstream expectations; mismatched DIDs route calls to the wrong queue silently

## Consultant notes

- Check the ACS-certified SBC vendor list in pre-sales, not during implementation. If the client's existing SBC isn't on it, that's a blocker — not a workaround. Finding out mid-project is painful.
- Scope clarity on who owns the SBC layer is essential. Direct Routing adds a dependency outside D365, and the line between "D365 problem" and "SBC problem" gets blurry fast. Get it in the SOW before anyone starts configuring anything.
- First-time one-way audio is almost always a firewall or NAT issue on the SBC side. Don't spend three hours in D365 logs before confirming the SBC is actually passing media correctly.

---

*Source last updated: 2026-04-30 | Worth revisiting if ACS updates the SBC vendor list or Direct Routing quotas shift*
