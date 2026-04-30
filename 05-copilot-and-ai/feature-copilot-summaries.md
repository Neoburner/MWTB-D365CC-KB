# Copilot Case and Conversation Summaries

**Category:** Copilot and AI
**Applies To:** Case summary: standalone only | Conversation summary: standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-summaries](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-summaries)

## What it does
Automatically generates AI summaries of cases (pulling from case fields, emails, notes, linked conversation summaries) and live conversations (generating on rep join or conversation end). Reduces time reps spend reading through history to get context.

## Key facts
- **Case summary:** Customer Service only, not available in Contact Center embedded; requires Ask a Question to be enabled first; minimum **50 tokens (~38 English words)** in source fields to generate
- **Conversation summary triggers:** When a rep joins a conversation; when a conversation ends; configurable
- **Conversation summary** is Copilot Service workspace only — not Customer Service Hub or custom apps
- AI agent/bot conversation transcripts are **not** automatically included in conversation summaries
- Case summary source fields: title, customer, subject, product, priority, case type, description, linked email activities, notes, conversation summaries
- Can exclude up to **10 email addresses** and **3 disclaimers/headers/footers** from case summary generation (e.g. to filter out automated notification emails)
- Conversation summary format is separately configurable — see `feature-copilot-summary-format.md`

## When to use / skip
Enable conversation summaries on virtually all deployments — immediate value for rep handoffs and transfers. Case summaries are Customer Service-specific; enable for case-heavy deployments. Both are low-risk features to enable early.

## Configuration decisions
- Which conversation summary triggers to enable (on join, on end, or both) — "on join" is highest value for handoff/transfer scenarios
- Exclusion list for case summaries — identify automated notification senders and boilerplate text patterns to exclude before go-live; otherwise summaries include noise
- Custom case forms — additional configuration via Copilot PowerApps settings is required if the client uses custom case forms

## Gotchas
- **50-token minimum for case summaries.** Cases with very sparse data won't generate a summary — set expectations with reps so they don't think Copilot is broken.
- **Bot transcripts are excluded.** If the conversation involves a Copilot Studio IVR agent before rep handoff, that bot portion is not automatically included in the conversation summary. Reps need to be aware the summary starts from rep involvement, not from the beginning of the customer interaction.
- **Custom case forms need extra config.** If the client has customised the case form layout, case summaries won't appear without additional Copilot PowerApps settings configuration.

---

*Source last updated: check Microsoft Learn | Review when: Case summary comes to embedded deployment, or bot transcripts included automatically*
