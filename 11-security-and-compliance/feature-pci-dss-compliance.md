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
- Screen recordings (RPA/automation video) are never captured during voice or chat by default—you must explicitly enable screen recording on an agent
- Payment data must NOT be typed into the agent's system; instead, use a PCI-compliant IVR or payment gateway to collect card details, then pass a token to Dynamics
- The shared responsibility model: Microsoft secures the infrastructure, but you must ensure payment IVR is isolated from D365 Contact Center and you apply retention policies

## When to use / skip
Use D365 Contact Center for payment-related conversations only if you implement a separate PCI-DSS Level 1-certified payment collection system (e.g., Twilio Authy, AWS Payment Cryptography, or a dedicated PCI gateway). Do NOT capture full card numbers, expiration dates, or CVVs in Dynamics. Skip scenarios where you expect agents to manually type card details into the contact center UI; that architecture violates PCI-DSS and will fail audit. If you need full chat or voice with card data, use a headless payment API integrated at the channel layer.

## Configuration decisions
- Implement voice sensitive variables in Copilot Studio to mask card numbers in all customer-facing post-interaction summaries
- Enable regex-based chat masking rules to strip card numbers from chat transcript logs (pattern: \d{4}[\s-]?\d{4}[\s-]?\d{4}[\s-]?\d{4})
- Set up DTMF suppression in all IVR payment flows (Configure Audio > Suppress DTMF Tones = Yes)
- Route all payment collection to a separate PCI-certified third-party service (do not build payment collection in Copilot Studio or Dynamics)
- Apply Azure Blob Storage retention policies to purge recordings after compliance hold period (typically 12 months)
- Document the data flow: Contact Center -> IVR Handoff -> External PCI System -> Token Back to Dynamics

## Gotchas
- Sensitive variable masking does NOT retroactively mask already-recorded audio; if an agent records a conversation with card data, it is captured
- Chat masking rules are applied only to the stored transcript, not to live chat during the conversation; agents may see unmasked data in real-time
- DTMF suppression in voice flows suppresses the tones in the recording, but agents on the call may still hear the tones live
- If you store payment tokens in custom Dynamics tables, those tables must also be included in your PCI scope audit
- Azure Communication Services recordings are stored outside the Dataverse boundary; you must manage ACS data residency separately
- Agents with direct access to Azure Blob Storage or Dataverse can bypass masking rules; restrict access to recording storage

---

*Source last updated: 2026-04-30 | Review when: PCI-DSS requirements update or Microsoft releases native payment tokenization*
