# Timeline & Activity Feed

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/customer-timeline

## What it does
The Timeline is a chronological activity feed that shows the history of interactions and actions related to a customer, case, or conversation record. It aggregates emails, calls, notes, tasks, appointments, and conversation activities into a single scrollable view. Agents reviewing the timeline can see the full history of what has happened with a customer or case without navigating to individual records.

## Key facts
- The Timeline is a standard Unified Interface control that appears on Contact, Case, and Conversation forms: it's the same control used across all model-driven D365 apps
- Activity types shown: emails (sent and received), phone calls, tasks, appointments, notes, and omnichannel conversations
- Each entry shows the activity type, date/time, subject/description, and the author/participant
- Agents can create new activities directly from the Timeline: add a note, log a phone call, create a task: without leaving the form
- The Timeline can be filtered by activity type, date range, and direction (inbound/outbound) using the filter panel
- Related records' activities can be included: if viewing a Case timeline, emails sent to the customer about that case can appear alongside conversation records
- Conversation activities in the Timeline link to the full conversation transcript (for conversations within the retention period)
- Timeline is read-only for historical activities; notes and tasks can be edited after creation

## When to use / skip
The Timeline is always present in any deployment using D365 Customer Service or Contact Center, it's a standard form component rather than an optional feature. The relevant design questions are around which activity types to show, how far back the timeline should display, and whether to include related record activities.

Agents who work multi-contact cases (a customer who has emailed, called, and chatted about the same issue) get the most value from a well-configured timeline, it replaces manual cross-record navigation.

## Configuration decisions
- Add the Timeline to the Customer Summary form if it's not already there: some default form configurations omit it or position it below the fold
- Configure which activity types are visible in the Timeline: in some deployments, certain activity types (internal tasks, appointments) are irrelevant to front-line agents and add noise
- Set up the default filter state: opening the Timeline with no filters shows everything; a sensible default filter (e.g., last 90 days, conversations and emails only) reduces cognitive load
- For case-heavy deployments, enable "related records" in the Timeline so agents can see activities from linked entities (the customer's other open cases, for example) without navigating away
- Confirm that historical conversation records (pre-go-live conversations from legacy systems) are represented in the Timeline if continuity is important: migrated activities need to be in the correct format to appear

## Gotchas
- The Timeline shows activities based on data access: if an agent doesn't have read access to certain record types, those activities won't appear even if they're in the timeline of a record they can access. This can make the timeline look incomplete when the data exists but the agent's security role doesn't surface it.
- Conversations in the timeline link to the full transcript, but if the conversation is beyond the retention period or has been deleted for GDPR, the link shows but the transcript is gone. The activity entry remains; the content doesn't.
- Notes created from the Timeline are attached to the record the Timeline is on (Contact, Case, or Conversation). Agents sometimes create notes thinking they're on the customer record when they're on the conversation record: the note goes to the conversation, not the customer's permanent history.
- Very active customers (high-volume contacts) can have timelines with hundreds of entries spanning years. Agents loading these without a date filter will see performance issues. Default filter to recent periods for high-volume contact scenarios.
- Emails sent via the D365 email channel appear in the timeline if the email is tracked. Emails sent outside D365 (directly from Outlook) won't appear unless tracking is enabled in the Outlook integration settings.

## Consultant notes

- The Timeline is one of the first things agents ask about in training: "how do I see the customer's history?" Demo the Timeline prominently and show how to filter it: date range, activity type. Agents who learn to filter from the start use the Timeline effectively; agents who open it without filters and see 200 entries tend to avoid it.
- "Related record" timeline configuration is worth discussing in the design phase for case-heavy deployments. Whether to show a customer's full activity history on every case (including activities from unrelated cases) or only the activities directly related to the current case is a UX decision with real impact. For high-volume customers, showing everything is overwhelming; for complex B2B accounts, the broader view is valuable. Ask the ops team which scenario their agents face.
- Pre-go-live data migration activity appears in the timeline only if migrated activities are formatted as standard Dataverse activity records. If historical conversation data is migrated as custom entities or annotations rather than as activity records, they won't appear in the Timeline. Clarify the migration format decision early if timeline continuity from legacy systems matters to the client.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft changes the Timeline control or adds new activity type integrations*
