# Screen Recording

**Category:** Security and Compliance
**Applies To:** Standalone + embedded (Customer Service)
**Source:** [learn.microsoft.com/.../configure-screen-recording](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-screen-recording)

## What it does
Capture rep on-screen activity during customer interactions via a desktop companion app. Recordings upload to Dataverse for supervisor/admin review (QA, compliance, training). Reps can't view their own.

## Key facts
- Requires **desktop companion application** installed and running on the rep's local machine: without it, recordings are not uploaded to Dataverse
- Three security roles: **Screen Recorder** (reps, enables recording), **Screen Recording Supervisor** (view list only, no download), **Screen Recording Admin** (view + download)
- Enabled per experience profile: Productivity pane → Screen recording toggle
- **Recording types:** Automated (starts automatically on voice call accept, stops when call ends) or Manual (rep-initiated, continuous, cannot be paused)
- Recordings capped at **2 hours**: saves, uploads, and starts a new recording at the limit
- **Captures entire screen, not just the D365 application**: all on-screen content is recorded
- **No default retention policy**: recordings accumulate indefinitely until a Bulk Record Deletion job is configured
- Configure retention via bulk delete job on Screen Recordings table; also configure for Transcripts (separate job)

## When to use / skip
Use when the client needs full interaction capture for QA, regulated industry compliance, or dispute resolution beyond audio recording alone.

## Configuration decisions
- **Automated vs. manual recording**: automated for voice channel compliance; manual for on-demand QA capture
- **Retention period**: must be defined before go-live; agree with the client's legal/compliance team; configure the bulk delete job immediately

## Gotchas
- **Legal compliance is on the client.** Screen recording captures employee activity and may trigger employment law, privacy law, and customer consent depending on jurisdiction. Legal review before enablement: not a config task.
- **No default retention policy.** Storage costs explode without a bulk delete job. Configure retention on day one.
- **Desktop companion is an ongoing IT task.** Install on every rep's machine, keep current. Use endpoint management (Intune/SCCM). One-time installs create gaps.
- **Entire screen scope is broad.** Captures other apps, personal browser tabs, internal systems. Document this in employee disclosure/consent.

## Consultant notes

- Get legal review done before screen recording is enabled, not during UAT. Recording employee screens during work hours touches employment law (varies significantly by jurisdiction: UK, EU, US states all handle it differently), data protection obligations, and potentially works council or union agreements in unionised environments. This is a decision that needs to be documented as client-approved, not assumed to be acceptable because the feature exists.
- Configure the bulk delete job for the Screen Recordings table on day one of production. There is no default retention policy, and screen recordings are large files. Without a job running, storage costs will climb in the background and won't be obvious until someone notices the Azure bill. Treating retention as a post-go-live activity is a pattern that consistently causes storage incidents at the three to six month mark.
- The desktop companion app is an ongoing IT estate management task, not a one-time install. New reps, rebuilt machines, and OS updates will all create gaps in coverage over time. If the client doesn't have endpoint management (Intune, SCCM) already deploying and updating the companion app automatically, the screen recording coverage will degrade gradually without anyone noticing. This needs to be in the IT onboarding runbook and managed as ongoing infrastructure.

---

*Source last updated: 2026-03-05 | Check this: Screen recording expands to embedded deployment, or cloud-based recording option added*
