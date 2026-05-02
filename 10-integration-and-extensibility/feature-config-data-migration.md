# Configuration Data Migration

**Category:** Integration and Extensibility
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../migrate-config-data-for-records-overview](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/migrate-config-data-for-records-overview)

## What it does
Moves routing configuration (workstreams, queues, classification rules, capacity profiles, session/notification templates) between environments using the Power Platform Configuration Migration tool. Use this on every UAT → Production migration.

## Key facts
- **Separate migration guides per channel** (Records, Live Chat, SMS, Voice, WhatsApp, Custom): not a single unified process
- Migration sequence for records channel must be followed in order to maintain referential integrity: FetchXML filter → session/notification templates → skill rulesets → capacity profiles → queues → intake rules and workstreams
- **Operating hours cannot be migrated** (Calendar entity limitation): must be manually recreated in each target environment
- **What is NOT migrated:** Intelligent skill finder models, effort estimation, sentiment prediction, role persona mapping, presence settings, queue membership: all must be manually recreated in target
- Migrating user needs Read/Write/Create on 16 specific Dataverse entities in both source and target environments
- Custom entities used in routing conditions must exist in target before migration

## When to use / skip
Run this on every UAT → Production migration. Test the sequence during the project, not at go-live, Murphy's Law applies here.

## Configuration decisions
- **Which channel migration guides to follow**: run each in-scope channel's migration separately
- **Post-migration manual checklist**: identify who recreates operating hours, presence, queue membership, and skill finder in target

## Gotchas
- **Operating hours must be manually recreated.** The most commonly missed item. Put it in the checklist explicitly.
- **What's not migrated matters as much as what is.** Skill finder, presence, queue membership, and role persona mapping all need manual attention. Assign an owner for each before migration day.
- **Test in staging first.** Running this for the first time on go-live is high-risk. FetchXML filtering and entity privilege checks will surface issues that need troubleshooting time.

## Consultant notes

- Run the migration at least once into a staging or pre-prod environment before the UAT-to-production run. First-time migrations nearly always surface at least one entity privilege issue or FetchXML filter problem that needs diagnosing. Having those resolved in staging means the production migration can proceed with confidence. Discovering them on go-live day does not go well.
- Build the post-migration manual checklist before migration day, not after. Operating hours, intelligent skill finder, presence settings, queue membership, and role persona mapping all need to be recreated or verified in the target environment: assign an owner to each item explicitly. If it's not owned, it doesn't get done, and the person who finds out is usually the first agent who tries to log in.
- The separate channel migration guide requirement is easy to overlook: there isn't one unified migration process for all channels. If the deployment has voice, live chat, and SMS, you'll be following three separate guides in sequence. Factor that into the migration window estimate. A multi-channel migration that looks like a 2-hour job on paper can take 4–5 hours when you add up each channel's sequence.

---

*Source last updated: 2026-03-18 | Check this: Configuration Migration tool updates to include currently excluded items*
