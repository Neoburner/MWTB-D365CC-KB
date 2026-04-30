# Embedded Conversation Widget (Salesforce and ServiceNow)

**Category:** Integration and Extensibility
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../set-up-embedded-experience](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/set-up-embedded-experience)

## What it does
Embeds the Contact Center conversation widget inside Salesforce Service Console or ServiceNow, so reps handle chat and voice from their existing CRM without switching to Copilot Service workspace. Widget URL retrieved from Copilot Service admin center and embedded via Salesforce CTI/OpenFrame mechanism.

## Key facts
- Widget URL: Copilot Service admin center home page → Open your default contact center → Conversation widget tab
- **Salesforce:** Uses a call center definition XML file (available on GitHub) — replace the CTI Adapter URL with the widget URL, import into Salesforce, add to Service Console utility bar; Copilot connection requires **Salesforce API v58.0**
- **ServiceNow:** Requires **OpenFrame plugin** installed in ServiceNow; configure via All → OpenFrame → Configurations → New; recommended width 400, height 700
- Records remain in the third-party CRM — no automatic sync of case/incident records between systems
- Copilot AI features operate within the widget but access to CRM data is limited to what is explicitly passed as context

## When to use / skip
Use when the client's system of record is Salesforce or ServiceNow and they are not migrating to D365 CRM. This is the Contact Center layer on top of an existing CRM, not a replacement.

## Configuration decisions
- **Context passing from the CRM to the widget** — not automatic; requires custom development on the Salesforce/ServiceNow side if reps need to see the open case/record in the widget

## Gotchas
- **The Salesforce and D365 admins are usually different people.** The D365 admin retrieves the widget URL; the Salesforce/ServiceNow admin does the CTI/OpenFrame configuration. Map this dependency early — it's a common delay point.
- **ServiceNow requires the OpenFrame plugin.** Confirm it's installed before planning the integration. Some ServiceNow instances don't have it.
- **Context passing is custom work.** If the client expects the widget to know which case the rep has open, that's a development task, not a configuration task.

---

*Source last updated: 2026-02-12 | Review when: Additional CRM embeddings supported, or Salesforce API version requirement changes*
