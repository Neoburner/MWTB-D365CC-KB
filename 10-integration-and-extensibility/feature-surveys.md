# Customer Feedback Surveys

**Category:** Integration and Extensibility
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../configure-surveys](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-surveys)

## What it does
Build CSAT, NPS, CES, or custom surveys in Copilot Service admin center (backed by Copilot Studio). Deliver via digital channels, voice IVR post-call, or email after case close.

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
- **Published status required before linking to channels.** Unpublished surveys won't show in workstream config. Don't miss the Dataverse connection step in Power Apps—that blocks publishing.
- **`MCS_CSAT` variable naming is critical.** Different variable name = no analytics. Verify during Copilot Studio setup, not go-live.
- **Case resolution survey flow is off by default.** Enable it explicitly in Power Automate. Consistently forgotten in case-channel deployments.
- **Never copy survey agents between environments.** They look fine but won't work. Recreate in each environment.
- **Deprecated August 01, 2025:** The post-call survey toggle on the **Language** tab of the voice workstream in Copilot Service admin center has been removed. Configure post-call surveys using Copilot Studio directly instead. See [deprecations page](https://learn.microsoft.com/en-us/dynamics365/contact-center/implement/deprecations-contact-center).

## Consultant notes

- The Dataverse connection setup in Power Apps is the step that blocks survey publishing and is consistently missed because it sits in a completely different app from where everything else is configured. Add it as an explicit item on the survey setup checklist — "configure the Microsoft Dataverse connection reference for MCS Survey in Power Apps Default Solution" — rather than expecting it to be discovered from the documentation. Without it, the survey won't publish and the workstream dropdown will be empty.
- `MCS_CSAT` variable naming is the kind of constraint that sounds trivial and causes real problems. If the Copilot Studio developer uses a different variable name for the CSAT score, the historical analytics dashboard will show blank CSAT data. Verify the variable name in the Copilot Studio setup during build, not during UAT when you're checking analytics for the first time.
- Recreate survey agents in each environment from scratch — don't copy them. This runs counter to every other piece of environment migration advice in D365 and it catches people out every time. A copied survey agent looks fully functional but won't work in the target environment. Add this to the environment migration runbook with a clear note explaining why copying is the wrong approach.

---

*Source last updated: 2026-01-13 | Check this: Survey feature expands to embedded deployment, or new survey analytics added*
