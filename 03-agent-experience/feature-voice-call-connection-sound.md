# Audible Sound for Call Connection

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/play-audible-sound-call-connection

## What it does
Plays an audible notification to the representative when their audio device is connected and ready at the start of a call. Keeps agents aware of their audio status without needing to check a visual indicator.

## Key facts
- GA: November 21, 2025
- Notification plays when the audio device is confirmed connected, not just when the call is answered
- Related to the "Set up microphone connection on representative sign-in" configuration
- No separate toggle documented — check admin center for the specific setting

## When to use / skip
Useful for any voice deployment, particularly where agents are on softphone setups and may not have a physical indicator that audio is live. Low-effort to enable and reduces early-call confusion. Skip worrying about it — it's a minor UX improvement, not a make-or-break configuration item.

## Configuration decisions
- Whether to enable the notification (confirm current default — on or off)
- Coordinate with pre-connection audio check feature (`feature-voice-pre-connection-audio.md`) — they're related

## Gotchas
- Easy to confuse with the pre-connection audio check feature, which is a device readiness test. This feature is specifically the notification sound at connection time, not a diagnostic
- If agents report they're not hearing the sound, check audio device routing — if the device isn't set as default in Windows audio settings, the notification may play to the wrong output

## Consultant notes

- This and the pre-connection audio check feature (`feature-voice-pre-connection-audio.md`) solve the same general problem — agents not knowing their audio is ready. Worth configuring both.
- Small feature, but it comes up in UAT when testers notice the call connects without any audio cue. Have a note ready explaining it's intentional or check whether the org has it enabled.
- Not worth a standalone slide in a client presentation, but worth including in the agent experience section of the deployment guide.

---

*Review if audio device management gets more granular controls in a future release*
