# Copilot — Overview & Configuration

**Category:** Copilot and AI
**Applies To:** Standalone + embedded (case summary: standalone only)
**Source:** [learn.microsoft.com/.../copilot-overview](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-overview)

## What it does
Generative AI assistant embedded in D365 Contact Center. Core capabilities: Ask a Question (KB search), Compose Email (draft generation), Case Summary, and Conversation Summary. Configured and enabled in Copilot Service admin center; deployed to reps via experience profiles.

## Key facts
- Feature availability by deployment type: Ask a Question ✓ both; Compose Email ✓ both; Case Summary ✗ embedded / ✓ standalone; Conversation Summary ✓ both
- **GA in North America only** — all other regions are Preview
- **Opt-in required** before any feature is available; opt-out permanently deletes training data
- Deployed to reps via experience profiles — OOB profiles have all features on by default; custom profiles allow granular control
- **Custom security roles require explicit Copilot privileges** — not inherited from default CSR role
- Copilot interaction transcripts stored in `msdyn_copilottranscriptdata` (optional recording)

## When to use / skip
Copilot features are available on any licensed D365 Contact Center or Customer Service deployment. The question is which capabilities to enable and for which rep populations — not whether to use Copilot at all.

## Configuration decisions
- Which features to enable per experience profile — consider starting with conversation summary and Ask a Question (lower risk, immediately useful), then phasing in email drafting and case summary
- Custom role audit — required before go-live if the client uses custom security roles
- Opt-in consent and data sharing — discuss with the client before opting in; has data governance implications

## Gotchas
- **Custom roles are a common go-live blocker.** If the client uses any custom security roles, Copilot won't function until explicit privileges are added to those roles. Audit security roles against the Copilot privilege checklist early.
- **Don't opt out as a troubleshooting step.** Opt-out deletes all training data immediately with no recovery. If Copilot isn't working, diagnose before opting out.
- **GA vs Preview has enterprise readiness implications.** For non-NA regions, all Copilot features are Preview. Clients in regulated industries outside North America should note this before committing to Copilot as a production dependency.

---

*Source last updated: check Microsoft Learn | Review when: Copilot GA expands to additional regions, or case summary comes to embedded*
