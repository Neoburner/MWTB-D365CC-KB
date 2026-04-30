# Salesforce Data Connector

**Category:** Integration and Extensibility
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../configure-salesforce-connector](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-salesforce-connector)

## What it does
One-way synchronisation of Contact and Account records from Salesforce into Dataverse, enabling Contact Center to use Salesforce CRM data for customer identification and rep views. Primarily supports the embedded-in-Salesforce deployment model.

## Key facts
- **One-way sync: Salesforce → Dataverse only** — changes made in Dataverse are not written back to Salesforce
- Supports Contact and Account tables; recommend syncing both to preserve the relationship between linked records
- Column mappings: predefined standard field mappings provided; custom fields can be mapped for compatible data types
- **10 GB data size recommended for optimal performance**
- **Back up existing Dataverse Contact and Account data before configuring** — no built-in rollback
- Uses Salesforce Change Data Capture for near-real-time sync; Salesforce API request limits must be sufficient
- Supported Dataverse data types for mapping: Boolean, Integer, Decimal, Double, String/Memo, DateTime, Uniqueidentifier, Lookup, Owner, Customer — Virtual and EntityName types not supported

## When to use / skip
Use specifically for the embedded-in-Salesforce deployment model where Contact Center needs Salesforce CRM data for customer identification. If the client uses D365 CRM (not Salesforce) as their system of record, this connector is not needed.

## Configuration decisions
- **Which tables to sync** (Contacts, Accounts, or both) — both is recommended
- **Column mappings for custom Salesforce fields** — requires input from Salesforce admin or CRM architect; standard fields are pre-mapped

## Gotchas
- **One-way sync means any Contact Center workflow that writes to Contact/Account records in Dataverse won't be reflected in Salesforce.** If macros, AI agent actions, or other automations update customer records, those changes stay in Dataverse only. Design workflows with this constraint in mind.
- **Back up Dataverse data before activating.** The documentation explicitly recommends this — existing Dataverse contacts could be duplicated or overwritten if the environment wasn't clean before sync.
- **Column mapping is a data architecture decision**, not a technical config task. Get the Salesforce admin or CRM architect involved — custom field mappings require understanding of both the Salesforce and Dataverse data models.

---

*Source last updated: 2026-02-18 | Review when: Bidirectional sync supported, or additional CRM connectors added*
