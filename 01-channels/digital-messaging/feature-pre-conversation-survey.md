# Pre-Conversation Survey (Chat Channel)

**Category:** Channels — Digital Messaging
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-pre-chat-survey](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-pre-chat-survey)

## What it does
Chat widget shows structured questions before the conversation starts. Answers become context variables available for routing rules and rep conversation panels.

## Key facts
- Chat channel only — not available for voice, SMS, or social messaging channels
- Max **10 questions** per survey
- Max **512 characters** per question text
- Answer types: Single line, Multiple lines, Option set (dropdown), User consent (checkbox)
- User consent answer type supports a link using `[link text](URL)` format — incorrect format renders as raw markdown text
- Context variables for each question are **automatically created** in workstream Advanced settings when the survey is saved
- Mandatory field validation only — no conditional logic, no question branching

## When to use / skip
Use surveys on virtually every chat deployment. They're the simplest way to feed intent-based routing without an AI agent—a "What do you need help with?" dropdown drives routing rules directly. Skip only if the client wants zero friction and routes everything to a single queue.

## Configuration decisions
- Which questions to ask — fewer is better; every question increases pre-chat abandonment
- Whether to use User Consent — required if there's a GDPR/privacy notice requirement before the chat starts; set to Required = Yes to enforce it
- How to name the question's Survey question name field — this becomes the context variable name and should use the exact key names for customer identification: `Name`, `Email`, `Phone`, `CaseNumber` (see `feature-record-identification.md`)

## Gotchas
- Survey question names must match exactly for record identification. "CustomerEmail" instead of "Email" breaks record lookups silently.
- User Consent link format is fragile. The `[link text](URL)` markdown must be exact. Test in the live widget during UAT—formatting errors show as raw markdown.
- No branching or conditional logic. If the client wants different follow-up questions based on an initial answer, survey can't do it—you need an AI agent or IVR.

---

*Source last updated: 2026-01-20 | Worth checking again if pre-conversation survey expands to other channels or gains conditional logic*
