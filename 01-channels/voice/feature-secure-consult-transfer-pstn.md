# Secure Consult and Transfer for PSTN Numbers and IVR

**Category:** Voice
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/secure-consult-transfer-pstn-numbers-ivr

## What it does
When a rep consults or transfers a call to an external PSTN number (e.g. a payment processor or verification IVR), recording and transcription are automatically paused. The customer can send DTMF tones to the external system. When the secure leg ends, normal recording resumes if it was active.

## Key facts
- Public preview March 16, 2026; GA June 2026
- Enabled by admins: requires configuration in Copilot Service admin center
- Two core behaviours: automatic recording/transcription pause on external consult/transfer, and DTMF passthrough to the external endpoint
- Works with external PSTN numbers; the feature name references IVR but the mechanism is the PSTN dial-out
- DTMF Broadcast (enhanced dial pad) must also be enabled for the customer to send DTMF during the secure leg: the two features work together

## When to use / skip
Use this for any voice flow that transfers customers to a payment IVR, identity verification system, or any external system where they'll enter sensitive data (card numbers, PINs, SSNs). Without it, those inputs are recorded, which is a PCI-DSS and GDPR problem.

Skip it if your voice flows are self-contained within D365 Contact Center and never route customers to external PSTN endpoints for sensitive data collection.

## Configuration decisions
- Enable the feature in admin center: admin must explicitly turn this on
- Confirm DTMF Broadcast is also enabled (separate setting); without it, customers can't navigate the external IVR
- Define which external numbers/patterns trigger the secure leg: check if there's allowlisting or if it applies to all PSTN transfers
- Decide how to surface the "paused recording" state to reps so they understand why their transcript went quiet

## Gotchas
- This is in public preview until June 2026: if you're planning a go-live before then, check whether your client needs GA stability. Preview features can change.
- The automatic pause applies to the *external* consult leg. If the call comes back to the rep after the secure leg, recording resumes: but only if it was active before. Make sure the rep understands the recording state can change within a single call.
- DTMF passthrough to external endpoints requires Enhanced Dial Pad (DTMF Broadcast) to be enabled separately. These are two distinct admin settings. Easy to miss one when the other is working.
- If a rep accidentally consults to the wrong external number and then cancels the consult (using the new cancel feature), recording behaviour on the cancelled leg needs testing. Don't assume the recording pause/resume is perfectly atomic on cancel.

## Consultant notes

## Consultant notes

- PCI DSS is almost always the business driver here, and that means your compliance team needs to validate the implementation, not just the project team. Get the PCI requirement documented before designing the flow: the scope of what counts as a "secure leg" may be broader than just card payments.
- Don't put this in a production scope before June 2026 GA if the client has zero tolerance for preview behaviour changes. It's close to GA but close isn't there. For clients who need PCI compliance day one, either scope around it or get explicit sign-off that preview in production is acceptable.
- The DTMF Broadcast dependency is the most common configuration miss. Both settings are independent, both need enabling, and both need testing end-to-end. Put them as a paired item on your admin checklist.


---

*Revisit at GA (June 2026) to confirm admin configuration steps are fully documented and check if there are any allowlisting requirements for external PSTN targets.*
