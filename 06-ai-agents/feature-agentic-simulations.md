# Agentic Simulations

> **Status:** Public Preview — behaviour may change.

**Category:** AI Agents
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-simulation-agent

## What it does
A testing tool that generates AI-driven conversations to exercise your AI agents, routing flows, and channel configuration before they go live. You describe the test you want in a natural-language prompt and it spins up simulated callers that actually run through the workstream. In preview it's voice inbound only.

## Key facts
- Voice channel, inbound workstreams only in preview. No messaging, no outbound.
- English language only.
- Driven from the **Agentic Simulation** tile on the Copilot Service admin center Home page.
- A prompt can request up to five conversations; the system runs at most two concurrently.
- One simulation at a time per org — you can't queue or parallelise runs.
- Each ~3-minute simulation burns roughly 40 Copilot Studio AI credits, varying with dialogue speed and complexity. Billed under **D365 Contact Center Agentic Simulation** in the Power Platform admin center.
- Unaccepted calls drop after 5 minutes; accepted calls are capped at 5 minutes.
- DTMF isn't supported in simulated calls.
- You watch runs live in the Ongoing Conversations report and review results (prompt, status, metrics) in the Simulation Run History page. Transcripts and recordings land in the closed conversation form like any real call.
- Needs System Administrator or Omnichannel Administrator, a provisioned voice channel, and a phone number configured for simulation.

## When to use / skip
Use it during build and pre-go-live to prove routing rules and voice agent behaviour without rounding up people to make test calls. It's most useful when you've got a voice agent or non-trivial inbound routing you want to stress before UAT. Skip it if you're not on voice yet — there's nothing for it to drive on messaging in preview.

## Configuration decisions
- Which phone number to dedicate to simulation, and which workstream that number lands on — the prompt must name the number that should receive the call.
- Whether you've configured representatives and routing rules realistically enough for the simulation to mean anything; an empty environment gives you an empty result.
- Who gets the admin role to run simulations and own the credit spend.
- How many conversations per run, given the two-concurrent cap and the per-run credit cost.

## Gotchas
- The credits aren't free and they add up fast — 40-ish per three-minute run, and a five-conversation prompt is five runs' worth of dialogue. Tell whoever owns the Copilot Studio capacity before you start hammering it, or you'll get a surprised email when the environment's credit line moves.
- The caller number is a system default per region — you don't get to spoof a specific customer number, so anything in your routing that keys off caller ID won't behave the way a real call would.
- One run per org at a time means this doesn't scale to a "run the whole regression suite overnight" pattern. It's interactive testing, not a CI gate.
- Results are only as realistic as the environment. If your reps and routing aren't set up properly the calls just fall through, and the run tells you nothing useful.
- DTMF being unsupported means any IVR path that depends on keypad input can't be tested this way — you can only validate the speech-driven paths.

## Consultant notes

- Scope this as a build-phase tool, not a client-facing demo. Clients hear "simulation" and picture a load-testing rig; it's really a way to sanity-check a voice agent and its routing with realistic dialogue. Set that expectation early or you'll be managing disappointment.
- The credit consumption is the thing that catches people out. On projects where Copilot Studio capacity is tight, agree a testing budget up front — it's very easy for an enthusiastic implementer to chew through a chunk of the environment's credits in an afternoon of iterating on a voice agent.
- It doesn't replace UAT with real humans on real handsets. The DTMF gap and the fixed caller number mean there are whole classes of behaviour it can't cover. Use it to shorten the feedback loop on agent and routing config, then still do proper end-to-end calls before go-live.
- Sequencing: there's no point running this until the voice channel is provisioned, a number is wired to the workstream, and you've got at least a skeleton of reps and routing in place. Trying it on a half-built environment is the most common reason a first run looks broken.

---

*Public preview — voice-only for now. Worth revisiting once messaging and outbound land, and once DTMF support arrives, since that's the obvious next gap to close.*
