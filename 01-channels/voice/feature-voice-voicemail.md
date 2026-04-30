# Voice Channel — Voicemail

**Category:** Channels — Voice
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../voice-channel-voicemail](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-voicemail)

## What it does
Lets customers leave a recorded message when a queue is in overflow, operating hours are over, or a direct call to a rep goes unanswered. Voicemails are always transcribed and routed as work items through unified routing. Two types: group voicemail (queue overflow) and individual voicemail (direct rep call).

## Key facts
- Max recording length: **5 minutes**
- All voicemails are **always transcribed** — independent of voice channel transcription settings
- Voicemails route as **records** — they **cannot** be routed to voice queues
- IVR/AI agents **cannot offer voicemail** — the call must first escalate to the rep layer; voicemail fires when the rep is unreachable
- Individual voicemail prompt is **not customisable**
- OOB workstreams provided: Default Group Voicemail Workstream + Default Individual Voicemail Queue
- Phone number routing in route-to-queue rules: use E.164 format with **Equals** operator; use number without country code with **Contains** operator
- Use `msdyn_hascontent` to check for transcribed content before routing to avoid processing empty voicemails
- **Operating hours at the voice workstream level must be OFF** for queue-level overflow voicemail to work

## When to use / skip
Use on any voice deployment where the client wants customers to leave messages instead of abandoning when queues are busy or closed. Nearly always in scope unless the client explicitly doesn't want voicemail.

## Configuration decisions
- Group voicemail (overflow-triggered) vs individual voicemail (direct-rep-call) vs both — configure the scenarios that match the client's operational model
- Overflow conditions that trigger voicemail — defined in queue overflow settings; decide threshold and after-hours logic
- Whether to add reps to the individual voicemail queue — required for direct voicemail delivery; often missed

## Gotchas
- **Operating hours conflict.** If operating hours are set at the voice workstream level, they override queue-level overflow settings and voicemail never fires. Set operating hours at the queue level only when voicemail is in scope — this is a very common setup issue.
- **Phone number format mismatch in routing rules.** Equals requires E.164 (+1XXXXXXXXXX); Contains works without country code. Mixing operators and formats causes voicemail routing failures that are confusing to debug.
- **Reps must be added to the individual voicemail queue.** If direct-number reps aren't added to the Default Individual Voicemail Queue, voicemails are never delivered. Always verify this step after assigning direct inbound numbers.
- **IVR cannot offer voicemail directly.** Customers cannot be sent to voicemail from an AI agent/IVR — they must first reach the rep layer and find it unavailable. Design call flows with this constraint in mind.

---

*Source last updated: 2026-02-08 | Review when: Individual voicemail prompt becomes customisable, or voicemail routing to voice queues supported*
