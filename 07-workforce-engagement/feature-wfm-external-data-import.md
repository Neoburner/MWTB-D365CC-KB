# WFM Forecasting — External Data Import

**Category:** Workforce Engagement Management
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/use/wfm-import-forecast-data

## What it does
External data import allows WFM administrators to bring in historical contact volume data from outside D365 Contact Center — from a legacy ACD, a third-party telephony platform, a spreadsheet, or a data warehouse — to supplement or seed the D365 WFM forecasting model. This is most relevant for organisations that have historical contact data in a non-D365 system and need the WFM forecasts to reflect that history rather than starting from a blank baseline.

## Key facts
- Data is imported via a CSV template that follows a specific schema — date, time interval, queue, channel type, contact volume, handle time
- The import targets the WFM historical data store used for forecasting — it does not populate the D365 conversation entity in Dataverse
- Imported data can be used to train the forecasting model alongside native D365 conversation history
- The CSV schema must match the required format exactly — column names, date formats, and interval granularity (15-minute or 30-minute intervals) are validated on import
- Import is done by an administrator in the WFM section of Copilot Service Admin Center — there is no automated API-based import; it's a manual upload process
- Data quality directly affects forecast quality — incomplete, inconsistent, or improperly formatted historical data produces worse forecasts than no historical data
- One-time import to seed baseline data at go-live is the most common use case; ongoing imports from a parallel legacy system during a transition period are also valid

## When to use / skip
Use when the contact centre has meaningful historical contact data in a non-D365 system that predates the D365 deployment. If historical volume patterns are seasonal, event-driven, or have strong day-of-week variation, seeding the WFM model with that history produces significantly better initial forecasts than starting with zero data.

Skip if the operation is genuinely new (no historical data exists) or if the historical data quality from the legacy system is poor. Bad historical data is worse than no data — it trains the model on incorrect patterns.

## Configuration decisions
- Obtain historical data from the source system in the required granularity (15 or 30-minute intervals) for at least 12 months, ideally 24 months, to capture seasonal patterns
- Map source system fields to the D365 WFM import schema — queue names, channel types, and time zones must match the D365 configuration exactly
- Validate data quality before import: check for gaps (missing periods), spikes (data entry errors), and consistency across channels
- Decide whether to import to all queues or start with the highest-volume queues — a partial import is better than a failed full import
- Run the import in a test environment before production to verify the CSV format and spot any field mapping issues

## Gotchas
- The import schema is strict. Column names, date format (ISO 8601), and interval boundaries must match exactly. A CSV that looks correct in Excel but has formatting quirks (trailing commas, BOM characters, inconsistent line endings) will fail import validation.
- Time zone handling is the most common import failure cause. Source data in local time must be converted to UTC before import, or the WFM model will misalign volume with shift patterns. Verify time zone conversion with a spot-check of known peak hours.
- Queue name mapping must be exact — the import matches queue names by string. A legacy queue called "Technical Support" and a D365 queue called "Technical Support - Tier 1" are treated as different queues. Create a mapping table before import and verify names carefully.
- Once imported, historical data cannot be selectively deleted — to correct a bad import, the entire historical dataset for that queue/channel may need to be cleared and re-imported.
- If the source system handled contacts differently from D365 (different wrap-up definitions, different abandon handling), the handle time data in the import may not be directly comparable. Consider whether to import volume only and let D365 build handle time history from live data.

## Consultant notes

- Historical data import is a project task that requires coordination between the IT team (who own the legacy ACD data), the WFM module owner (who defines the target schema), and the analytics team (who validate data quality). Assign clear ownership for each part early — this task has a tendency to sit between functions with everyone assuming someone else is handling it.
- The 12-month minimum is a guideline, not a rule. For operations with strong seasonal patterns (retail with Christmas peaks, tax services with January spikes), 24 months of data captures two full cycles and significantly improves forecast accuracy for those seasonal periods. If the client can provide it, it's worth the import effort.
- Data quality validation before import is not optional. Ask the source team to provide a simple volume report by week for the last 12 months and sanity-check it — does it show expected peaks and troughs? Are there inexplicable gaps or spikes? Obvious data quality issues caught in this review save failed imports and frustrated WFM administrators.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds API-based automated import or changes the CSV schema format*
