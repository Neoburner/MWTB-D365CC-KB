# Voice Biometrics and Anti-Fraud Agent

**Category:** Security and Compliance
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/use-voice-biometrics-authenticate-increased-security

> **Status:** Public Preview — Aug 2026 · GA — Sep 2026. Behaviour may change.

## What it does
An authentication and anti-fraud agent that verifies a caller's identity by their voiceprint. It enrols and verifies callers in both human-to-AI and human-to-human voice conversations, and sits inside a wider multi-factor strategy alongside one-time passwords and knowledge-based challenges.

## Key facts
- Public preview Aug 2026, GA Sep 2026 — not available before then
- Native to the D365 Contact Center and Copilot Studio voice agent platform, so it works in voice agent (IVR) flows and in calls handled by a live rep
- Enabled and configured org-wide from Customer Service Admin Center
- Ships with customisable call flows for voice enrolment, verification, and SMS OTP
- Fraud analyst tools surface in a customer-facing app; agent skills are exposed to Copilot Studio bot authors
- Includes fraud case management and prebuilt performance dashboards for auditing and reporting
- Voice biometrics is one factor — Microsoft positions it as part of MFA, not a standalone gate

## When to use / skip
Use it if you take high volumes of voice calls that touch account-sensitive data and your current caller verification is knowledge-based questions eating handle time. Pre-authenticating in the IVR before the caller reaches a rep is the real win — it shortens calls and cuts the "confirm your date of birth" ritual. Skip it if you're messaging-only, or if your compliance posture won't accept voiceprints as an identity factor (some regulators and works councils won't).

## Configuration decisions
- Enrolment path: how and when callers record their voiceprint (active enrolment prompt vs. passive capture on a prior call)
- Which factors you combine — voice alone, voice + SMS OTP, voice + knowledge-based challenge — and the risk thresholds for each
- Where verification runs: in the voice agent flow, at rep handoff, or both
- Who gets the fraud analyst tools and dashboards, and how fraud cases are triaged
- Consent capture and retention policy for biometric data

## Gotchas
- Biometric data is special-category personal data under GDPR and several US state laws. You need explicit consent to enrol and a lawful basis to store voiceprints — get privacy and legal in the room before you scope this, not after.
- It's a preview until Sep 2026. Don't build a go-live authentication design around it if you're launching before GA.
- Voiceprints degrade with a cold, a bad line, or background noise. Plan the fallback factor for when verification fails, or you'll trap legitimate callers.

## Consultant notes

- Clients hear "voice biometrics" and assume it replaces authentication entirely. It doesn't — it's one factor in an MFA flow. Scope it as a friction-reducer and fraud-signal, not a single gate, or you'll set the wrong expectation with the security stakeholders.
- The privacy workstream is the long pole, not the config. Biometric consent, retention, and the right-to-erasure story for voiceprints will take longer to sign off than the call-flow build. Start that conversation at scoping.
- Enrolment coverage is the operational risk post-go-live: the feature only helps callers who've enrolled, so early on most calls still hit the fallback factor. Model the ramp and don't promise handle-time savings on day one.
- It leans on the Copilot Studio voice agent platform, so it's realistically only worth it if you're already committed to voice agents / enhanced voice. On a bare telephony deployment the dependency chain is heavier than it first looks.

---

*Public preview — revisit at GA (Sep 2026) to confirm final config surface, dashboards, and any change to the consent model.*
