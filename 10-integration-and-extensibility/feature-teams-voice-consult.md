# Teams Voice Consult (VOIP)

**Category:** Integration and Extensibility
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../voice-consult-microsoft-teams-user](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-consult-microsoft-teams-user)

## What it does
Lets reps consult or transfer live customer calls to any Microsoft Teams user in the tenant via VOIP, without the Teams user needing a phone number. Delivered via ACS–Teams federation.

## Key facts
- **Standalone only** — not available in embedded
- VOIP consult only — the Teams tab of the dialer is VOIP; PSTN calls to Teams users use the External number tab
- **Teams Auto Attendants and Call Queues are not supported** as consult/transfer targets
- Requires **Enterprise Voice enabled per Teams user** (not environment-wide — per user, via PowerShell)
- Requires **External Access Policy for ACS federation** enabled in the Teams tenant (`Set-CsExternalAccessPolicy -EnableAcsFederationAccess $true`)
- ACS resource ID must be added to Teams tenant's ACS allowlist (`Set-CsTeamsAcsFederationConfiguration`)
- ACS firewall IP ranges AND Teams/Skype for Business Online IP ranges must both be allowlisted
- **If Teams user doesn't answer: no voicemail, no call forwarding** — the call simply fails; Teams voicemail/forwarding rules don't apply
- Billing: $0.004/participant/minute (VOIP) vs $0.013/participant/minute (PSTN)

## When to use / skip
Use when reps regularly need to pull in internal SMEs or escalation contacts during live customer calls. High value for technical support or advisory contact centres with subject matter experts in Teams.

## Configuration decisions
- **Which Teams users need Enterprise Voice enabled** — must be explicitly enabled per user; build the list and run in bulk
- **Fallback workflow if Teams user is unavailable** — design into rep training since there's no voicemail option

## Gotchas
- **Enterprise Voice is per-user, not environment-wide.** Missing it for specific SMEs means those users won't receive consult calls. Prepare a complete list and verify before go-live.
- **Network allowlisting has two parts:** ACS IPs and Teams/Skype for Business Online IPs. Both must be approved. In organisations with strict network controls, this takes time — raise it in discovery.
- **Teams federation PowerShell requires a Teams Administrator.** This is often a different person from the D365 admin. The `Set-CsTeamsAcsFederationConfiguration` command blocks everything until it's run.

---

*Source last updated: 2026-02-05 | Review when: Feature expands to embedded deployment, or ACS–Teams federation configuration changes*
