# Data Residency

**Category:** Compliance
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/data-residency

## What it does
D365 Contact Center data residency is determined by the Power Platform environment region where the Dataverse instance is deployed. Conversation transcripts, metadata, and activity records are stored in the Dataverse region. Azure Communication Services (ACS) voice recordings and some AI-processed content may reside in different Azure regions based on ACS region selection and AI service availability, creating potential cross-border data flows that must be managed for GDPR/data localization compliance.

## Key facts
- Dataverse data (conversations, transcripts, agent sessions) is stored in the region you select when provisioning the environment (e.g., Europe, Asia-Pacific, United States)
- Voice recordings via Azure Communication Services (ACS) are stored in the ACS resource's region, which may differ from your Dataverse region
- Copilot/AI processing for transcription and sentiment analysis may occur in the nearest AI services region, not your Dataverse region
- Chat data is stored with your environment's Dataverse region; no separate chat storage layer
- Screen recordings (if enabled) are stored in Azure Blob Storage in the region associated with your Azure subscription
- Data residency is set at environment creation; you cannot move an environment to a different region post-deployment
- EU data residency options: West Europe (Netherlands/Ireland) or North Europe (Ireland) for Dataverse; ACS EU regions include UK South and West Europe
- GDPR applies even if your Dataverse is in a non-EU region if your customers are in the EU; data residency is a separate control from GDPR compliance

## When to use / skip
Use multi-region deployments if you have customers across geographies and must meet data localization laws (e.g., GDPR for EU, data in EU datacenters). Choose your environment region at setup and document the selection. Skip moving production data across environments to change region—export and re-ingest is the only path. Ensure your ACS resources are provisioned in the same region as your Dataverse to minimize cross-border data flows.

## Configuration decisions
- Select Dataverse region based on primary customer base and regulatory requirements (EU customers -> West Europe, APAC -> Australia/Singapore)
- Provision Azure Communication Services in the same region as your Dataverse to keep voice and transcript data co-located
- Configure Azure Blob Storage for recordings in the same region as ACS
- For AI processing (transcription, sentiment), select the nearest AI Services region and document the cross-border flow
- If you have multi-region Dataverse instances, ensure each ACS and Blob Storage resource is in the corresponding region
- Document data residency in your Data Processing Agreement (DPA) and privacy policy; inform customers where their data lives

## Gotchas
- ACS voice recording region is determined at the time of the call; if ACS is in a different region than Dataverse, that recording is stored there
- You cannot change ACS region after provisioning without creating a new ACS resource and reconfiguring all channels
- Copilot transcription and sentiment analysis may be processed in a different AI services region than your Dataverse; Microsoft routes to the nearest service
- Screen recordings stored in Blob Storage do not follow Dataverse data residency policies; they follow the Azure subscription's storage account region
- For GDPR purposes, data residency in EU Dataverse does not guarantee GDPR compliance; you must also implement DSR processes and data deletion
- If you have legacy conversations in a non-EU Dataverse and need to move them to EU, you must export and re-import; no built-in migration path

---

*Source last updated: 2026-04-30 | Review when: Azure regions expand or Microsoft adds regional AI services availability*
