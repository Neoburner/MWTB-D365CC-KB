# GDPR & Data Subject Requests

**Category:** Compliance
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/gdpr

## What it does
D365 Contact Center provides tools and processes to fulfill GDPR data subject rights: access (export), erasure (delete), and rectification. The Power Platform Data Loss Prevention (DLP) and Data Subject Rights (DSR) tools allow exporting customer conversation data, transcripts, and metadata for access requests. Deletion requests require a combination of bulk delete for Dataverse records and manual deletion of ACS recordings (audio) and AI-generated content, since no automated purge exists for those storage layers.

## Key facts
- Data subject access requests (DSAR): Use Power Platform Security & Governance > Data Subject Rights to export conversation records, transcripts, and related metadata
- Right to erasure: Delete conversation records in Dataverse via bulk delete; must separately delete ACS voice recordings and Screen recordings from Azure Blob Storage
- Right to rectification: Edit conversation records and custom fields directly in Dataverse; not supported for transcripts (read-only) or recordings
- Consent management: D365 Contact Center does not have built-in consent tracking; you must track consent in a separate table or external CMS
- Processing period: GDPR requires DSRs to be fulfilled within 30 days; Microsoft provides tooling but you must establish the process
- AI-derived content (transcriptions, sentiment, summaries): Microsoft provides in the transcript; deletion of raw audio does not automatically delete AI-derived content
- Lawful basis tracking: D365 Contact Center does not enforce lawful basis; you must document and track consent/legitimate interest in a separate system
- Pseudonymization: Available via Dataverse field-level security; you can mask customer identity in transcripts without deleting the conversation

## When to use / skip
Use for all EU customers and anyone who requests their data. Set up a GDPR coordinator role and define a DSAR workflow. Don't ignore DSAR requests — fines are substantial (up to 4% revenue). Automate deletion of old recordings (>12 months). Include AI-derived content in DSAR exports.

## Configuration decisions
- Create a Power Platform DSR request queue: define who receives DSAR requests and assigns them to the data handler
- Use Dataverse bulk delete to remove conversation records; export first to retain a copy per legal hold requirements
- Set up an Azure Blob Storage lifecycle policy to auto-delete voice recordings after 12 months (or per your retention policy)
- Document all custom fields that contain personal data; include them in DSAR exports
- Implement a consent form for chat/voice conversations; store consent flag in a separate Dataverse table
- Define roles: GDPR Coordinator (receives requests), Data Handler (executes delete/export), Legal Hold Officer (approves retention exceptions)

## Gotchas
- DSAR exports include all linked records (agent notes, feedback, surveys). Have processes to exclude non-personal data.
- Deleting a conversation doesn't delete the ACS audio recording. Delete ACS recordings separately.
- Transcripts are read-only in Dataverse. Delete transcript = delete entire conversation.
- Copilot summaries and sentiment are stored separately. Include in DSAR exports.
- Screen recordings in Blob Storage. Your lifecycle policy must align with GDPR retention.
- Bulk delete is async. DSAR response time depends on delete queue size.
- Customer in multiple conversations = DSAR covers all, not just customer-initiated ones.

---

*Source last updated: 2026-04-30 | Check this: GDPR regulations change or Microsoft releases new DSR automation tools*
