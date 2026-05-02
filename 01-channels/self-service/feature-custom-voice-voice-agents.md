# Custom Voice for Voice Agents

**Category:** Channels — Self-Service / IVR
**Applies To:** Standalone
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/bot-scenario-configure

## What it does
Lets you assign a custom-trained neural voice to a Copilot Studio IVR agent so it speaks in a brand-specific voice rather than a generic Azure text-to-speech voice. Went GA on February 27, 2026.

## Key facts
- Built on Azure AI Speech custom neural voice (CNV) technology
- Requires as few as 50 recorded voice samples to train a custom voice model
- Limited access only — Microsoft must approve your use case before you can deploy a custom neural voice; this is not self-serve
- Ethical use and written consent from the voice talent are mandatory prerequisites
- The custom voice is selected at the Copilot Studio agent level — you don't configure it in Copilot Service admin center
- One voice per agent; you can have different voices on different workstreams by using different agents
- Works on voice channel only; digital messaging channels are unaffected

## When to use / skip
Use this if your organisation has a strong brand voice and the automated IVR experience is customer-facing enough to justify the setup overhead and approval process. Skip it for internal helpdesk IVR or any scenario where call volume doesn't warrant the Azure AI Speech investment. The approval process takes time — don't promise this feature to a client during project scoping unless you've already started the Microsoft application.

## Configuration decisions
- Which team owns the Azure AI Speech resource and the custom voice training — this sits outside D365 administration
- Which specific agent workstreams will use the custom voice vs the default voice
- Who is the voice talent and have you got their signed consent?
- Testing environment: custom voices aren't instantly swappable, so plan UAT around this

## Gotchas
- **Limited access gate is real.** You apply through Azure AI Speech; there's no workaround. Don't scope custom voice into a project timeline without confirming approval status.
- The training pipeline takes time even after approval — not a point-and-click exercise.
- Copilot Studio preview environments won't always have the custom voice available; test in the target environment.
- If the Azure AI Speech resource is in a different region than your D365 Contact Center tenant, you may hit latency or data residency constraints.
- **Not the same as voice style.** Standard voice profiles in D365 already let you tweak speaking speed, pitch, and style — custom voice is a completely separate thing requiring CNV training. Make sure the client actually needs CNV before going down that path.

## Consultant notes

- The limited access approval gate is a hard project dependency. Don't scope custom voice into a project timeline without first confirming that the Microsoft application has been submitted and ideally approved. The standard voice profiles (speaking speed, pitch, style) cover the vast majority of brand requirements without needing CNV — check whether those suffice before going down this path.
- Confirm the client actually needs custom neural voice vs standard voice customisation. "Custom voice" in client conversations often means "can we make it sound less robotic" — which standard voice styles can handle. CNV is for "we want our brand voice actress to voice the IVR" — a fundamentally different requirement.
- Azure AI Speech resource ownership needs to be confirmed early. This sits outside D365 administration and involves both an Azure admin and a separate approval/training pipeline. Two teams minimum, both need to know their part.

---

*Worth revisiting as Microsoft expands the approved use case list — currently quite restricted to enterprise and regulated industry scenarios.*
