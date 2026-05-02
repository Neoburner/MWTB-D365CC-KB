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
Use multi-region if you have customers across geographies and must meet data localization laws (GDPR = EU datacenters). Choose region at setup, document it. Don't move production across regions, export/re-ingest is the only path. Provision ACS in the same region as Dataverse to minimize cross-border flows.

## Configuration decisions
- Select Dataverse region based on primary customer base and regulatory requirements (EU customers -> West Europe, APAC -> Australia/Singapore)
- Provision Azure Communication Services in the same region as your Dataverse to keep voice and transcript data co-located
- Configure Azure Blob Storage for recordings in the same region as ACS
- For AI processing (transcription, sentiment), select the nearest AI Services region and document the cross-border flow
- If you have multi-region Dataverse instances, ensure each ACS and Blob Storage resource is in the corresponding region
- Document data residency in your Data Processing Agreement (DPA) and privacy policy; inform customers where their data lives

## Gotchas
- ACS recording region is determined at call time. Different ACS region = recording stored elsewhere.
- Can't change ACS region post-provisioning without a new ACS resource and channel reconfiguration.
- Copilot transcription and sentiment may process in a different AI services region. Microsoft routes to nearest service.
- Blob Storage recordings don't follow Dataverse residency policies: they follow the storage account region.
- EU Dataverse doesn't guarantee GDPR compliance: you must implement DSR processes and data deletion.
- Legacy conversations in non-EU Dataverse can't move to EU without export/re-import. No built-in migration.

## Consultant notes

- The environment region decision needs to be made in discovery, documented, and locked. You cannot move a Dataverse environment to a different region post-deployment: the only path is export and re-import, which means downtime, data risk, and potential loss of configuration. For any client with EU customers or data residency requirements, confirm the Dataverse region and ACS region together before provisioning anything.
- ACS and Dataverse residency are separate choices and they need to match for compliance purposes. A Dataverse environment in West Europe with an ACS resource in US East creates a cross-border data flow for voice recordings. For EU-regulated clients, both resources should be in the same EU region, and this needs to be documented in the Data Processing Agreement. Confirm both are aligned before go-live: changing ACS post-provisioning means rebuilding the voice channel.
- "EU Dataverse does not guarantee GDPR compliance" is the statement that occasionally surprises clients who've been told that choosing an EU region ticks the GDPR box. Data residency is a necessary condition for some GDPR requirements, not a sufficient one. DSR processes, data deletion procedures, consent tracking, and data processing documentation are all separate obligations. Make sure the client's compliance team understands the difference and that the project scope reflects what's actually needed for GDPR, not just what region the environment is in.

---

*Source last updated: 2026-04-30 | Check this: Azure regions expand or Microsoft adds regional AI services availability*
