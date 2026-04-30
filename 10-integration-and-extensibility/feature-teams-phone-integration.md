# Teams Phone Integration

**Category:** Integration and Extensibility
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../configure-teams-phone-in-voice-channel](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-teams-phone-in-voice-channel)

## What it does
Reuse existing Teams Phone service numbers (Calling Plan, Operator Connect, or Direct Routing) in Contact Center voice instead of provisioning separate ACS numbers.

## Key facts
- **Calling Plan: service numbers only** — user numbers not supported
- Requires a **Teams resource account** per phone number, created via PowerShell or the provided onboarding script
- Requires **Entra ID app permission:** `TeamsResourceAccount.Read.All` (delegated) with admin consent granted
- Requires **Teams Administrator or Teams Telephony Administrator** role for the sync operation
- Sync is done via: Copilot Service admin center → Phone numbers → Advanced → Teams phone system tab → **Sync from Teams**
- After sync, create a workstream and voice channel for the Teams service number via standard inbound calling setup
- VOIP consult billing: **$0.004/participant/minute** vs. $0.013/participant/minute for PSTN

## When to use / skip
Use if the client has Teams Phone and wants to reuse those numbers. Skip for greenfield deployments — standard ACS provisioning is simpler.

## Configuration decisions
- **PSTN connectivity type** (Calling Plan / Operator Connect / Direct Routing) — dictates the PowerShell commands used for number assignment
- **Use the onboarding script vs. manual cmdlets** — script is recommended for initial setup; manual cmdlets for post-setup modifications

## Gotchas
- **Two separate admin teams.** Teams admin creates the resource account; D365 admin configures the channel and syncs. Identify both before starting.
- **Entra ID consent can take days.** Start this approval process early — strict security policies slow it down.
- **Direct Routing: voice routing policy required.** The Teams resource account needs an online voice routing policy for external transfers. Easy to miss; surfaces in UAT.

---

*Source last updated: 2026-02-20 | Check this: Teams Phone integration expands to embedded, or new PSTN connectivity types added*
