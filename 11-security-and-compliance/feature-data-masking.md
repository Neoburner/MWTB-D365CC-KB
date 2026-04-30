# Data Masking

**Category:** Security and Compliance
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../data-masking-settings](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/data-masking-settings)

## What it does
Two separate masking mechanisms: (1) **Chat/async channel masking rules** — regex-based patterns that replace sensitive text with `#` in chat transcripts; (2) **Voice agent sensitive variable masking** — pauses recording and transcription in Copilot Studio when a sensitive variable is being collected.

## Key facts

**Chat/async masking:**
- OOB rules: Credit Card, Email, SSN
- **Maximum 10 masking rules total** (including OOB)
- Regex-based — rules must be written and tested carefully; overly broad patterns mask legitimate content
- Can mask customer messages from rep, rep messages from customer, or both
- Masked text appears as `#` in both conversation UI and transcripts
- Rules must be set to **Active** to apply

**Voice agent sensitive variable masking (Copilot Studio):**
- Configure in Copilot Studio: set **Sensitive data = On** on any variable capturing PINs, card numbers, PHI, etc.
- Pauses recording, transcription, and data logging during sensitive variable collection
- Transcript shows: *"Entered a confidential section of the conversation"*
- **Does NOT auto-detect sensitive data** — agent authors must explicitly mark variables
- NOT supported for digital/messaging channels — only voice agent transcripts
- Variables passed to Power Automate flows are flagged sensitive; variables written to Dataverse explicitly, received from HTTP/connectors, or passed in transfer nodes are **not** redacted
- Do not enable Log sensitive activity properties in Application Insights — causes sensitive data in telemetry

## When to use / skip
Chat masking: use on any deployment where sensitive data may appear in chat (card numbers, personal identifiers). Voice masking: mandatory for any voice agent collecting payment or health data for compliance.

## Configuration decisions
- **Which regex patterns to create** — the 10-rule limit requires prioritisation for multi-sensitive-data environments; combine patterns where possible
- **Which Copilot Studio variables to mark sensitive** — document all sensitive-flagged variables in the agent design artefact

## Gotchas
- **The two masking features are independent and cover different channels.** Chat masking doesn't cover voice; voice sensitive masking doesn't cover chat. A client needing both must configure both.
- **Sensitive data is not automatically detected in voice agents.** If a customer volunteers their card number to an agent topic that hasn't marked the capturing variable as sensitive, it will not be redacted. Review all agent topics that could receive sensitive input.
- **10-rule chat masking limit is tight** for environments with multiple data types (card numbers, NHS numbers, tax IDs, account numbers). Plan the rule set during design, not after go-live.
- **Known edge case:** if the customer's response to the **first question** in a conversation is sensitive-flagged, it may not be redacted due to a timing issue at conversation start. All subsequent sensitive responses are redacted normally.

---

*Source last updated: 2025-10-15 | Review when: Voice sensitive masking extends to digital channels, or chat masking rule limit increases*
