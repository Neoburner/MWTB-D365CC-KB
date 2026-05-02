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
Include voicemail on most voice deployments — gives customers a way to leave a message when queues are busy or you're closed. Skip only if the client explicitly says no.

## Configuration decisions
- **Group vs individual voicemail vs both** — Match it to how the client operates.
- **Overflow thresholds and after-hours** — Set these in queue overflow settings.
- **Adding reps to the individual voicemail queue** — Required for direct voicemail. Easy to miss.

## Gotchas
- **Operating hours at the workstream level kill voicemail.** Set at that level and queue-level overflow never fires. Put operating hours at the queue level instead — very common gotcha.
- **Phone number format matters in routing rules.** Equals operator needs E.164 (+1XXXXXXXXXX); Contains works without the country code. Mix them up and voicemail routing fails in confusing ways.
- **Reps need to be in the individual voicemail queue.** If direct-number reps aren't in the Default Individual Voicemail Queue, voicemails never get delivered. Always verify this after setting up direct numbers.
- **IVR can't send to voicemail directly.** Customers can't go straight to voicemail from an AI agent — they hit the rep layer first. Design your call flow accordingly.

## Consultant notes

- The operating hours gotcha is one to verify on every voice deployment, not just when voicemail is the obvious priority. It's easy to set operating hours at workstream level "temporarily" during setup and forget to move them — and then voicemail silently never fires.
- Voicemail is almost always in scope even when the client hasn't mentioned it. Ask the question in discovery: "What happens when a customer calls outside of hours or when all agents are busy?" If the answer isn't thought through, voicemail is probably the solution.
- The IVR-to-voicemail path is a common client assumption that doesn't work. Customers can't go straight from an AI agent to voicemail — they have to hit the rep layer first. Design the call flow with that in mind or it'll surface as a gap in UAT.

---

*Source last updated: 2026-02-08 | Worth revisiting if individual voicemail prompts become customisable or voicemail routing to voice queues ships*
