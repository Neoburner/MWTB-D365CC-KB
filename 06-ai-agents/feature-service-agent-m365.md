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
Use when the client has M365 Copilot licences and reps need to query service data without switching between apps. Skip if the client doesn't have M365 Copilot licences — this is additive licensing that must be confirmed before committing to delivery.

## Configuration decisions
- Which users get M365 Copilot licences — this determines who can use Service Agent; typically a subset of the rep population given licensing cost

## Gotchas
- **Two admin teams must coordinate.** The M365 admin (installs Service app from Marketplace) and D365 admin (adds M365 Copilot to the environment) may be in different teams. Clarify ownership early — this is a common delay point.
- **English-only is a real constraint for international deployments.** Don't position this as multilingual-capable to clients with non-English rep populations.
- **Dual Copilot icon is expected but confusing.** Warn reps proactively; otherwise it generates support tickets.

---

*Source last updated: 2026-04-07 | Review when: Service Agent exits preview, multilingual support added, or licensing requirements change*
