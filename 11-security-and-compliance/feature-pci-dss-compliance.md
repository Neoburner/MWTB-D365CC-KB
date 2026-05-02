# PCI-DSS Compliance

**Category:** Security
**Applies To:** Standalone
**Source:** Expert knowledge; no dedicated MS Learn page

## What it does
D365 Contact Center can support PCI-DSS compliance for payment card conversations through a combination of native masking (voice sensitive variables, chat regex rules) and architectural controls (handoff to external PCI-compliant IVR, DTMF suppression). However, the system itself is not certified PCI-DSS Level 1; instead, it provides tools to prevent payment data from being stored in transcript or recording logs, pushing the burden to external PCI-compliant payment processors.

## Key facts
- Voice sensitive variables in Copilot Studio mask card numbers in agent-visible notes but NOT in the audio recording itself
- Chat regex rules mask card numbers in chat transcripts at storage time, but not during live transmission
- DTMF tone suppression in IVR voice flows prevents keypad tones from being captured in the voice recording when agents transfer to payment collection
- Azure Communication Services stores voice recordings in Azure Blob Storage; you must apply your own retention policies to purge recordings
- Screen recordings (RPA/automation video) are never captured during voice or chat by default: you must explicitly enable screen recording on an agent
- Payment data must NOT be typed into the agent's system; instead, use a PCI-compliant IVR or payment gateway to collect card details, then pass a token to Dynamics
- The shared responsibility model: Microsoft secures the infrastructure, but you must ensure payment IVR is isolated from D365 Contact Center and you apply retention policies

## When to use / skip
Use for payment conversations only with a separate PCI-DSS Level 1 payment system (Twilio Authy, AWS Payment Crypto, dedicated gateway). Never capture card numbers, expiry, CVV in Dynamics. Skip if agents manually type card details into the UI, violates PCI-DSS. For full chat or voice with card data, use a headless payment API at the channel layer.

## Configuration decisions
- Implement voice sensitive variables in Copilot Studio to mask card numbers in all customer-facing post-interaction summaries
- Enable regex-based chat masking rules to strip card numbers from chat transcript logs (pattern: \d{4}[\s-]?\d{4}[\s-]?\d{4}[\s-]?\d{4})
- Set up DTMF suppression in all IVR payment flows (Configure Audio > Suppress DTMF Tones = Yes)
- Route all payment collection to a separate PCI-certified third-party service (do not build payment collection in Copilot Studio or Dynamics)
- Apply Azure Blob Storage retention policies to purge recordings after compliance hold period (typically 12 months)
- Document the data flow: Contact Center -> IVR Handoff -> External PCI System -> Token Back to Dynamics

## Gotchas
- Sensitive variable masking doesn't retroactively mask recorded audio: if an agent records card data, it's captured.
- Chat masking rules apply only to stored transcripts, not live chat. Agents may see unmasked data in real-time.
- DTMF suppression suppresses tones in recordings, but agents hear live tones during the call.
- Payment tokens in custom Dynamics tables must be in PCI scope audit.
- ACS recordings are outside Dataverse: manage ACS residency separately.
- Agents with direct Blob Storage or Dataverse access can bypass masking. Restrict recording storage access.

## Consultant notes

- D365 Contact Center is not PCI-DSS Level 1 certified as a platform. The correct architecture for payment handling is to route card data collection through an external PCI-compliant payment system and pass a token back to D365. This is a design conversation that needs to happen with the client's compliance team before any payment flow is built: not after the build is complete. If a client is expecting D365 to handle card numbers directly, that expectation needs to be corrected early.
- The distinction between what masking does in chat (stored transcript only, not the live session) and what it does in voice (pauses recording and transcription) is important for the compliance story. Agents handling chat payments can still see unmasked card numbers during the live conversation: masking only protects the stored record. For clients who need agents to never see card data, the design must route payment collection through an external IVR or iframe payment widget, not through the D365 chat interface.
- Get a QSA (Qualified Security Assessor) involved if the client is targeting formal PCI-DSS certification. This doc covers the technical controls available in D365, but formal PCI certification requires documented architecture, scoping decisions, and evidence that the controls work as claimed. That's a compliance exercise that sits outside the Contact Center implementation scope.

---

*Source last updated: 2026-04-30 | Check this: PCI-DSS requirements update or Microsoft releases native payment tokenization*
