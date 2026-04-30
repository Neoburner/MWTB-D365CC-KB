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

---

*Source last updated: 2026-04-30 | Check this: Your storage costs spike or compliance requirements mandate shorter retention periods*
