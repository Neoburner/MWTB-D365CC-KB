# Customer Feedback Surveys

**Category:** Integration and Extensibility
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../configure-surveys](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-surveys)

## What it does
Post-conversation/call surveys built in Copilot Service admin center and backed by Copilot Studio agents. Survey types: CSAT, NPS, CES, or custom blank template. Delivered via digital messaging channels, voice IVR post-call, or email after case resolution.

## Key facts
- Surveys are **Copilot Studio agents** — created via admin center but customised in Copilot Studio
- Survey must be **published (Ready status)** before it appears in channel/workstream configuration dropdowns
- **One-time Dataverse connection setup required** in Power Apps (Default Solution → Connection References → Microsoft Dataverse connection reference for MCS Survey) — easy to miss
- **`MCS_CSAT` variable name is required** for CSAT scores to appear in Omnichannel historical analytics; different variable name = no analytics integration
- Multilingual surveys supported for voice and inline-chat; **not supported for link-mode surveys**
- Additional custom response variables must start with **`MCS_`** prefix to store in Dataverse
- Case resolution surveys depend on a **Power Automate flow that must be explicitly enabled** (it's off by default)
- **Do not copy survey agents between environments** — copied agents won't function in the target; create fresh in each environment
- Survey results stored in Dataverse: Tables → Customer feedback survey response

## When to use / skip
Use on any deployment where the client wants CSAT or NPS measurement. Essential for clients tracking Copilot ROI or agent quality alongside the Agent Insights dashboard.

## Configuration decisions
- **Survey type** (CSAT, NPS, CES, custom) — match to the client's existing customer feedback framework
- **Post-call voice consent mode** — Automatic-implicit (simpler, no customer choice) vs. Automatic-explicit (better data quality, lower completion rate)
- **Case resolution survey** — requires enabling the Power Automate flow; include in go-live checklist if in scope

## Gotchas
- **Published status required before linking to channels.** A survey created but not published won't appear in workstream configuration. Don't forget the Dataverse connection step in Power Apps — that's what blocks publishing.
- **`MCS_CSAT` variable naming is critical.** If the CSAT response is stored under a different variable name, scores will be absent from analytics. Verify during Copilot Studio setup, not at go-live.
- **Case resolution survey flow is off by default.** It must be explicitly enabled in Power Automate. This is consistently missed in case-channel deployments.
- **Never copy survey agents between environments.** Copied surveys appear to exist but won't function. Recreate them in each environment.

---

*Source last updated: 2026-01-13 | Review when: Survey feature expands to embedded deployment, or new survey analytics added*
