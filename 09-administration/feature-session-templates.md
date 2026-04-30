# Session Templates

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../session-templates](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/session-templates)

## What it does
Defines what the Copilot Service workspace looks like when a rep accepts a work item — which application opens as the anchor tab, any additional tabs that open automatically, the communication panel mode, and associated agent scripts. Assigned to workstreams.

## Key facts
- Two session types: **Entity** (tied to a specific Dataverse entity, e.g. Case) and **Generic** (channel-based, e.g. chat/voice — requires an explicit anchor tab selection)
- Anchor tab cannot be closed by reps; neither can additional tabs added via the template
- **Communication Panel Mode:** Docked (expanded), Minimized, or Hidden — for record/entity sessions, it is always Hidden (non-configurable)
- OOB templates exist for all channels (Chat, Voice, SMS, Facebook, LINE, etc.) and cannot be customised — create new templates
- Agent scripts can be assigned with a conditional expression to load the right script per session conditions
- Unique name format: `<prefix>_<name>` — prefix must be 3–8 alphanumeric characters
- Assigned to workstreams via Associate templates with workstreams in admin center

## When to use / skip
Every deployment uses session templates. OOB defaults are a reasonable starting point — create custom templates when there are specific anchor tab, additional tab, or script requirements.

## Configuration decisions
- **Anchor tab per session type** — Active Conversation for chat/voice; Case form for record routing; correct choice is the single most important decision in session template design
- **Additional tabs** — identify 1–2 genuinely needed pages; additional tabs cannot be closed by reps, so fewer is better
- **Communication panel mode per channel** — Docked for voice (shows call controls); Hidden for case sessions

## Gotchas
- **Additional tabs cannot be closed by reps.** Every tab you add permanently occupies workspace real estate. Be deliberate — add only what reps routinely need, not everything they might occasionally want.
- **Design session templates and agent scripts together.** The session template determines which script loads — they're tightly coupled. Don't finalise templates before script requirements are clear.
- **Unique name prefix is easy to violate.** Agree on a prefix convention early (e.g. `cc_`) and document it.

---

*Source last updated: 2025-08-19 | Check this: Session template capabilities expand or new OOB templates added*
