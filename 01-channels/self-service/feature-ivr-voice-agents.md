# IVR Agents for Voice Channel (Copilot Studio)

**Category:** Channels — Self-Service
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../voice-channel-pva-bots](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-pva-bots)

## What it does
Attach a Copilot Studio agent to the voice channel as an IVR before live reps. Handles speech and DTMF input, does lookups, routes by intent, transfers or ends calls. Supports classic topic-matching and generative AI.

## Key facts
- **1-hour maximum** for bot-handled voice calls — auto-disconnected if not transferred or ended within this window
- Input methods: natural language speech, DTMF keypad, constrained speech recognition (grammar-based, for alphanumeric inputs like account numbers)
- Supports SSML for voice customisation, barge-in (customer interrupts bot mid-prompt), silence detection, custom audio files
- SIP UUI and X-Headers for passing context in/out of calls (Direct Routing only — not available with ACS managed numbers)
- Two NLU options: standard NLU (processes in Copilot Studio) and NLU+ (processes within D365 boundary — relevant for data residency requirements)
- Multilingual IVR requires separate configuration in Copilot Studio — not configured solely in admin center

## When to use / skip
Use IVR when the client wants automated triage, self-service resolution, or intent-based routing before human reps. Skip if all calls go straight to queue—pointless IVR just adds friction.

## Configuration decisions
- Classic vs generative AI orchestration — classic for deterministic menu-style IVR; generative for natural language intent handling
- DTMF vs natural language input — DTMF is more reliable in noisy environments and for structured data entry; NLU is better for open-ended queries
- Constrained speech recognition vs free-form — use constrained for account numbers, dates, tracking numbers where exact input matters
- Escalation path design — define what happens when the bot can't resolve: which queue, what context passes to the rep

## Gotchas
- Build the transfer-to-agent path first. Most IVR failures are teams that spend weeks on self-service flows without confirming escalation works. Get a live call to reach a rep before designing any self-service content.
- The 1-hour bot call limit affects complex IVR flows. For multi-step troubleshooting or long processes, test total call duration against this ceiling.
- SIP X-header context passing needs Direct Routing. If the client uses ACS managed numbers and needs legacy IVR context, you'll need Direct Routing for this.
- NLU+ keeps data inside the D365 boundary. For strict data residency, NLU+ is right. Standard NLU sends intent processing to Copilot Studio infrastructure.

## Consultant notes

- Build the transfer-to-agent path first, not the self-service content. Most IVR projects get three weeks into bot design before confirming that escalation actually connects a call to a rep. Test the full handoff path end-to-end before designing any self-service topics — it's the foundation everything else depends on.
- NLU+ for data residency should be on the checklist question for regulated clients. If the client has data residency requirements, standard NLU sending intent processing outside the D365 boundary could be a problem. Raise it in discovery, not after go-live.
- DTMF vs natural language is a genuine design choice, not a default. Noisy call environments, older demographics, and structured data entry (account numbers, dates) all favour DTMF. Don't default to natural language just because it sounds more modern.

---

*Source last updated: 2026-03-12 | Worth checking again when generative AI orchestration reaches GA, or if SIP context passing extends to ACS managed numbers*
