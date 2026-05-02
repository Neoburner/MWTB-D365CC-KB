# Internal Notes & Tags

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/oc-take-notes

## What it does
Internal notes are free-text annotations agents can add to a conversation during or after the interaction. They are visible to agents and supervisors but not to the customer. Tags are short labels that can be applied to a conversation for categorisation, reporting, and searchability. Both are stored against the conversation record in Dataverse and appear in the conversation timeline.

## Key facts
- Notes are entered via the Notes tab in the Active Conversation screen: a text field where agents type annotations during the live interaction
- Notes are saved against the omnichannel conversation record; they appear in the conversation timeline and in conversation history views
- Notes are internal-only: they are never shown to the customer in any channel
- Tags are configurable labels set up in the admin centre; agents select from the defined tag list during the conversation
- Tags appear in conversation records, are filterable in conversation history, and can be used as a reporting dimension in analytics
- Multiple tags can be applied to a single conversation
- Notes are full-text and unstructured; tags are controlled vocabulary (admin-defined list)
- Both notes and tags are included in GDPR data subject access request exports and must be included in GDPR deletion processes
- Note content is not currently indexed for full-text search in the standard UI: searching by note content requires a custom view or Power BI report

## When to use / skip
Notes are standard practice for any conversation where context not captured by disposition codes or customer fields needs to be preserved, customer stated preference, follow-up commitment, escalation reason, anything a reviewing supervisor or follow-up agent needs to know. Tags are most useful when there's a specific reporting or categorisation requirement that disposition codes don't cover.

If the deployment has mandatory disposition codes for compliance, notes are typically the supplementary free-text field. Don't treat them as the primary capture mechanism for data that needs to drive reporting, tags and structured fields are better for that.

## Configuration decisions
- Define the tag taxonomy with the ops team before go-live: a governed list of tags maps to real business categories; an ungoverned list becomes unusable noise within weeks
- Decide whether notes are optional or expected: if QA scoring includes note quality, that expectation needs to be in agent training and QA rubrics
- Confirm that tags and notes are included in any GDPR deletion workflow: the standard conversation deletion process in Dataverse should capture them, but verify explicitly
- Consider whether to surface conversation tags in analytics: tags can be a useful segmentation dimension in Power BI reports if the tag taxonomy is well-designed

## Gotchas
- Notes entered during wrap-up are still associated with the conversation record: they are not a separate post-conversation entity. Agents who expect wrap-up notes to go somewhere different from live notes will be confused.
- Internal notes are visible in the conversation history view to any agent or supervisor with access to the conversation record. "Internal" means not visible to the customer: it does not mean private to the writing agent.
- Tag lists can only be edited by users with the correct Copilot Service Admin Center access. If agents need new tags added, that's an admin action: define the governance process for who can add tags and how requests are handled.
- Full-text note search is not available natively. If the client needs to search note content (e.g., "find all conversations where the agent noted 'refund requested'"), that requires a custom Dataverse view or external reporting. Flag this limitation early if note search is part of any proposed reporting workflow.
- Conversation tags and case tags are separate. A tag on a conversation record doesn't automatically appear on any linked case record. If categorisation needs to exist in both places, it needs to be applied separately.

## Consultant notes

- Tag taxonomy governance is one of those things that seems like a minor admin detail but has a significant long-term impact. The first week after go-live, agents will ask for new tags for every edge case they encounter. Without a governance process, the tag list doubles in size in a month and becomes useless for reporting. Define the taxonomy, make the change request process explicit, and assign an owner for tag management. This conversation belongs in the operational handover, not as an afterthought.
- Note quality as a QA metric is more complex than clients expect. Notes are free text: there's no automated way to assess quality beyond character count. If QA evaluation includes note quality, QA assessors need to manually review notes. Include this in the QA scoring rubric design and make sure assessors understand the distinction between notes (conversation-level free text) and case notes (case-level).
- The GDPR inclusion of notes and tags in subject erasure requests is worth confirming explicitly in the data map. Notes can contain personal information that the customer hasn't provided directly (agent's observations, sensitive context). When reviewing the GDPR deletion procedure with the client, walk through what notes typically contain and make sure the deletion process covers them.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds full-text note search natively or introduces note templates*
