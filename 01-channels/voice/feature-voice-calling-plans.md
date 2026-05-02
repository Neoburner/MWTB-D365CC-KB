# Microsoft Calling Plans

**Category:** Voice Channel Setup
**Applies To:** Standalone / Embedded
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-calling-plan

## What it does
Microsoft Calling Plans (also called Teams Phone) are pre-provisioned PSTN access bundled with Microsoft 365. Instead of managing ACS separately, you use your organisational phone numbers within Teams Phone licensing to handle inbound and outbound calls in D365 Contact Center. Numbers are managed in the Microsoft 365 admin center.

## Key facts
- Requires Teams Phone licence (SKU: MCOCALL) for each concurrent agent, or a Calling Plan add-on for users who don't need full Teams features
- Numbers provisioned in Teams Phone are automatically available to D365; no separate ACS resource needed
- Geographic availability is limited to ~20 countries; ACS PSTN offers more territories
- Call recording is handled by Teams recording infrastructure; no separate ACS charges
- Number porting is managed by Microsoft (typically 2–4 weeks); can reuse existing numbers from other Microsoft services
- Calling Plans support does not include call-by-call routing logic; D365 workstreams handle that
- Concurrent call limits are tied to Teams Phone licensing; each licence covers 1 concurrent call on average
- Cannot mix Calling Plans and ACS PSTN on the same D365 instance; choose one model

## When to use / skip
Go with Calling Plans if you've already got Teams Phone licences, want Teams and D365 to talk to each other, or your country is on the supported list and porting is straightforward. Skip it if you need to reuse existing non-Teams PSTN numbers, need global coverage beyond the supported regions, or run a large contact centre, the per-call pricing gets savage at scale.

## Configuration decisions
- **Licensing model:** Determine if you'll licence agents with full Teams Phone or Calling Plan add-ons only
- **Number acquisition:** Buy new numbers from Microsoft or port existing numbers in
- **Auto-attendant routing:** Decide if calls route through Teams Auto-Attendant or direct to D365 queue
- **Call forwarding:** Configure whether unanswered calls forward to voicemail, another queue, or an on-call agent
- **Caller ID:** Choose which number displays for outbound calls (main DID or agent extension)
- **Regional availability:** Confirm your countries are supported; Calling Plans have gaps (some EU countries, Asia-Pacific regions)

## Gotchas
- Calling Plan pricing scales poorly for large contact centres; cost-per-call exceeds ACS PSTN above ~50 concurrent calls
- Teams client updates sometimes disrupt Calling Plans integration; test updates in UAT first
- Number porting *into* Calling Plans can fail if the number is associated with other Microsoft services; requires coordination
- Concurrent call limits are soft; exceeding them causes new calls to fail or route to voicemail instead of queuing
- Teams Phone and Direct Routing cannot coexist on the same tenant; if you need both, use ACS PSTN instead
- Calling Plans do not support SIP trunking; you cannot bring your own carrier numbers
- Outbound Calling Plan calls show the provisioned DID, not the agent's extension, by default; cannot customise per-agent

## Consultant notes

- "We already have Teams licences" is not the same as "we already have calling-capable Teams licences." Check the actual SKU in pre-sales: it saves an awkward conversation mid-project when the licensing gap surfaces.
- The cost argument matters at scale. If you're recommending Calling Plans for a centre above 50 concurrent calls, run the numbers first. The per-call pricing can comfortably exceed ACS PSTN at that volume.
- Clients often expect deeper Teams integration than Calling Plans actually delivers. "Can agents work in Teams as normal?" depends entirely on their licensing setup. Set expectations early rather than letting the demo do the selling.

---

*Source last updated: 2026-04-30 | Worth revisiting if Teams Phone licensing shifts or geographic coverage expands*
