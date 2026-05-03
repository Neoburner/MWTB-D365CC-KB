# SIP X Header Support for Context Transfer

**Category:** Voice Channel
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/enable-sip-x-header-support-context-transfer

## What it does
Extends in-call context transfer between external telephony systems and D365 Contact Center voice agents (IVR) beyond the existing 128-character SIP UUI limit. You can pass up to five custom SIP X headers per call, each up to 256 characters, carrying data like call ID, language preference, or routing instructions.

## Key facts
- GA: February 23, 2026
- Requires Direct Routing telephony — not available with Microsoft Calling Plans
- Up to 5 SIP X headers per call (inbound and outbound transfers)
- Header name limit: 64 characters
- Header value limit: 256 characters
- Works in both directions: receive incoming SIP X headers in voice agents, and send SIP X headers during external phone number transfers
- Voice agents access header values by defining variables that match the header names

## When to use / skip
Use this when the client is on Direct Routing and needs to pass more context than the 128-char UUI field allows — typical use cases are passing call IDs from external IVRs, language/segment flags, or account identifiers that the voice agent needs for routing logic. Skip it if the client is on Calling Plans (not supported), or if the UUI field already covers their context requirements.

## Configuration decisions
- Which SIP X header names to define — agree with the telephony/SBC team upfront, as both sides need to match
- Variable naming in Copilot Studio voice agent to receive incoming headers
- Which variables to expose as outgoing SIP X headers on external transfers
- Whether to use headers for routing decisions, data lookup, or just logging

## Gotchas
- The 5-header limit is hard — if the external system passes more than 5, the extras are silently dropped. Worth confirming the upstream SBC behaviour early.
- Header names are case-sensitive in some SBC implementations — test with the exact casing agreed
- This only works during Direct Routing call flows; if the client has a mixed estate (some Calling Plans, some Direct Routing), the feature won't be available uniformly
- Context passed via SIP X headers doesn't automatically appear in the conversation transcript or analytics — if the client needs it recorded, build that into the voice agent logic explicitly

## Consultant notes

- The feature exists because UUI's 128-char limit has been a genuine pain point on complex IVR-to-agent handoff architectures. If you've been working around it with DTMF lookups or callbacks, this is the cleaner solution.
- SBC configuration is outside the Contact Center scope — the telephony vendor or network team needs to make changes on their side. Get that dependency surfaced early in the project; it's a common cause of Direct Routing delays.
- Test early with real SBC traffic, not just simulated calls from the test harness. Header stripping and encoding differences between SBC vendors are real and don't always show up in lab testing.
- Post-go-live, if clients report missing context on inbound calls, the first place to check is whether the SBC is actually sending the headers — use Azure Communication Services call diagnostics to verify.

---

*Worth revisiting if Microsoft increases header limits or adds Calling Plan support in a future wave*
