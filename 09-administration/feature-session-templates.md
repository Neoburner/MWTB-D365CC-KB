# Session Templates

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../session-templates](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/session-templates)

## What it does
Defines what the Copilot Service workspace looks like when a rep accepts a work item, which application opens as the anchor tab, any additional tabs that open automatically, the communication panel mode, and associated agent scripts. Assigned to workstreams.

## Key facts
- Two session types: **Entity** (tied to a specific Dataverse entity, e.g. Case) and **Generic** (channel-based, e.g. chat/voice: requires an explicit anchor tab selection)
- Anchor tab cannot be closed by reps; neither can additional tabs added via the template
- **Communication Panel Mode:** Docked (expanded), Minimized, or Hidden: for record/entity sessions, it is always Hidden (non-configurable)
- OOB templates exist for all channels (Chat, Voice, SMS, Facebook, LINE, etc.) and cannot be customised: create new templates
- Agent scripts can be assigned with a conditional expression to load the right script per session conditions
- Unique name format: `<prefix>_<name>`: prefix must be 3–8 alphanumeric characters
- Assigned to workstreams via Associate templates with workstreams in admin center

## When to use / skip
Every deployment uses session templates. OOB defaults are a reasonable starting point, create custom templates when there are specific anchor tab, additional tab, or script requirements.

## Configuration decisions
- **Anchor tab per session type**: Active Conversation for chat/voice; Case form for record routing; correct choice is the single most important decision in session template design
- **Additional tabs**: identify 1–2 genuinely needed pages; additional tabs cannot be closed by reps, so fewer is better
- **Communication panel mode per channel**: Docked for voice (shows call controls); Hidden for case sessions

## Gotchas
- **Additional tabs cannot be closed by reps.** Every tab you add permanently occupies workspace real estate. Be deliberate: add only what reps routinely need, not everything they might occasionally want.
- **Design session templates and agent scripts together.** The session template determines which script loads: they're tightly coupled. Don't finalise templates before script requirements are clear.
- **Unique name prefix is easy to violate.** Agree on a prefix convention early (e.g. `cc_`) and document it.

## Consultant notes

- The "reps can't close additional tabs" behaviour is the one that causes the most friction post-go-live if the template design wasn't thought through properly. Every tab that gets added to a template during an "it might be useful" conversation becomes permanent workspace clutter. Push back on scope creep in template design: one anchor tab plus one genuinely necessary additional tab is the right starting point for most scenarios.
- Design session templates and agent scripts in the same design session, not sequentially. The session template controls which script loads and under what conditions, so finalising templates without knowing the script structure means potential rework. If agent scripts are still being written when session templates are being built, at minimum agree the script names and trigger conditions before committing the template configuration.
- Agree on a naming convention for the `<prefix>_<name>` format at the start of the build phase and enforce it. Three to four character prefix based on client or project initials is typical. If multiple consultants are working on the build without a documented convention, you'll end up with inconsistent names that are awkward to fix later without reconfiguring workstream associations.

---

*Source last updated: 2025-08-19 | Check this: Session template capabilities expand or new OOB templates added*
