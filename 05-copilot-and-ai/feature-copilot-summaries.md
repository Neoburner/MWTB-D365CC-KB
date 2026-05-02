# Copilot Case and Conversation Summaries

**Category:** Copilot and AI
**Applies To:** Case summary: standalone only | Conversation summary: standalone + embedded
**Source:** [learn.microsoft.com/.../copilot-summaries](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-summaries)

## What it does
Auto-generates AI summaries of cases (pulling from fields, emails, notes, linked conversation summaries) and live conversations (on rep join or end). Cuts the time reps spend reading history.

## Key facts
- **Case summary:** Customer Service only, not available in Contact Center embedded; requires Ask a Question to be enabled first; minimum **50 tokens (~38 English words)** in source fields to generate
- **Conversation summary triggers:** When a rep joins a conversation; when a conversation ends; configurable
- **Conversation summary** is Copilot Service workspace only: not Customer Service Hub or custom apps
- AI agent/bot conversation transcripts are **not** automatically included in conversation summaries
- Case summary source fields: title, customer, subject, product, priority, case type, description, linked email activities, notes, conversation summaries
- Can exclude up to **10 email addresses** and **3 disclaimers/headers/footers** from case summary generation (e.g. to filter out automated notification emails)
- Conversation summary format is separately configurable: see `feature-copilot-summary-format.md`

## When to use / skip
Enable conversation summaries on virtually all deployments, immediate value for handoffs and transfers. Case summaries are Customer Service-specific; enable for case-heavy deployments. Both are low-risk to enable early.

## Configuration decisions
- Which conversation summary triggers to enable (on join, on end, or both): "on join" is highest value for handoff/transfer scenarios
- Exclusion list for case summaries: identify automated notification senders and boilerplate text patterns to exclude before go-live; otherwise summaries include noise
- Custom case forms: additional configuration via Copilot PowerApps settings is required if the client uses custom case forms

## Gotchas
- **50-token minimum for case summaries.** Sparse cases won't generate a summary: let reps know this isn't a Copilot bug.
- **Bot transcripts aren't included.** If a Copilot Studio IVR agent handled the customer before rep handoff, that part isn't in the summary. Summary starts from rep involvement, not customer first contact.
- **Custom case forms need extra config.** If the client customised the case form layout, case summaries won't appear without additional PowerApps settings.

## Consultant notes

- Bot transcript not being included in summaries is the gap that surprises clients most during UAT. A customer who spent 5 minutes with a Copilot Studio IVR before being transferred gets a summary that starts from when the agent joined: that context is invisible. Train agents on this so they know to ask the customer for context they may not have.
- Exclusion list for automated emails is worth building before go-live. If the client has automated notification senders (order confirmations, shipping updates, billing alerts) and doesn't configure exclusions, case summaries become paragraph-length summaries of notification chains rather than the actual customer issue.
- On-join is the highest-value trigger for most deployments: it directly benefits the agent receiving a transferred or escalated conversation. Enable that first and evaluate whether on-end adds value separately.

---

*Source last updated: check Microsoft Learn | Check this after case summary comes to embedded deployment or bot transcripts are included automatically*
