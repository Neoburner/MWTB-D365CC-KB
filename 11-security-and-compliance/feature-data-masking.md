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
- **Two independent features, different channels.** Chat doesn't cover voice; voice doesn't cover chat. Configure both if needed.
- **No auto-detection in voice agents.** Customer volunteers a card number—if the variable isn't marked sensitive, it won't redact. Review all topics that could receive sensitive input.
- **10-rule limit is tight** for multiple data types (cards, NHS numbers, tax IDs). Plan the rule set during design, not after go-live.
- **First question edge case:** customer responses to the first question may not redact due to timing at conversation start. All subsequent sensitive responses redact normally.

## Consultant notes

- Make the distinction between chat masking and voice masking explicit in the solution design. They're completely separate mechanisms, they cover different channels, and they need to be configured independently. For any deployment handling sensitive data across both voice and chat (payment cards, NHS numbers, personal identifiers), both need to be in scope. A client who thinks they've ticked the "data masking" box by configuring one may not realise the other channel is unmasked.
- For voice agents, the "no auto-detection" constraint means you need to review the entire Copilot Studio topic design for any place where a customer could volunteer sensitive data. It's not just the topics designed to collect card numbers — it's also the general enquiry topics where a customer might mention their date of birth, account number, or other personal data unprompted. Work through the topic map with the bot designer and flag every input variable that could receive sensitive content.
- Plan the 10-rule limit in the design phase. For regulated industries handling multiple types of sensitive data (card numbers, NHS numbers, NI numbers, account numbers, dates of birth), the limit requires careful prioritisation. OOB rules take 3 slots (credit card, email, SSN), leaving 7 for custom patterns. If the client needs more than 7 custom patterns, they'll need to combine patterns or accept some gaps — that's a compliance risk decision for the client, not a technical workaround.

---

*Source last updated: 2025-10-15 | Check this: Voice sensitive masking extends to digital channels, or chat masking rule limit increases*
