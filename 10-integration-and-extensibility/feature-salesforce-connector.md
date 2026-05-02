# Salesforce Data Connector

**Category:** Integration and Extensibility
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../configure-salesforce-connector](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-salesforce-connector)

## What it does
Syncs Contact and Account records one-way from Salesforce into Dataverse so Contact Center can identify customers and populate agent views. Designed for the embedded-in-Salesforce model.

## Key facts
- **One-way sync: Salesforce → Dataverse only** — changes made in Dataverse are not written back to Salesforce
- Supports Contact and Account tables; recommend syncing both to preserve the relationship between linked records
- Column mappings: predefined standard field mappings provided; custom fields can be mapped for compatible data types
- **10 GB data size recommended for optimal performance**
- **Back up existing Dataverse Contact and Account data before configuring** — no built-in rollback
- Uses Salesforce Change Data Capture for near-real-time sync; Salesforce API request limits must be sufficient
- Supported Dataverse data types for mapping: Boolean, Integer, Decimal, Double, String/Memo, DateTime, Uniqueidentifier, Lookup, Owner, Customer — Virtual and EntityName types not supported

## When to use / skip
Use for embedded-in-Salesforce only. If the client uses D365 CRM as their system of record, skip this.

## Configuration decisions
- **Which tables to sync** (Contacts, Accounts, or both) — both is recommended
- **Column mappings for custom Salesforce fields** — requires input from Salesforce admin or CRM architect; standard fields are pre-mapped

## Gotchas
- **One-way sync.** Anything Contact Center writes to Contact/Account in Dataverse stays there. If macros or AI agent actions update records, Salesforce won't see them. Design with this in mind.
- **Back up Dataverse first.** Existing contacts can get duplicated or overwritten if the environment's dirty. Do this before sync.
- **Column mapping is a data architecture call.** Get the Salesforce admin involved — custom field mappings need both sides understood.

## Consultant notes

- The one-way sync constraint needs to be understood by anyone who is designing Contact Center agent actions or AI agent capabilities. If macros, Power Automate flows, or Copilot Studio agents update contact or account records in Dataverse, those changes will not appear in Salesforce — which means the Salesforce team may overwrite them on the next sync cycle or simply never see them. Design with this limitation explicitly in mind and document which system of record applies to each field.
- The Dataverse backup step is easy to skip on the assumption that the environment is clean. It rarely is. Even dev/UAT environments accumulate test records, sample data, or imported contacts that can interact unpredictably with the sync. Back up before configuring the connector, every time.
- Column mapping requires the Salesforce admin and the D365 consultant to work through it together — it's a data architecture conversation, not a config form. Custom Salesforce fields need a corresponding Dataverse field of a compatible type, and the mapping direction has to make sense for how each field is used in practice. Trying to drive this from the D365 side without Salesforce input produces mappings that look correct but break in practice.

---

*Source last updated: 2026-02-18 | Check this: Bidirectional sync supported, or additional CRM connectors added*
