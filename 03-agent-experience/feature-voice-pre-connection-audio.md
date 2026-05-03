# Pre-Connection Audio Checks (Audio Device Preheating)

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/use-pre-connection-audio-checks

## What it does
Warms up the representative's audio device before a call connects, so it's ready the moment the call comes in. Notifies the agent when the device is ready. Reduces the dead-air period at the start of calls caused by audio device initialisation latency.

## Key facts
- GA: October 31, 2025
- "Preheating" happens before the call connects — the device is initialised proactively, not reactively
- Notifies the representative when audio is connected and ready
- Related to "Set up microphone connection on representative sign-in" in admin center
- Addresses a specific problem: softphone audio drivers that take 1–3 seconds to initialise, causing clipped greetings

## When to use / skip
Enable this for any voice deployment where agents are on software-based audio (USB headsets, virtual audio devices, or softphones). The clipped-greeting problem is common in these setups and frustrating for customers. Not relevant if the client is using a hardware phone with a direct PSTN connection.

## Configuration decisions
- Enable in admin center via "Set up microphone connection on representative sign-in" setting
- Consider alongside the audible call-connection sound (`feature-voice-call-connection-sound.md`) — both are part of the same audio readiness story

## Gotchas
- Preheating requires the audio device to be accessible before the call arrives — if the agent's device is locked, unplugged, or claimed by another application, the preheat will fail silently and the initialisation delay reappears
- Some enterprise audio management software (particularly Jabra Direct, Poly Lens equivalents) has its own device state management that can interfere with preheating — test with the actual headset models in use
- Doesn't help with network-related audio delays — if the early-call quality issue is jitter or packet loss rather than device latency, this feature doesn't address it

## Consultant notes

- The clipped-greeting problem is one of the most common voice quality complaints in the first weeks post-go-live. This feature directly addresses it and is worth making sure it's enabled as part of the standard voice deployment checklist.
- USB audio devices and virtual audio devices (common in VDI deployments) are the most likely to benefit — physical handsets typically initialise faster.
- Test by having an agent take several calls in quick succession and check whether the first second of audio is captured cleanly in recordings. That's the most reliable way to confirm the feature is working.
- In VDI environments specifically, audio device ownership can bounce between sessions. Confirm preheating behaviour with the VDI team before go-live.

---

*Review alongside any future changes to the audio device management framework in Contact Center*
