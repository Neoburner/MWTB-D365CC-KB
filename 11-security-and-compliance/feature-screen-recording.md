# Screen Recording

**Category:** Security and Compliance
**Applies To:** Standalone + embedded (Customer Service)
**Source:** [learn.microsoft.com/.../configure-screen-recording](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-screen-recording)

## What it does
Captures a rep's full on-screen activity during customer interactions via a desktop companion application. Recordings upload to Dataverse and are reviewable by supervisors/admins for QA, compliance, and training. Reps cannot view their own recordings.

## Key facts
- Requires **desktop companion application** installed and running on the rep's local machine — without it, recordings are not uploaded to Dataverse
- Three security roles: **Screen Recorder** (reps, enables recording), **Screen Recording Supervisor** (view list only, no download), **Screen Recording Admin** (view + download)
- Enabled per experience profile: Productivity pane → Screen recording toggle
- **Recording types:** Automated (starts automatically on voice call accept, stops when call ends) or Manual (rep-initiated, continuous, cannot be paused)
- Recordings capped at **2 hours** — saves, uploads, and starts a new recording at the limit
- **Captures entire screen, not just the D365 application** — all on-screen content is recorded
- **No default retention policy** — recordings accumulate indefinitely until a Bulk Record Deletion job is configured
- Configure retention via bulk delete job on Screen Recordings table; also configure for Transcripts (separate job)

## When to use / skip
Use when the client needs full interaction capture for QA, regulated industry compliance, or dispute resolution beyond audio recording alone.

## Configuration decisions
- **Automated vs. manual recording** — automated for voice channel compliance; manual for on-demand QA capture
- **Retention period** — must be defined before go-live; agree with the client's legal/compliance team; configure the bulk delete job immediately

## Gotchas
- **Legal compliance is the client's responsibility.** Screen recording captures employee activity and may trigger employment law, privacy law, and customer consent obligations depending on jurisdiction. Legal review must happen before enablement — this is not a standard config task.
- **No default retention policy.** Storage costs grow indefinitely without a bulk delete job. Configure retention on day one — not as a Phase 2 item.
- **Desktop companion application is an ongoing IT management task.** It must be installed on every rep's machine and kept current. Include it in endpoint management (Intune/SCCM) — a one-time install approach will cause gaps as new reps join.
- **"Entire screen" scope has privacy implications.** Other applications, personal browser tabs, and internal systems visible on screen are all captured. Include this scope in employee disclosure/consent documentation.

---

*Source last updated: 2026-03-05 | Review when: Screen recording expands to embedded deployment, or cloud-based recording option added*
