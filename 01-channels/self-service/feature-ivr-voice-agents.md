# IVR Agents for Voice Channel (Copilot Studio)

**Category:** Channels — Self-Service
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../voice-channel-pva-bots](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-pva-bots)

## What it does
Attaches a Copilot Studio agent to the voice channel to act as an IVR before calls reach a live rep. Handles speech and DTMF input, performs lookups, routes based on intent, and transfers or terminates calls. Supports both classic topic-matching and generative AI orchestration.

## Key facts
- **1-hour maximum** for bot-handled voice calls — auto-disconnected if not transferred or ended within this window
- Input methods: natural language speech, DTMF keypad, constrained speech recognition (grammar-based, for alphanumeric inputs like account numbers)
- Supports SSML for voice customisation, barge-in (customer interrupts bot mid-prompt), silence detection, custom audio files
- SIP UUI and X-Headers for passing context in/out of calls (Direct Routing only — not available with ACS managed numbers)
- Two NLU options: standard NLU (processes in Copilot Studio) and NLU+ (processes within D365 boundary — relevant for data residency requirements)
- Multilingual IVR requires separate configuration in Copilot Studio — not configured solely in admin center

## When to use / skip
Use when the client wants automated triage, self-service resolution, or intent-based routing before human rep involvement. Skip if all calls should go directly to a queue — adding an IVR without a clear benefit just adds friction and complexity.

## Configuration decisions
- Classic vs generative AI orchestration — classic for deterministic menu-style IVR; generative for natural language intent handling
- DTMF vs natural language input — DTMF is more reliable in noisy environments and for structured data entry; NLU is better for open-ended queries
- Constrained speech recognition vs free-form — use constrained for account numbers, dates, tracking numbers where exact input matters
- Escalation path design — define what happens when the bot can't resolve: which queue, what context passes to the rep

## Gotchas
- **Build the transfer-to-agent path first.** The most common IVR failure mode is spending weeks on self-service flows without confirming escalation works. Get a live call to reach a rep before designing any self-service content.
- **The 1-hour bot call limit affects complex IVR flows.** For multi-step troubleshooting or long self-service processes, test total call duration against this ceiling.
- **SIP X-header context passing requires Direct Routing.** If the client uses ACS managed numbers and needs to pass legacy IVR context, this capability isn't available without switching to Direct Routing.
- **NLU+ keeps data inside the D365 boundary.** For clients with strict data residency requirements, NLU+ is the right choice — standard NLU sends intent processing data to Copilot Studio's infrastructure.

---

*Source last updated: 2026-03-12 | Review when: Generative AI orchestration reaches GA, or SIP context passing broadened to ACS managed numbers*
