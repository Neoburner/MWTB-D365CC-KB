# Reliable Post-Call Actions for Caller Hangups in Voice Agents

**Category:** Channels — Self-Service  
**Applies To:** Standalone / Embedded  
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/enable-reliable-postcall-actions-caller-hangups-voice-agents

## What it does

Sends a reliable hangup signal to Copilot Studio voice agents when the caller disconnects, so post-call flows (record updates, workflow triggers, logging) fire immediately on hangup rather than waiting for the bot flow to complete. Also distinguishes between caller-initiated hangups and system-initiated disconnections, which improves call abandonment analytics.

## Key facts

- GA: March 23, 2026
- Previously, caller hangup during a voice agent interaction could leave the flow in an uncertain state; post-call actions either didn't fire or fired late
- The hangup event is now a distinct, reliable trigger in the Copilot Studio flow — makers handle it explicitly in the flow design
- Distinguishes three termination types: caller hangup, agent hangup, and system disconnect
- Enables immediate downstream actions: Dataverse record updates, Power Automate triggers, outcome logging
- Affects voice agent flows built in Copilot Studio for IVR — not the human agent voice channel

## When to use / skip

If your voice agent flows include any post-call logic (writing outcomes to Dataverse, triggering follow-up workflows, updating case records), you need this. Without it, callers who hang up mid-flow leave incomplete records and silent failures in your automation. Skip only if your voice agents have no post-call processing at all — though that's unusual for anything beyond the simplest IVR.

## Configuration decisions

- Review existing voice agent flows and identify where post-call logic currently sits — you'll need to restructure flows to handle the hangup event explicitly
- Decide what constitutes a "meaningful" hangup vs. an early disconnect — the flow logic should handle both cases gracefully
- Confirm which Dataverse entities and workflows need to be triggered on hangup; coordinate with the CRM/data design team
- Consider what to write to the record when a caller hangs up mid-flow vs. completing the flow — partial completion records are different from clean completions

## Gotchas

- Existing voice agent flows won't automatically benefit from this — you need to add the hangup event handler to each flow. If you have multiple voice agents, that's a non-trivial update exercise
- The hangup signal fires immediately, but "immediately" means the downstream action starts immediately — Dataverse writes and Power Automate runs still take their normal time. Don't design anything that assumes instantaneous record availability
- If your post-call logic includes a transcript summary or call recording reference, make sure those assets are available before the flow tries to read them — hangup doesn't guarantee the transcript is finalised at the same moment
- System disconnects (e.g., dropped calls due to network issues) now also trigger the hangup path. Make sure your flow handles the distinction — you don't want to log a "customer ended call" outcome for a dropped connection

## Consultant notes

- This fixes a longstanding frustration for clients who have invested in voice automation: call outcomes were unreliable for any caller who hung up before the flow completed. The fix is technically straightforward but often surfaces flow design debt — you'll find flows that assumed completion before they assumed hangup
- Abandonment analytics become meaningfully more accurate with the caller vs. system disconnect distinction. Flag this to the analytics team early — it may change how they define and report IVR abandonment metrics
- The pattern of "fire post-call actions on hangup" is now standard practice; update any voice agent implementation playbooks or templates you're using to include the hangup event handler as a default step
- If the client is using this alongside the WFM quality management feature, accurate call outcomes on hangup improve the quality evaluation data pool

---

*Update voice agent flow templates to include hangup event handlers as a default from this wave onwards*
