# Teams Phone Integration

**Category:** Integration and Extensibility
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../configure-teams-phone-in-voice-channel](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-teams-phone-in-voice-channel)

## What it does
Allows organisations with existing Teams Phone (Calling Plan, Operator Connect, or Direct Routing) to use their Teams PSTN service numbers with Contact Center voice, instead of provisioning separate ACS numbers.

## Key facts
- **Calling Plan: service numbers only** — user numbers not supported
- Requires a **Teams resource account** per phone number, created via PowerShell or the provided onboarding script
- Requires **Entra ID app permission:** `TeamsResourceAccount.Read.All` (delegated) with admin consent granted
- Requires **Teams Administrator or Teams Telephony Administrator** role for the sync operation
- Sync is done via: Copilot Service admin center → Phone numbers → Advanced → Teams phone system tab → **Sync from Teams**
- After sync, create a workstream and voice channel for the Teams service number via standard inbound calling setup
- VOIP consult billing: **$0.004/participant/minute** vs. $0.013/participant/minute for PSTN

## When to use / skip
Use when the client has existing Teams Phone investment and wants to reuse those numbers in Contact Center without reprovisioning. Skip for greenfield ACS deployments — standard ACS PSTN provisioning is simpler.

## Configuration decisions
- **PSTN connectivity type** (Calling Plan / Operator Connect / Direct Routing) — dictates the PowerShell commands used for number assignment
- **Use the onboarding script vs. manual cmdlets** — script is recommended for initial setup; manual cmdlets for post-setup modifications

## Gotchas
- **Cross-team dependency.** Teams admin creates the resource account and assigns the number; D365 admin configures the voice channel and runs the sync. These are often different people. Identify both owners before starting.
- **Entra ID admin consent is frequently blocked by IT security policy.** Initiating the approval process early is essential — it can take days in organisations with strict Entra governance.
- **Direct Routing: voice routing policy required for outbound consult/transfer.** The Teams resource account needs an online voice routing policy for external transfers. Easy to miss; surfaces during UAT when transfer to external numbers fails.

---

*Source last updated: 2026-02-20 | Review when: Teams Phone integration expands to embedded, or new PSTN connectivity types added*
