# Voice Channel — Call Recording, Transcription, and Real-Time Translation

**Category:** Channels — Voice
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../voice-channel-configure-transcripts](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-configure-transcripts)

## What it does
Enables call recording (audio), transcription (live text), and real-time translation for voice conversations. Configured at the workstream level. Transcripts power Copilot summaries and post-call insights; recordings are accessible via Dataverse and downloadable via Power Automate.

## Key facts
- **Event Grid system topic must be registered first** — recording will not work without it, regardless of workstream config (see `voice-channel-configure-services`)
- **Audio/MPEG MIME types must be allowlisted** in Power Platform admin center before recordings are stored
- Options: Transcription only, or Transcription and recording
- Start modes: Automatic (starts on call connect) or Manual (rep triggers via button)
- Optional toggles: Allow rep to pause/resume; Auto-pause when customer is on hold
- Storage estimates: 20-min recording ≈ **10 MB**; 20-min transcript ≈ **40 KB**; max file size **512 MB**
- Copilot Studio IVR agents **always generate a transcript** in Copilot Studio regardless of these settings
- DTMF-only input is not included in Copilot Studio transcripts
- Transcript timestamps are grouped in 2-minute intervals — per-second timestamps not available

## When to use / skip
In scope for virtually all voice deployments — transcripts are required for Copilot post-call summaries. Recording is additionally needed for QA, compliance, and dispute resolution.

## Configuration decisions
- Automatic vs Manual start — Manual when some call content should not be recorded (PCI-scope calls, sensitive conversations); Automatic for uniform compliance recording
- Whether to enable pause/resume — adds rep control; required for PCI DSS cardholder data environments
- Auto-pause on hold — low-risk, worth enabling as default

## Gotchas
- **Event Grid is the most commonly missed prerequisite.** The workstream config looks complete but no recordings appear. Always verify Event Grid system topic registration as the first step in voice channel testing.
- **MIME type allowlisting is a separate Power Platform admin step.** Easy to overlook if the person configuring the workstream isn't also the Power Platform admin.
- **Consent and compliance is the client's legal obligation.** The system can play a consent announcement but whether it satisfies legal requirements is a legal question — not a D365 config question. Get written sign-off from their legal team before enabling automatic recording in regulated industries.
- **Storage costs accumulate at scale.** 1,000 calls/day × 20-min average ≈ 10 GB/day of recording data. Size Dataverse storage accordingly in the solution design.

---

*Source last updated: 2026-02-15 | Review when: Recording storage options change, or real-time translation language support expands*
