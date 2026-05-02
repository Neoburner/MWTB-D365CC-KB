# Service Agent in Microsoft 365 Copilot

**Category:** AI Agents
**Applies To:** Embedded (Customer Service)
**Source:** [learn.microsoft.com/.../configure-service-agent](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-service-agent)

## What it does
Extends Microsoft 365 Copilot with customer service data — cases, customer records, recent interactions. Reps can query this data through M365 Copilot without manually searching in D365. Also accessible within Copilot Service workspace.

## Key facts
- **Requires Microsoft 365 Copilot licences per user** — separate from D365 Customer Service licensing
- **English only** — other languages may surface in the UI but are not fully supported
- Setup requires two separate admin actions: M365 admin installs the Service app from Microsoft Marketplace; D365 admin adds M365 Copilot to the Customer Service environment
- **Two Copilot icons appear** in Copilot Service workspace when Service Agent is enabled alongside the standard D365 Copilot — this is a known preview behaviour
- Production-ready preview — subject to supplemental terms of use

## When to use / skip
Use if the client has M365 Copilot licences and reps need to query service data without switching apps. Skip if they don't have these licences — additive licensing that must be confirmed before committing.

## Configuration decisions
- Which users get M365 Copilot licences — this determines who can use Service Agent; typically a subset of the rep population given licensing cost

## Gotchas
- **Two admin teams must coordinate.** M365 admin installs the Service app; D365 admin adds M365 Copilot to the environment. May be different teams. Clarify ownership early — common delay.
- **English-only is a real constraint.** Don't pitch this as multilingual to clients with non-English reps.
- **Dual Copilot icon is confusing.** Warn reps upfront or it generates support tickets.

## Consultant notes

- Two admin teams needing to coordinate is the delay that catches projects. Confirm who owns M365 admin and who owns D365 admin at the start of the project. If they're different teams (common in enterprise), get them introduced early and document which step each team owns.
- Confirm the M365 Copilot licence count before positioning this feature. The licensing is per user and separate from D365, which often means a smaller rollout population than the client initially expects when they see the cost.
- English-only is a hard constraint worth calling out explicitly if the client has non-English speaking reps. Don't let multilingual assumptions survive into the design phase.

---

*Source last updated: 2026-04-07 | Check this after Service Agent exits preview, multilingual support is added, or licensing requirements change*
