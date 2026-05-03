# Deep Noise Suppression

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/enable-deep-noise-suppression

## What it does
AI-powered background noise suppression for voice calls that filters unwanted audio from both incoming and outgoing streams. Enabled by an admin at the org level; representatives don't need to configure anything per-call.

## Key facts
- GA: February 19, 2026
- Enabled org-wide by admins — not a per-representative toggle
- Processes both incoming and outgoing audio streams
- Works within the Contact Center voice channel (ACS-based)
- No additional hardware or client software required
- Related to the "Set up microphone connection" configuration in admin center

## When to use / skip
Turn this on for any deployment where agents are working from home or open-plan offices. There's no real reason to leave it off — the processing overhead is minimal and the impact on noisy environments is significant. The only reason to skip it is if the client has a regulatory requirement to preserve raw audio without AI processing (rare, but worth asking).

## Configuration decisions
- Enable at org level: yes or no (default off)
- No workstream or queue-level granularity — it's all-or-nothing at the org level

## Gotchas
- It's an org-level toggle — you can't enable it for one team but not another. If the client has a mixed estate (some agents in quiet offices, some in noisy ones) it applies everywhere
- Doesn't affect recordings: suppression is applied to the live call audio, but check whether it affects the transcription quality — noise in the raw transcript can still degrade Copilot summaries
- If the client is testing call quality and hears unexpected audio artefacts, this feature being on is a plausible cause — worth noting in the test plan

## Consultant notes

- Straightforward to enable and low-risk, but worth surfacing to clients as a quality-of-life win they might not know about. Home-based agent deployments benefit most.
- Clients sometimes ask whether this replaces physical noise-cancelling headsets — it doesn't, it's complementary. The combination of good hardware and software suppression gives the best result.
- If you're doing a voice quality baseline assessment pre-go-live, enable this before you do it so you're measuring the production-equivalent setup.
- No licensing uplift required — it's included in the Contact Center voice channel.

---

*Check future waves for queue or workstream-level granularity if org-level toggle becomes a constraint*
