# Configuration Data Migration

**Category:** Integration and Extensibility
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../migrate-config-data-for-records-overview](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/migrate-config-data-for-records-overview)

## What it does
Moves routing configuration (workstreams, queues, classification rules, capacity profiles, session/notification templates) from one environment to another (e.g. UAT → Production) using the Power Platform Configuration Migration tool.

## Key facts
- **Separate migration guides per channel** (Records, Live Chat, SMS, Voice, WhatsApp, Custom) — not a single unified process
- Migration sequence for records channel must be followed in order to maintain referential integrity: FetchXML filter → session/notification templates → skill rulesets → capacity profiles → queues → intake rules and workstreams
- **Operating hours cannot be migrated** (Calendar entity limitation) — must be manually recreated in each target environment
- **What is NOT migrated:** Intelligent skill finder models, effort estimation, sentiment prediction, role persona mapping, presence settings, queue membership — all must be manually recreated in target
- Migrating user needs Read/Write/Create on 16 specific Dataverse entities in both source and target environments
- Custom entities used in routing conditions must exist in target before migration

## When to use / skip
Use on every UAT → Production migration. Build and test the migration sequence during the project, not at go-live.

## Configuration decisions
- **Which channel migration guides to follow** — run each in-scope channel's migration separately
- **Post-migration manual checklist** — identify who recreates operating hours, presence, queue membership, and skill finder in target

## Gotchas
- **Operating hours must be manually recreated.** This is the most commonly forgotten migration item. It must be in the UAT-to-production migration checklist explicitly.
- **What's not migrated is as important as what is.** Skill finder, presence, queue membership, and role persona mapping all need manual attention. Assign an owner for each before migration day.
- **Test the migration in a staging environment before production.** Running this process for the first time on go-live day is high-risk. FetchXML filtering and entity privilege requirements reliably surface issues that need troubleshooting time.

---

*Source last updated: 2026-03-18 | Review when: Configuration Migration tool updates to include currently excluded items*
