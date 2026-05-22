# Headset Call Controls (Answer and Hang Up)

**Category:** Agent Experience
**Applies To:** Standalone / Embedded / Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/use-headset-answer-calls-hang-up-contact-center

## What it does
Extends headset hardware integration in Dynamics 365 Contact Center so agents can answer inbound calls and end both inbound and outbound calls using the physical call control button on a Microsoft Teams–certified headset. Previously, headsets only handled mute, unmute, and volume.

## Key facts
- Applies to Microsoft Teams–certified headsets only; non-certified headsets are not supported
- Answers inbound voice calls and ends inbound/outbound voice calls via headset button
- Existing mute, unmute, and volume controls are unchanged
- Enabled automatically — no administrator configuration required
- GA September 2026; no public preview date
- Scoped to voice calls within the Dynamics 365 Contact Center agent experience

## When to use / skip
You want this enabled if agents are handling high call volumes and currently need to reach for the screen to accept or end calls — the ergonomic gain is real and you'll hear about it in go-live feedback if it's missing. Skip worrying about it if your agents are primarily on digital channels or video, since it only applies to voice.

## Configuration decisions
- None. The feature is automatically enabled when a Teams-certified headset is connected and the agent is in the Contact Center agent app.
- Check whether your headset estate is Teams-certified before making commitments to agents about this capability.

## Gotchas
- Only Teams-certified headsets are supported. Generic USB headsets with call control buttons will not trigger the answer/hang-up behaviour. Agents with older hardware will still need on-screen controls.
- GA is September 2026 — this is a future capability. Don't commit to it for go-lives before that date.
- The feature works in the Contact Center agent experience; behaviour in embedded/third-party CRM configurations is not confirmed in the release plan documentation.

## Consultant notes

- Clients often have mixed headset estates — some Teams-certified, some legacy. Budget for a headset audit if this is being positioned as a go-live requirement; you don't want agents finding out on day one that their headset doesn't work.
- Worth raising in design sign-off if you're targeting a Sep 2026+ go-live: agents coming from traditional telephony platforms expect hardware call controls as standard, and this closes that gap.

---

*Worth revisiting once GA in September 2026 to confirm Teams-certified headset compatibility list and any embedded mode behaviour.*
