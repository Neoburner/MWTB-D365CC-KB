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
Use custom MOH to reinforce brand, reduce perceived wait time, or meet accessibility standards (music + periodic queue position announcements). Skip if your hold times are under 30 seconds — not worth the effort.

## Configuration decisions
- **Audio source** — Microsoft default, branded recording (company jingle), or copyright-free library.
- **Audio length** — 30–90 seconds typical; system loops it, so 1–2 min prevents obvious repetition.
- **Mono vs. stereo** — Mono saves file size; stereo doesn't matter much in a queue context.
- **Volume normalisation** — Audio gets normalised. Adjust your source file levels before upload if you need emphasis.
- **Fallback testing** — Make sure the Microsoft default is acceptable if your custom file fails.
- **Accessibility** — If there's speech in the audio, provide captions or transcripts (WCAG).

## Gotchas
- **Corrupt audio files fail silently.** Truncated uploads, wrong format — always test by calling in yourself.
- **MOH changes apply immediately to in-flight calls.** Customers mid-hold hear the new audio kick in. No graceful transition.
- **Custom audio URLs are private.** Sharing them with non-admins requires Azure Blob Storage permission grants.
- **File size limits mean compression.** Anything longer than ~3 minutes has to be compressed; heavy compression kills quality.
- **Uploads overwrite with no version history.** Keep local backups of your audio files.
- **Audio glitches if the Azure region is far away.** No way to specify which region hosts your file.
- **MOH cannot be turned off.** Calls always hear something — Microsoft default if you don't upload custom.

---

*Source last updated: 2026-04-30 | Worth revisiting if audio storage limits increase or spatial audio ships*
