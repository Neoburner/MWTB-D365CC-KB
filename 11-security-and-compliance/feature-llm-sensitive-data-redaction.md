# LLM-Based Sensitive Data Redaction for Human Interactions

**Category:** Security and Compliance  
**Applies To:** Standalone / Embedded  
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/use-llm-based-sensitive-data-redaction-human-interactions

> **Status:** Planned — GA targeted September 2026. Not yet released; behaviour may change.

## What it does

Automatically redacts payment card information (PCI data) shared during live conversations between customers and agents — before the data reaches recordings, transcripts, logs, or analytics storage. Uses a large language model rather than rule-based pattern matching, so it catches PCI data expressed in natural speech, not just formatted card numbers.

## Key facts

- Targets PCI-scoped data in live agent-customer conversations (not just IVR/bot interactions)
- LLM-based approach handles spoken card numbers with filler words, partial repetitions, and non-standard formats — rule-based masking misses these
- Redaction happens in-flight, before storage — recordings, transcripts, and analytics artifacts receive the redacted version
- Complements the existing data masking feature (`feature-data-masking.md`), which handles structured DTMF input and text fields; this covers unstructured speech
- GA target: September 2026

## When to use / skip

Relevant on any implementation where agents take payments over voice or chat and the client is in PCI scope. If the client already routes payment capture to an IVR DTMF flow (which existing data masking covers), you may not need this. If agents are verbally handling card numbers at all — common in small contact centres that haven't invested in payment deflection — this closes a real compliance gap. Skip the conversation if the client is PCI-out-of-scope.

## Configuration decisions

- Confirm whether the client's voice and chat channels carry PCI data in live agent conversations — you need a data flow map before configuring anything
- Decide whether to run this alongside IVR DTMF payment capture or as the primary PCI control for agent interactions
- Understand what "redacted" means in your client's context: can supervisors access original transcripts for QA purposes, or is it redacted everywhere?
- Consider downstream impact on QA and analytics — LLM redaction will blank sections of transcripts that quality evaluators rely on

## Gotchas

- This is LLM-based, which means it has a false positive/negative rate — it won't catch every variation and will sometimes redact non-PCI content that sounds similar. Don't present it as a guaranteed PCI control without appropriate caveats to the client's compliance team
- Feature is not released yet. Don't promise this to clients in implementations that will go live before September 2026; treat it as a roadmap item
- Check whether the client's PCI QSA accepts AI-based redaction as a control — some assessors require certified PA-DSS or P2PE solutions. This may be a supplement, not a replacement, for those environments
- The interaction with call recording is important to confirm: if recording is paused during payment collection (a common pattern), this feature is less necessary; if recording runs continuously, this becomes the primary protection

## Consultant notes

- The compliance angle is the conversation opener, but the operational angle is often more compelling: supervisors and QA teams can review more transcripts without compliance risk, which improves coaching quality in PCI-scoped contact centres
- Don't conflate this with the existing DTMF data masking — they cover different surfaces. The combined story is: DTMF masking for self-service payment capture, LLM redaction for live agent payment handling
- Watch the September 2026 GA date relative to your project timeline; if a client is going live in Q3 2026 and this is on the design, get a firm commitment from Microsoft on availability before including it in the solution architecture

---

*Confirm GA release and verify QSA acceptance before including in any compliance architecture*
