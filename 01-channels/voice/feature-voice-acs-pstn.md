# ACS PSTN Integration

**Category:** Voice Channel Setup
**Applies To:** Standalone / Embedded
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-acs-onboarding

## What it does
Azure Communication Services (ACS) is the underlying telephony platform for D365 Contact Center voice. This setup configures an ACS resource, connects it to your D365 instance, and enables inbound and outbound calling via Microsoft-managed PSTN connections. Customers can call your published phone numbers, and agents can dial out using ACS infrastructure.

## Key facts
- Requires an active Azure subscription and ACS resource in your Azure tenant
- ACS and D365 must be in the same Azure AD/Microsoft Entra tenant for auth delegation
- Phone number provisioning in ACS takes 24–48 hours after purchase order approval
- Default quota: 100 concurrent calls per ACS resource (request increase via Azure support)
- Call recording, if enabled, incurs ACS media processing charges separate from D365 licensing
- PSTN call routing happens within ACS; D365 routes the inbound call *after* ACS delivery
- ACS numbers are purchased as recurring monthly subscriptions (cannot be cancelled mid-cycle)
- Calling Plan numbers (Teams Phone) follow different licensing; ACS PSTN and Calling Plans cannot share the same DID

## When to use / skip
Choose ACS PSTN if you want Microsoft-managed PSTN with no carrier wrangling. It's the quickest path for most contact centres and scales easily. Skip it if you've already got SIP trunk capacity and own your numbers — Direct Routing is better for that. Also think twice if you need dedicated SIP failover or carrier-specific compliance (some countries restrict cloud calling).

## Configuration decisions
- **Number geography:** Decide which countries/regions your DIDs cover. ACS supports 30+ countries; each geography has different pricing and availability
- **Number quantity:** Estimate peak concurrent calls and calculate DIDs needed (typically 1 DID per 4–6 agents, adjust for overflow)
- **Call recording strategy:** Enable for all calls, none, or selectively by queue (recording requires Azure Media Services; costs ~$0.50–1.50 per hour)
- **Inbound routing:** Configure call flows in the workstream—direct to queue, auto-attendant, or escalation
- **Timezone:** Map call centre timezone to ACS region for latency optimisation
- **Caller ID presentation:** Decide if outbound calls show the agent's extension or a main DID

## Gotchas
- ACS provisioning can stall if your Azure account is flagged for fraud review; whitelist IP ranges in advance if possible
- Changing the ACS resource linked to D365 is disruptive—all in-flight calls drop; plan the cutover carefully
- Number porting from another carrier *into* ACS is slow (4–8 weeks) and requires carrier sign-off; direct routing is faster for BYOC scenarios
- Concurrent call limits are per ACS resource; if you hit quota, new calls fail silently rather than queue—monitor usage proactively
- Deleting the ACS resource from Azure does not unlink it from D365 automatically; remove the link in D365 admin centre first to avoid orphaned references
- PSTN costs accrue per minute; bulk pricing tiers exist but are only visible after your first 10K minutes/month—budget conservatively

## Consultant notes

- The question that always slows provisioning down: "who manages your Azure subscription?" If it's a central IT team that hasn't touched ACS before, add buffer. Number provisioning delays are almost always an Azure approval or admin access issue, not a D365 issue.
- Clients consistently underestimate DID quantity because they're thinking total headcount, not concurrent calls. Push back on this early with a quick concurrent call estimate before purchase — numbers can't be easily cancelled mid-cycle.
- ACS PSTN is the right default for most net-new deployments. Only deviate if the client has a carrier relationship they actively want to preserve, or has a country requirement ACS doesn't cover.

---

*Source last updated: 2026-04-30 | Worth revisiting if ACS pricing shifts or new voice features ship*
