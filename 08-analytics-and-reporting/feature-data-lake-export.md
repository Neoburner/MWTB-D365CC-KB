# Data Export to Azure Data Lake / Synapse Link

**Category:** Analytics & Reporting
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/power-apps/maker/data-platform/azure-synapse-link-select-fno-data

## What it does
Azure Synapse Link for Dataverse (formerly Export to Data Lake) continuously replicates Dataverse table data to Azure Data Lake Storage Gen2 or Azure Synapse Analytics. For D365 Contact Center, this means conversation records, case data, queue metrics, agent sessions, and any custom entities can be exported to a data lake in near-real-time for use in advanced analytics, data science workloads, or integration with enterprise data warehouses. It's the path to building analytics that go beyond what Power BI on Dataverse natively supports.

## Key facts
- Export is configured in the Power Platform admin centre via the Azure Synapse Link feature — requires an Azure subscription and an ADLS Gen2 storage account or Synapse workspace
- Once configured, initial export syncs all historical records for selected tables; incremental changes replicate continuously (near-real-time, typically minutes latency)
- Tables to export are selected individually — common Contact Center tables: `msdyn_ocliveworkitem` (conversations), `msdyn_ocsession` (agent sessions), `incident` (cases), `queue`, `systemuser`
- Data lands in CSV or Delta Lake parquet format depending on configuration — Delta Lake is preferred for analytical workloads
- No native D365 analytics capability is affected by the export — it's read-only replication; nothing in D365 changes
- Requires Power Platform Dataverse Export add-on or is included with specific D365 Enterprise licences — verify per the client's licence agreement
- Data in the lake does not include ACS recording blobs or attachment files — only Dataverse table data is exported; binary content stays in blob storage

## When to use / skip
Use when the client has an enterprise data platform (Azure Synapse, Databricks, Snowflake) where they want D365 data alongside data from other business systems for cross-functional reporting, ML model training, or long-term analytics beyond Dataverse retention limits. Also appropriate for clients who need to retain contact centre data beyond D365's data retention policy by archiving to the lake.

Skip for clients who just want Power BI reports — Power BI connects directly to Dataverse and doesn't need a data lake for that. Data lake export adds infrastructure, cost, and engineering complexity that isn't justified for straightforward reporting needs.

## Configuration decisions
- Select only the Dataverse tables needed for the analytics use cases — exporting all tables is expensive at scale and produces data the analytics team will never use; start with a curated list
- Choose the output format: Delta Lake (parquet) for analytics platforms (Synapse, Databricks, Spark); CSV for simpler downstream consumption
- Set up a Synapse Link profile that includes incremental change tracking — initial full export + ongoing delta is the standard pattern
- Define data governance for the lake — who has access to what data in the lake, particularly for tables containing personal data (conversations, customer records); lake-level access control is separate from Dataverse security roles
- Align lake data retention with the overall data retention policy — data in the lake persists until explicitly deleted; it doesn't follow Dataverse retention rules automatically

## Gotchas
- Dataverse security roles don't apply in the lake. An analyst with access to the Azure Data Lake can read all Dataverse records that were exported, regardless of their D365 security role. This is a significant privacy implication — the lake must have its own access control layer (ADLS ACLs, Synapse row-level security) that mirrors the D365 access model.
- Schema changes in D365 (new fields, renamed columns) propagate to the lake on the next sync cycle. Downstream pipelines or reports that depend on specific column names can break when D365 schema changes. Build schema version tolerance into any downstream processing.
- Initial export of large tables (multi-million row conversation history) takes time — potentially hours to days for very large environments. Plan the initial sync timing during a low-traffic window and don't expect data lake availability immediately after configuration.
- Deleted records in Dataverse are marked as soft-deleted in the lake export but not immediately removed. If GDPR deletion requires purging data from the lake, that's a separate explicit deletion step in the lake storage, not automatic from the Dataverse deletion.
- The export doesn't include computed fields or formatted fields — it exports raw Dataverse field values. Lookup fields export as GUIDs, not display names. Downstream analytics needs to handle this (joining to the referenced table or maintaining a lookup dictionary).

## Consultant notes

- The Dataverse security gap is the critical thing to flag with the client's data governance team before any lake setup. The moment data leaves Dataverse and lands in ADLS, D365 security roles no longer apply. If the lake is accessible to a broader analytics team than the D365 system, those analysts can potentially see all conversation records, customer PII, and case data without any of the D365 restrictions. This needs to be reviewed with the privacy officer, not just the technical team.
- Data lake export is an engineering project, not a D365 configuration project. The Synapse Link setup on the D365 side is relatively straightforward. The work is in the downstream: building the analytics pipelines on the lake data, handling schema evolution, managing access control, and integrating D365 data with other business system data. Make sure the client has Azure engineering resource allocated for the lake work, not just the D365 implementation team.
- Start with a small table selection and expand. Clients who configure Synapse Link for all Dataverse tables on day one end up with enormous data volumes they don't know how to use. Start with the 4–6 most important tables for the analytics use case, prove the pipeline, and expand from there.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft changes the Synapse Link product or adds native CDC (change data capture) to the Dataverse connector for Power BI*
