# Quick Replies

**Category:** Agent Experience
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../create-quick-replies](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/create-quick-replies)

## What it does
Predefined message templates reps insert into messaging conversations with a single click. Supports dynamic personalisation via slugs (customer name, rep name, custom context keys). Can be scoped to specific workstreams and tagged into categories. Reps see only replies matching their channel language and workstream.

## Key facts
- Dynamic slug formats: `{FullName{Customer}}`, `{FirstName{Customer}}`, `{LastName{Customer}}`, `{FullName{Agent}}`, `{FirstName{Agent}}`, `{LastName{Agent}}`, `{Nickname{Agent}}`
- Custom context key slugs: `{OCContext.<contextKey>}` — populated from context variables on the conversation
- Locale-specific — each quick reply has a locale; reps only see replies matching the channel language setting
- **Workstream association** scopes visibility — replies not associated with a workstream are visible in all workstreams
- Tags group replies for rep navigation (e.g. "Greeting", "Hold", "Closing")
- Replies can be created or edited directly from the conversation panel by reps (if permitted)

## When to use / skip
Use for any messaging-heavy contact centre. Most valuable for teams with high volumes of similar interactions — greetings, hold messages, legal disclosures, FAQs. Lower value for highly variable technical support where canned responses rarely fit.

## Configuration decisions
- Workstream scoping — scope replies to workstreams when different teams need different reply libraries; leave unscoped for org-wide replies
- Tag taxonomy — design tags to match how reps think about replies (by interaction phase, by topic, by team) rather than by internal admin categories
- Custom context key slugs — requires context variables to be configured on the workstream; coordinate with the routing/workstream design

## Gotchas
- **Locale mismatch silently hides replies.** If a quick reply's locale doesn't match the channel's language setting, reps won't see it. This is a common cause of "why can't I see my quick replies?" tickets post-go-live.
- **Custom context key slugs render blank if the variable isn't populated.** If the conversation doesn't have the context key set (e.g. no pre-survey response, no API call), the slug resolves to empty string — the rep sends a message with a blank where the value should be.

---

*Source last updated: 2025-06-26 | Review when: New slug types supported or workstream scoping behaviour changes*
