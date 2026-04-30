# Data Retention & Purge Policies

**Category:** Administration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/data-retention-deletion-purge

## What it does
D365 Contact Center does not have a built-in automated retention policy. Instead, you manually configure bulk delete jobs in Dataverse to remove conversation records, transcripts, and activity logs after a specified age. Voice recordings (stored in Azure Blob via ACS) and screen recordings (stored in Azure Blob Storage) are managed separately via Azure lifecycle policies. Without active retention policies, conversation data grows indefinitely and storage costs accumulate.

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
Implement a data retention policy from day one of production deployment. Set a baseline retention period (e.g., 12 months) for conversation records and 6 months for voice recordings to balance storage cost and compliance. Skip unlimited retention—unmanaged growth leads to storage costs and GDPR risks. If you have legal holds or compliance requirements, implement a tiered policy (e.g., delete 12-month-old records except those flagged Legal Hold).

## Configuration decisions
- Define retention period by data type: conversation records (12 months), voice recordings (6 months), screen recordings (3 months)
- Enable Dataverse Data Retention feature and schedule bulk deletes to run weekly on low-traffic windows (e.g., Sunday 2 AM)
- Create an Azure Blob Storage lifecycle policy to auto-delete voice recordings after the retention period
- Exclude conversations with legal hold flags or high-value keywords (e.g., escalations, complaints) from automatic deletion
- Archive high-value conversations to a separate cold storage account before deletion for long-term compliance
- Set a quarterly manual review process to validate that bulk deletes are running and storage is declining

## Gotchas
- Bulk delete jobs are case-sensitive and can fail silently; monitor the Dataverse Bulk Delete queue for errors
- If you delete a conversation record, the associated voice recording in Blob Storage is NOT automatically deleted; you must use a lifecycle policy
- Screen recordings are orphaned if the conversation is deleted; they persist in Blob Storage unless explicitly deleted
- Bulk delete cannot easily filter by conversation outcome (e.g., "delete only completed conversations"); you must use advanced filters
- If you archive conversations before deleting, the archive copy is permanent; ensure your cold storage account has a retention policy too
- Bulk delete jobs do not delete custom fields or extensions; if you added custom conversation fields, they will be deleted with the conversation, but not if you only archive

---

*Source last updated: 2026-04-30 | Review when: Your storage costs spike or compliance requirements mandate shorter retention periods*
