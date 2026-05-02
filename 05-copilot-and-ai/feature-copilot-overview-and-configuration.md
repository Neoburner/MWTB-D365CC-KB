# Copilot — Overview & Configuration

**Category:** Copilot and AI
**Applies To:** Standalone + embedded (case summary: standalone only)
**Source:** [learn.microsoft.com/.../copilot-overview](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-overview)

## What it does
Generative AI assistant in D365 Contact Center with four capabilities: Ask a Question (KB search), Compose Email, Case Summary, and Conversation Summary. Configured in Copilot Service admin center and deployed to reps via experience profiles.

## Key facts
- Feature availability by deployment type: Ask a Question ✓ both; Compose Email ✓ both; Case Summary ✗ embedded / ✓ standalone; Conversation Summary ✓ both
- **GA in North America only** — all other regions are Preview
- **Opt-in required** before any feature is available; opt-out permanently deletes training data
- Deployed to reps via experience profiles — OOB profiles have all features on by default; custom profiles allow granular control
- **Custom security roles require explicit Copilot privileges** — not inherited from default CSR role
- Copilot interaction transcripts stored in `msdyn_copilottranscriptdata` (optional recording)

## When to use / skip
Available on any licensed D365 Contact Center or Customer Service deployment. The question is which features to enable and for which reps — not whether to use Copilot at all.

## Configuration decisions
- Which features to enable per experience profile — consider starting with conversation summary and Ask a Question (lower risk, immediately useful), then phasing in email drafting and case summary
- Custom role audit — required before go-live if the client uses custom security roles
- Opt-in consent and data sharing — discuss with the client before opting in; has data governance implications

## Gotchas
- **Custom roles are a go-live blocker.** If the client uses custom security roles, Copilot won't work until explicit privileges are added. Audit roles against the Copilot privilege checklist early.
- **Don't opt out to troubleshoot.** Opt-out deletes all training data immediately with no recovery. Diagnose first.
- **GA vs Preview readiness.** For non-NA regions, all Copilot features are Preview. Clients in regulated industries outside North America should know this before betting production on it.

## Consultant notes

- Custom role audit should be a named go-live blocker, not a nice-to-have. If the client has any custom security roles, Copilot won't work until the privileges are explicitly added. Run the audit during the build sprint, not go-live week.
- Never opt out to troubleshoot. This is worth putting in the admin handover document and repeating in any training. Opt-out deletes all training data immediately with no recovery path — it's not a reset button.
- For clients outside North America, have the GA vs Preview conversation explicitly during discovery. Regulated industries in Preview regions need to know what that means for production readiness before they commit Copilot to a live contact centre.

---

*Source last updated: check Microsoft Learn | Check this after Copilot GA expands to additional regions or case summary comes to embedded*
