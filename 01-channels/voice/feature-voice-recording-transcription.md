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
Essential for almost all voice deployments. Transcripts are required for Copilot post-call summaries. Recording covers QA, compliance, and dispute resolution.

## Configuration decisions
- **Automatic vs Manual start** — Manual if some calls need to stay off the record (PCI calls, sensitive chats). Automatic for consistent compliance recording.
- **Pause/resume toggle** — Gives reps control. Required for PCI DSS if you're handling card data.
- **Auto-pause on hold** — Low risk, sensible default.

## Gotchas
- **Event Grid is the gotcha everyone misses.** Workstream config looks done but recordings never appear. Always register the Event Grid system topic first — it's the thing that actually makes it work.
- **MIME type allowlisting is a separate Power Platform admin task.** Easy to miss if the person building the workstream isn't also the Power Platform admin.
- **Consent and compliance is the client's legal problem, not yours.** The system can play an announcement, but whether that satisfies legal requirements is a legal question. Get written legal sign-off before you enable automatic recording in regulated industries.
- **Storage scales fast.** 1,000 calls/day at 20 min each ≈ 10 GB/day. Size the Dataverse storage properly in your solution design.

---

*Source last updated: 2026-02-15 | Worth revisiting if recording storage options shift or translation language support expands*
