# Voice Channel — Inbound Calling Setup

**Category:** Channels — Voice
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../voice-channel-inbound-calling](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-inbound-calling)

## What it does
Creates a voice workstream and binds it to a phone number so inbound calls can be received and routed. Configures language, hold music, operating hours, recording, and transfer behaviour at the workstream level.

## Key facts
- Voice workstreams are **push mode only** — pull mode unavailable
- A phone number can only be assigned to **one workstream** at a time
- **Anonymous inbound calls** supported only on ACS Direct Routing numbers — not on ACS managed numbers
- Multi-language: a single number can serve multiple languages via a language selection menu; add additional languages on the Language page
- **Bridged vs non-bridged external transfer:**
  - **Bridged:** Dynamics number shown as caller ID, recording continues through transfer, no DTMF to external, post-call survey triggers
  - **Non-bridged:** Customer's number shown as caller ID, recording stops at transfer, DTMF supported, no post-call survey; Direct Routing customers need SBC configured to accept REFER-TO
- Operating hours at workstream level **override** queue-level overflow settings — this conflicts with voicemail configuration (see `feature-voice-voicemail.md`)

## When to use / skip
Required for any inbound voice deployment. Every inbound phone number must be bound to a workstream through this configuration.

## Configuration decisions
- Bridged vs non-bridged external transfer — bridged maintains recording continuity and shows the Dynamics number; non-bridged gives external parties the customer's actual number for callback. Decide based on compliance requirements and callback workflow needs.
- Multi-language on a single number vs separate numbers per language — single number with language selection IVR is simpler to manage; raise this option in discovery before clients default to one number per language
- Post-call survey — wired up in the Behaviours step; do this at channel setup time, not post go-live

## Gotchas
- **Operating hours at workstream level breaks voicemail.** If operating hours are set at the workstream level, queue-level overflow (needed to offer voicemail) doesn't fire. Configure operating hours at the queue level instead if voicemail is in scope — see `feature-voice-voicemail.md`.
- **Post-call survey is configured in Behaviours, not separately.** If post-call survey is in scope, it must be linked during the channel setup step — it's easy to miss.
- **Test every inbound scenario before go-live.** Voice channel issues (number not ringing, not routing to queue, rep not receiving notification) are hard to diagnose remotely. Write a test call plan covering each number, each language, and each operating hours scenario and run it during UAT.

---

*Source last updated: 2026-03-10 | Review when: Enhanced voice becomes available in additional regions, or anonymous inbound expands beyond Direct Routing*
