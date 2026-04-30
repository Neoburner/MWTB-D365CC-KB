# Enhanced Dial Pad for DTMF Tones

**Category:** Voice
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/use-enhanced-dial-pad-dtmf-tones

## What it does
A redesigned dial pad that sends DTMF tones faster and more reliably during live voice calls. It removes redundant dialers from the UI and forwards DTMF inputs to external participants when a call is transferred.

## Key facts
- Enabled by admins in **Copilot Service admin center → Workspaces → Voice Call Experiences → DTMF Broadcast**
- Off by default — requires explicit enable
- Applies to all voice calls once switched on, not per-workstream
- DTMF tones reach external PSTN endpoints and IVR systems during transfers/consults
- GA'd April 2026

## When to use / skip
Use this if you're getting reports of DTMF inputs not registering during IVR navigation — particularly on transfers to payment systems or third-party IVRs. Also worth enabling if you're using the secure consult/transfer feature (DTMF to external endpoints is part of that flow).

Skip it only if your voice workloads have no IVR navigation or external PSTN transfers, though there's little reason not to enable it.

## Configuration decisions
- Enable globally via the DTMF Broadcast toggle — there's no per-workstream override
- Test in UAT before enabling in prod; confirm IVR digit recognition at the external endpoint is working correctly

## Gotchas
- If you're running the secure consult/transfer PSTN feature in parallel, DTMF Broadcast needs to be on for callers to navigate external IVRs during the secure leg. The two settings are independent; enabling one doesn't automatically enable the other.
- The old dial pad is removed when this is enabled — there's no way to run both side by side. If reps report UI confusion, it's because the layout changed, not a bug.

---

*Check again after the next wave if any per-workstream dial pad controls are introduced.*
