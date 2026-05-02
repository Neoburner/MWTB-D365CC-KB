# Data Encryption (At Rest & In Transit)

**Category:** Security & Compliance
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/data-encryption

## What it does
Data encryption in D365 Contact Center covers how customer and conversation data is protected both when stored (at rest) and when transmitted between components (in transit). Encryption is a Microsoft-managed platform capability for the core Dataverse and ACS layers — clients do not configure encryption keys by default. For clients with specific regulatory requirements for key management, Microsoft provides customer-managed key (CMK) options through the Power Platform.

## Key facts
- **Data at rest (Dataverse):** encrypted using AES-256 with Microsoft-managed keys by default; all Dataverse data (conversations, cases, customer records) is encrypted at rest in Azure SQL
- **Data at rest (ACS recordings):** voice recordings and attachments in Azure Blob Storage are encrypted using Azure Storage Service Encryption (AES-256, Microsoft-managed keys by default)
- **Data in transit:** all communication between client browsers and D365 services is TLS 1.2 minimum; ACS voice calls use SRTP (Secure Real-time Transport Protocol) for audio encryption
- **Customer-managed keys (CMK):** Power Platform supports CMK for Dataverse encryption — the client provisions an Azure Key Vault, stores the encryption key, and D365 uses that key for Dataverse encryption. This gives the client control over key rotation and revocation
- **CMK for ACS storage:** Azure Blob Storage (for recordings) also supports CMK via Azure Key Vault — configured separately from Dataverse CMK
- Encryption key rotation: Microsoft rotates platform-managed keys automatically; CMK rotation is the client's responsibility (manual or automated via Key Vault policy)
- There is no option to use client-provided encryption algorithms — only Microsoft's supported encryption standards (AES-256) are used
- Encryption does not protect against authorised access — an agent with access to a conversation record can read it; encryption protects against physical storage access and data breach scenarios

## When to use / skip
Default Microsoft-managed encryption is appropriate for the majority of deployments and satisfies ISO 27001, SOC 2, and GDPR encryption requirements. No configuration is needed — it's on by default.

Customer-managed keys (CMK) are relevant for clients in regulated industries where key control is a compliance requirement — financial services, healthcare, government — or where the client's security policy requires the ability to revoke data access by revoking the encryption key (this is the "crypto-shredding" pattern for data destruction without physical deletion).

## Configuration decisions
- For default encryption: no configuration required — Microsoft manages everything; document it in the data security section of the solution design as "AES-256 at rest, TLS 1.2 in transit, Microsoft-managed keys"
- For CMK: provision an Azure Key Vault in the client's Azure subscription in the same region as the Dataverse environment, generate or import the encryption key, grant Power Platform access to the Key Vault, and configure the CMK policy in Power Platform admin centre — this requires coordination between the Power Platform admin and the client's Azure administrator
- CMK for ACS recordings storage: configure separately in the Azure Storage account settings for the ACS blob storage — this is an Azure-level setting, not a D365 setting
- Key rotation policy: if using CMK, define the key rotation schedule and the procedure for emergency key revocation; include this in the security runbook

## Gotchas
- CMK is not reversible once enabled without data migration. Switching back from CMK to Microsoft-managed keys requires Microsoft support engagement. Enabling CMK is a commitment — confirm the requirement with the client's security team before proceeding.
- Key revocation (revoking the CMK) makes the entire Dataverse environment inaccessible — not just specific data. If the client revokes the key because of a security incident, the entire D365 environment goes offline until the key is restored. This is the intended behaviour for "crypto-shredding" but it's an operational nuclear option that must be understood by all stakeholders.
- CMK doesn't extend to all data automatically. Custom Azure services connected to the environment (external API logs, custom Azure storage) have their own encryption configurations that CMK doesn't control. Document what CMK covers and what it doesn't.
- TLS 1.2 minimum is enforced by Microsoft — but legacy client applications or network proxies that only support TLS 1.0/1.1 will fail to connect. Check the client's network and any legacy system integrations for TLS 1.2 compatibility before go-live.
- Encryption at rest and data access control are different things. Encryption protects against data breach at the storage layer; security roles protect against unauthorised access at the application layer. Both are required — encryption alone does not prevent an authorised agent from seeing another customer's data.

## Consultant notes

- Most clients don't need CMK and conflate "we want our data encrypted" with "we need to manage the encryption keys ourselves." These are different requirements. Microsoft-managed AES-256 encryption is the industry standard and satisfies most regulatory frameworks. If a client asks about encryption, confirm what they're actually trying to achieve — whether it's compliance documentation ("our data is encrypted"), key control ("we can revoke access"), or auditing ("we need to track key usage"). Different requirements have different solutions.
- CMK implementation is a security architecture project, not a D365 configuration task. It involves Azure Key Vault, Power Platform admin centre, ACS storage configuration, and a key management policy. Engage the client's Azure security team from the start — Power Platform admin-only knowledge isn't sufficient.
- Encryption compliance documentation for regulated industries (FCA, CQC, NHS DSP Toolkit, government frameworks) typically requires stating the encryption standard used and confirming key management practices. Microsoft's platform documentation (Trust Center, compliance certifications) provides the evidence; include references to these in any compliance submission rather than trying to describe the encryption architecture from scratch.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft changes CMK availability for ACS or updates the supported TLS minimum version*
