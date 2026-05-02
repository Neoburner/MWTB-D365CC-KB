# Cancel Voice Consult with External Number

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/cancel-voice-consult-external-number

## What it does
Reps can now cancel a consult or transfer attempt while the call is still ringing or connecting — including to external PSTN numbers, Teams users, and other platforms. Previously, cancelling was only supported for consult-to-queue; everything else required waiting for timeout or answer.

## Key facts
- GA'd April 13, 2026
- Enabled automatically — no admin configuration required
- Works across consult-to-external-number, consult-to-Teams-user, and consult-to-queue flows
- Cancel button appears in the rep UI during the connecting/ringing phase
- The customer call is not dropped when the consult is cancelled; the rep continues the original call

## When to use / skip
This is an automatic platform improvement — you don't decide whether to use it. It's there in the UI. What matters is making sure your reps know it exists, especially in environments with frequent warm transfers to external PSTN numbers where dialling the wrong number used to mean an awkward wait.

## Configuration decisions
- None. It's on by default.
- Worth including in rep training materials so people know they can cancel rather than waiting.

## Gotchas
- The feature extends cancel to *other* transfer flows, but the behaviour for consult-to-queue was already there. Don't conflate them in training docs — reps who have been using consult-to-queue cancel will find this familiar; the new bit is the extension to external numbers.
- On slow network connections, the "connecting" phase can be very brief. Reps need to act quickly if they spot the wrong number. No second chance once the call connects.

## Consultant notes

## Consultant notes

- Nothing to configure here — include it as a one-liner in rep training release notes for any deployment upgrading after April 2026. Agents who've been waiting for consult timeouts will appreciate knowing it exists.
- The edge case to document for your QA team: if a rep cancels a consult leg that was already in a secure (paused recording) state, verify that recording resumes correctly on the original call. The interaction between cancel and the recording pause/resume logic is worth one UAT test case.


---

*Revisit after 2026 wave 2 to see if cancel is extended to mid-call scenarios.*
