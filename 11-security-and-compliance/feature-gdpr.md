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
Use GDPR tooling for all EU customers and any customer who requests their data. Set up a GDPR coordinator role and define a DSAR workflow in your organization. Skip ignoring DSAR requests—GDPR fines are substantial (up to 4% of global revenue). Implement automated deletion of very old recordings (>12 months) to reduce DSR fulfillment burden. Do NOT skip the AI-derived content layer; ensure your DSAR process extracts transcriptions and summaries.

## Configuration decisions
- Create a Power Platform DSR request queue: define who receives DSAR requests and assigns them to the data handler
- Use Dataverse bulk delete to remove conversation records; export first to retain a copy per legal hold requirements
- Set up an Azure Blob Storage lifecycle policy to auto-delete voice recordings after 12 months (or per your retention policy)
- Document all custom fields that contain personal data; include them in DSAR exports
- Implement a consent form for chat/voice conversations; store consent flag in a separate Dataverse table
- Define roles: GDPR Coordinator (receives requests), Data Handler (executes delete/export), Legal Hold Officer (approves retention exceptions)

## Gotchas
- DSAR exports include all linked records (agent notes, feedback, surveys); ensure you have processes to exclude non-personal data
- Deleting a conversation record does not automatically delete the audio recording in ACS; you must delete ACS recordings separately
- Transcripts are read-only in Dataverse; to delete a transcript, you must delete the entire conversation record
- If you use Copilot-generated summaries or sentiment, those are stored as separate records; they must be included in DSAR exports
- Screen recordings are stored in Blob Storage outside Dataverse; your Blob Storage lifecycle policy must align with your GDPR retention requirements
- Bulk delete jobs are asynchronous; DSAR response times depend on the size of the delete queue
- If a customer appears in multiple conversations (agent notes mention them), DSAR must cover all conversations, not just the ones initiated by that customer

---

*Source last updated: 2026-04-30 | Review when: GDPR regulations change or Microsoft releases new DSR automation tools*
