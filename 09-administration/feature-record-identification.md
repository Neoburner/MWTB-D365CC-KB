# Automatic Record Identification

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../record-identification-rule](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/record-identification-rule)

## What it does
Matches incoming conversations to Contact, Account, and Case records using context variables from pre-conversation surveys or the `setContextProvider` API. When a single match is found, the Active Conversation page pre-populates with the customer's record. Eliminates manual lookup at conversation start.

## Key facts
- **Single match required**: if multiple records match, no auto-link occurs; rep must link manually
- **Active status codes only**: contacts/accounts with custom status codes are not matched
- Context key names are exact and fixed: **Name, Email, Phone** (Contact/Account), **CaseNumber** (Case)
- Voice identification: matches caller phone number against Contact **Mobile Phone** field and Account **Phone** field only; matching against other phone fields requires Microsoft Support
- Case identification is Customer Service only: not available in Contact Center standalone without Customer Service
- AI agent to rep handoff: agent must explicitly set context variables before escalation for identification to work on handoff

## When to use / skip
Use on any deployment with a pre-conversation survey or authenticated portal integration where customer identity is known before the conversation starts. High value for reducing handle time; low configuration effort.

## Configuration decisions
- **Which identifier to use as the primary match**: phone is more unique than email for B2B; name alone is too unreliable; email works well for authenticated B2C scenarios
- **AI agent escalation context-setting**: this is a bot development task (Copilot Studio or Azure Bot), not a D365 config task; include it in bot scope if auto-identification on escalation is required

## Gotchas
- **Context key names are exact.** "CustomerEmail" instead of "Email" silently fails. Validate the exact keys in UAT before training reps.
- **Custom status codes on contacts/accounts break identification.** Organisations with custom lifecycle states (e.g. "Prospect", "Archived") may find identification works for some contacts but not others. Audit status codes before go-live.
- **Multiple-match failures are common with shared email domains.** B2B environments where multiple contacts share a company domain email will frequently get no auto-identification via email. Phone-based matching is more reliable there.

## Consultant notes

- The exact key name requirement (`Name`, `Email`, `Phone`, `CaseNumber`) is the most common source of identification failures during UAT. If identification isn't working, the first thing to check is the exact key name being passed by the pre-conversation survey or the `setContextProvider` call: not the D365 configuration. A 30-minute mapping exercise between the survey/bot developer and the D365 consultant during build prevents the majority of these failures.
- For B2B clients, email-based identification is often unreliable due to shared domain issues. Multiple contacts at the same company sharing `@company.com` addresses will consistently trigger the multiple-match condition and fall through to manual lookup. Discuss the primary identifier choice (phone vs. email vs. account number) with the client's CRM or data team before finalising the survey design.
- Automatic identification on bot-to-agent handoff is a bot development task, not just a D365 config task. The Copilot Studio agent (or Azure bot) must explicitly set the context variables before escalation. If this is in scope, include it in the bot functional requirements and test it explicitly in UAT as part of the handoff test suite: it's easy to assume it works automatically and not test it until end-to-end testing reveals it doesn't.

---

*Source last updated: 2026-01-25 | Check this: Additional entity types or fields supported for automatic identification*
