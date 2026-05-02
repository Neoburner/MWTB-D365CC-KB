# Data Retention & Purge Policies

**Category:** Administration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/data-retention-deletion-purge

## What it does
D365 Contact Center has no built-in automated retention policy. You manually configure bulk delete jobs in Dataverse to remove conversations, transcripts, and activity logs after a specified age. Voice recordings (Azure Blob via ACS) and screen recordings (separate Blob Storage) are managed via Azure lifecycle policies. Without retention policies, data grows indefinitely and storage costs accumulate.

## Key facts
- Conversation records are stored in Dataverse; deletion requires a Dataverse bulk delete job
- Voice recordings are stored in Azure Blob Storage via Azure Communication Services; ACS has no built-in retention, only manual deletion or lifecycle policies
- Screen recordings are stored in a separate Blob Storage account; they have no Dataverse record (orphaned if the conversation is deleted)
- Bulk delete jobs are async and can take hours for large datasets; they do not block other operations
- Dataverse retention policies (Dynamics 365 Data Retention feature) allow scheduling bulk deletes automatically, but are not enabled by default
- AI-derived records (Copilot transcriptions, sentiment analysis) are stored as separate entities; they must be deleted independently
- Legal hold flags can preserve conversation records from deletion; useful for litigation or compliance holds
- Archival is an alternative to deletion; you can export conversations to cold storage (Blob Storage) before deleting

## When to use / skip
Implement a data retention policy from day one of production. Set a baseline retention period — 12 months for conversations, 6 months for voice recordings — to balance cost and compliance. Don't skip this; unmanaged growth leads to storage costs and GDPR risks. If you have legal holds or compliance requirements, use a tiered policy (delete 12-month-old records except those flagged Legal Hold).

## Configuration decisions
- Define retention period by data type: conversation records (12 months), voice recordings (6 months), screen recordings (3 months)
- Enable Dataverse Data Retention feature and schedule bulk deletes to run weekly on low-traffic windows (e.g., Sunday 2 AM)
- Create an Azure Blob Storage lifecycle policy to auto-delete voice recordings after the retention period
- Exclude conversations with legal hold flags or high-value keywords (e.g., escalations, complaints) from automatic deletion
- Archive high-value conversations to a separate cold storage account before deletion for long-term compliance
- Set a quarterly manual review process to validate that bulk deletes are running and storage is declining

## Gotchas
- Bulk delete jobs are case-sensitive and can fail silently. Monitor the Dataverse Bulk Delete queue for errors.
- Deleting a conversation record doesn't automatically delete the voice recording in Blob Storage. Use a lifecycle policy.
- Screen recordings are orphaned if the conversation is deleted; they persist in Blob Storage unless explicitly deleted.
- Bulk delete can't easily filter by conversation outcome (e.g., "delete only completed conversations"). Use advanced filters.
- If you archive conversations before deleting, the archive copy is permanent. Ensure your cold storage account has a retention policy too.
- Bulk delete doesn't remove custom fields or extensions. Custom conversation fields get deleted with the conversation, but not if you only archive.

## Consultant notes

- Data retention is consistently left to post-go-live and consistently generates storage cost surprises at the 6–12 month mark. Set up the bulk delete jobs and Azure lifecycle policies during the build phase — not after go-live. An unmanaged Contact Center environment accumulates conversation records, transcripts, and voice recordings faster than most clients expect, and the cost of getting ahead of it is much lower than cleaning it up later.
- The voice recording and conversation record deletion are completely separate operations. Clients who delete Dataverse conversation records to manage storage and then find the Azure Blob voice recordings still growing have missed this split. The data retention design needs to cover both surfaces explicitly, with separate Azure lifecycle policies for ACS voice recordings and any screen recording storage. Document both in the handover.
- For clients in regulated industries (financial services, healthcare, legal), involve the client's legal or compliance team in the retention design before anything is configured. Mandatory minimum retention periods, legal hold requirements, and jurisdiction-specific data residency rules will override the default retention approach. Don't design this in isolation from the compliance team — it's one of the areas where getting it wrong has real consequences.

---

*Source last updated: 2026-04-30 | Check this: Your storage costs spike or compliance requirements mandate shorter retention periods*
