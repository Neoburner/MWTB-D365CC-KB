# Consent-Based Recording of Voice Calls

**Category:** Voice
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/use-consent-based-recording-voice-calls

## What it does
Gives organisations a mechanism to capture explicit customer consent for call recording at the start of a voice interaction with a voice agent, and honours that consent decision through any escalation to a human rep. If a customer declines, recording and transcription are suppressed for the entire conversation — including after transfer.

## Key facts
- GA'd April 2026; opt-in — requires admin enablement in Copilot Service admin center
- Consent is captured by the voice agent (IVR/Copilot Studio bot) at the start of the call
- If consent is declined: recording is off, transcription is off, and the rep cannot start, pause, or view transcripts
- Consent decision travels with the conversation through escalation — the rep inherits the customer's choice, not their own preference
- Targeted at GDPR and similar voice recording compliance obligations

## When to use / skip
Use this on any deployment where regulatory compliance requires documented consent before recording — common in UK, EU, and other jurisdictions with two-party consent laws. If your legal team has flagged recording compliance as a requirement, this is the solution.

Skip it if you're in a jurisdiction where recording disclosure is achieved by a static IVR prompt ("this call may be recorded") and no opt-out is required. The consent mechanism adds flow complexity; if you don't need it, don't add it.

## Configuration decisions
- Enable in Copilot Service admin center — the exact path isn't yet fully documented in GA docs, but it's in the recording/compliance section
- Design the consent prompt script: what the voice agent says, what key press or voice response counts as consent, and what happens next if the customer declines
- Decide what the rep experience looks like when recording is suppressed — reps should know why they can't access transcripts so they don't raise a support ticket

## Gotchas
- The feature works end-to-end only when you have a Copilot Studio voice agent at the front of the call. If callers can reach a rep directly (no IVR), the consent capture step doesn't fire. Don't deploy this as your sole compliance mechanism if you have any direct-to-rep paths.
- Declined consent means no transcription for the entire session. AI features that depend on transcription (Copilot summaries, sentiment analysis, real-time suggestions) will be unavailable for those calls. Factor that into your quality and reporting expectations.
- "Consent travels through escalation" sounds clean but requires the voice agent to pass the consent flag correctly in the context handoff. Test this explicitly in UAT — the context variable name matters and varies by Copilot Studio implementation.

---

*Worth revisiting as regulators clarify AI-generated transcript requirements — the consent model may need extending to cover AI-derived data, not just the raw recording.*
