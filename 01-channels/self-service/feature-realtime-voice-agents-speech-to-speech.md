# Real-Time Voice Agents (Speech-to-Speech IVR)

**Category:** Channels — Self-Service  
**Applies To:** Standalone / Embedded  
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/enable-real-time-voice-agents-voice-driven-interactions

## What it does

Real-time voice agents let you build speech-to-speech IVR experiences in Copilot Studio using OpenAI's gpt-4o-realtime model via Microsoft Foundry. The caller talks naturally, the AI responds in real-time audio — no DTMF menus, no turn-by-turn text intermediary. GA from April 2026.

## Key facts

- Built and deployed entirely within the Copilot Studio authoring experience — same tooling as standard voice agents
- Powered by OpenAI gpt-4o-realtime through Microsoft Foundry (Azure-hosted); data stays within the Microsoft trust boundary
- Designed for low-latency, natural voice interactions — Microsoft targets responsiveness comparable to human conversation
- Supports core IVR scenarios: intent capture, routing decisions, simple self-service tasks
- Separate from standard Copilot Studio IVR voice agents (which use TTS/STT with a text reasoning layer); this uses a native audio-to-audio model
- No DTMF fallback baked in by default — you design the interaction model

## When to use / skip

If your client's IVR containment rate is bottlenecked by unnatural, stilted bot conversations, this is worth evaluating — the speech-to-speech model handles interruptions and conversational repair better than the standard STT/TTS pipeline. Skip it if your client's IVR is handling structured, menu-driven calls well and you don't have a clear containment problem to solve. Also skip if the client is in an early routing phase — get the routing and basic self-service working first, then layer this in.

## Configuration decisions

- Which IVR scenarios to target with real-time voice vs. standard voice agents — don't migrate everything at once
- What happens at handoff: real-time voice agents still escalate to the queue, so your routing configuration doesn't change materially
- Foundry model access: confirm the client's Azure subscription and region support gpt-4o-realtime through Foundry
- Latency tolerance: the model is low-latency but not zero-latency — check whether your client's call quality SLA accounts for the added inference time

## Gotchas

- This is a distinct authoring experience within Copilot Studio, not a toggle on existing voice agent flows — you're building new bots, not upgrading old ones
- "Iterate and optimize continuously" in the Microsoft docs means you can update the agent without a full republish cycle, but it doesn't mean zero-downtime deploys — test in a dev environment
- Real-time voice uses substantially more AI credits per interaction than standard IVR — factor this into licensing conversations. The WFM AI credit estimation feature can help project consumption
- Microsoft's geo-availability for Foundry gpt-realtime models is narrower than standard Azure OpenAI regions; check the Feature Geography report before committing to clients in non-US regions

## Consultant notes

- Clients will want to use this for everything once they see a demo. Frame it early: real-time voice agents excel at conversational self-service (e.g., account queries, booking changes) but add cost and complexity that's not justified for simple IVR deflection of "press 1 for billing"
- Watch the credit consumption angle carefully — this will catch clients out at renewal if the design is sloppy. Get an estimate from WFM forecasting before signing off on the design
- The Copilot Studio authoring experience is still the same canvas as before; what changes is the underlying model. If your team is comfortable building standard voice agents, the learning curve is lower than it looks
- Post-go-live, you'll want to monitor latency and abandonment separately for real-time voice agent queues — the user experience failure mode is different (callers hanging up when the AI pauses to think) rather than the standard bot failure mode (misunderstood intents)

---

*Worth revisiting as Microsoft expands the scenario coverage and region availability through the rest of 2026 wave 1*
