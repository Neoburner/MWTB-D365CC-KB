# Voice Channel — Overview & Architecture

**Category:** Channels — Voice
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../voice-channel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel)

## What it does
Native telephony built on Azure Communication Services, embedded directly in D365 Contact Center. Handles inbound and outbound PSTN calls through the same unified routing engine as chat, SMS, and digital messaging — no separate telephony platform required.

## Key facts
- Three telephony options: ACS PSTN (Microsoft-provided numbers), Direct Routing (bring your own carrier SIP trunk), Microsoft Calling Plans (via Teams Phone)
- Voice workstreams are **push mode only** — pull (pick) mode is not available
- E911 emergency calling: **US and Puerto Rico only**
- Agents must use **Copilot Service workspace** — Customer Service Hub does not support voice
- New deployments get enhanced voice (Copilot Studio voice agents) out of the box; existing workstreams need migration
- Network minimums: 4 Mbps upload / 8 Mbps download per agent — must be verified at each agent location, not just HQ
- Real-time capabilities: transcription, sentiment analysis, translation, smart assist suggestions — all available natively
- Supervisor capabilities: monitor (listen-only), whisper (speak to agent only), barge (join call), transfer/reassign

## When to use / skip
Go with native voice if the client wants telephony managed inside D365, no separate integrations. If they've already got a telephony platform and CTI integration in flight, decide whether ripping it out for voice channel is worth the disruption — usually it's not unless the existing setup is causing pain.

## Configuration decisions
- ACS PSTN vs Direct Routing vs Teams Phone — ACS PSTN is the fastest to provision and most natively integrated; Direct Routing adds carrier and network complexity; Teams Phone is relevant only if the client already has Teams Phone licences
- Whether to deploy an IVR agent (Copilot Studio) — see `feature-ivr-voice-agents.md`
- Recording and transcription scope — per workstream, configurable separately; see `feature-voice-recording-transcription.md`

## Gotchas
- **Voice is the highest-complexity channel to implement.** Plan 2–3× more setup time than a chat channel. Telephony provisioning, number porting, network validation, and IVR design all sit on the critical path.
- **Network assessment is not optional.** Run ACS network tests from agent workstation locations. VPN, proxy, and firewall configurations frequently degrade voice quality in ways that only appear at go-live.
- **Existing voice workstreams need migration for enhanced voice.** If the client has existing voice workstreams, assess migration before the next wave — don't leave this until problems surface.
- **IVR design is a separate workstream.** Copilot Studio agent design for voice IVR has its own complexity and timeline. Don't roll it into the channel setup estimate.
- **Deprecated: local hosting of the voice channel has been removed.** Switzerland lost local hosting October 2024; India and Japan September 2024. If you're working with a client that had locally hosted voice in those regions, they need to be on global cloud deployment now. See [Deprecations in Dynamics 365 Contact Center](https://learn.microsoft.com/en-us/dynamics365/contact-center/implement/deprecations-contact-center).

---

*Source last updated: 2026-04-15 | Worth revisiting if E911 goes international or enhanced voice agents hit new GA milestones*
