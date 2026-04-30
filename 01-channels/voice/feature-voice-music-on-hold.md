# Music on Hold

**Category:** Voice Features
**Applies To:** Standalone / Embedded
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/music-on-hold

## What it does
Music on Hold (MOH) is the audio played to customers while they wait in queue or are placed on hold by an agent. D365 Contact Center supports uploading custom audio files (e.g., branded hold messages, copyright-free background music) or using Microsoft-provided default audio. MOH plays continuously on loop until the customer reaches an agent or abandons the call.

## Key facts
- Default Microsoft audio is a generic tone loop; uploading custom audio requires an .mp3 or .wav file (max 10 MB)
- Custom audio is stored in Azure Blob Storage associated with your ACS resource; cost is negligible (<$1/month for typical usage)
- MOH starts immediately when a call enters the queue; no silence gap
- If custom audio fails to load or is corrupted, the system falls back to Microsoft default automatically
- MOH volume is normalised by ACS; cannot be adjusted per-call or per-queue
- Uploading audio requires administrative access to D365 Admin Centre (Voice Channel Configuration)
- Audio format requirements: PCM 16-bit, mono or stereo, 8 kHz or 16 kHz sample rate (MP3 must be CBR 128 kbps)
- MOH does not interrupt for agent status updates or queue position announcements; announcements overlay MOH

## When to use / skip
Use custom MOH to reinforce brand identity, reduce perceived wait time, or comply with accessibility standards (e.g., music + periodic "you are X in queue" announcements). Skip if your contact centre has very short average hold times (<30 sec) where MOH impact is minimal.

## Configuration decisions
- **Audio source:** Choose between Microsoft default, a branded recording (e.g., company jingle), or copyright-free library audio
- **Audio length:** Typically 30–90 seconds; system loops the audio, so a 1–2 minute loop prevents unnatural repetition
- **Mono vs. stereo:** Use mono to reduce file size; stereo has minimal perceptual difference in a queue context
- **Volume normalization:** Audio is normalised; if you need emphasis on certain phrases, adjust source audio levels before upload
- **Fallback handling:** Test fallback to default audio; ensure it's acceptable if custom upload fails
- **Accessibility:** If using audio with speech, ensure captions or transcripts exist per WCAG guidelines

## Gotchas
- Audio file corruption (truncated uploads, wrong format) causes silent failures; always test the uploaded file by calling in
- Changing MOH affects all calls in queue immediately; no graceful rollover for in-flight calls (they hear the new audio mid-hold)
- Custom audio URLs are not publicly accessible; sharing the URL with non-admins requires permission grants in Azure Blob Storage
- File size limits (10 MB) mean audio longer than ~3 minutes must be compressed; high compression can degrade quality
- Uploading a new audio file overwrites the old one; no version history, so keep local backups of audio sources
- Audio playback may glitch if the Azure region hosting audio is geographically distant from the agent; no option to specify audio region
- MOH cannot be disabled; calls will always hear some audio (Microsoft default if no custom upload)

---

*Source last updated: 2026-04-30 | Review when: Audio storage limits increase or spatial audio support is added*
