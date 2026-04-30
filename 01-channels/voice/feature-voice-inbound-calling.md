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
Essential for any inbound voice deployment. Every inbound number has to bind to a workstream here — no way around it.

## Configuration decisions
- **Bridged vs non-bridged transfer** — Bridged keeps recording rolling and shows your Dynamics number; non-bridged shows the customer's real number and drops recording. Pick based on compliance and callback needs.
- **Multi-language: one number vs one per language** — Single number with a language IVR menu is cleaner to maintain. Raise this early in discovery; clients often default to separate numbers without thinking it through.
- **Post-call survey** — Wired in during the Behaviours step of setup, not after. Do this now, not post go-live.

## Gotchas
- **Workstream-level operating hours kill voicemail.** Set at workstream level, and queue-level overflow (which handles voicemail) never fires. If voicemail is in scope, put operating hours at the queue level instead — see `feature-voice-voicemail.md`.
- **Post-call survey lives in Behaviours, not as a separate step.** If you need it, link it during channel setup now. Easy to miss otherwise.
- **Test all inbound paths before go-live.** Voice routing issues are a nightmare to debug remotely. Build a test call plan covering every number, every language, and every operating hours scenario and run it through UAT.

---

*Source last updated: 2026-03-10 | Worth revisiting if enhanced voice rolls out to more regions or anonymous inbound stops being Direct Routing only*
