# Embedded Conversation Widget (Salesforce and ServiceNow)

**Category:** Integration and Extensibility
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../set-up-embedded-experience](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/set-up-embedded-experience)

## What it does
Embeds the Contact Center conversation widget in Salesforce Service Console or ServiceNow so reps handle conversations from their existing CRM. No workspace switching required. Pull the widget URL from Copilot Service admin center and embed via Salesforce CTI or ServiceNow OpenFrame.

## Key facts
- Widget URL: Copilot Service admin center home page → Open your default contact center → Conversation widget tab
- **Salesforce:** Uses a call center definition XML file (available on GitHub): replace the CTI Adapter URL with the widget URL, import into Salesforce, add to Service Console utility bar; Copilot connection requires **Salesforce API v58.0**
- **ServiceNow:** Requires **OpenFrame plugin** installed in ServiceNow; configure via All → OpenFrame → Configurations → New; recommended width 400, height 700
- Records remain in the third-party CRM: no automatic sync of case/incident records between systems
- Copilot AI features operate within the widget but access to CRM data is limited to what is explicitly passed as context

## When to use / skip
Use when the client stays on Salesforce or ServiceNow. This stacks Contact Center on top of their existing CRM, not replacing it.

## Configuration decisions
- **Context passing from the CRM to the widget**: not automatic; requires custom development on the Salesforce/ServiceNow side if reps need to see the open case/record in the widget

## Gotchas
- **Two admins, two systems.** D365 admin gets the widget URL; Salesforce/ServiceNow admin does the CTI/OpenFrame config. Flag this dependency early.
- **ServiceNow: check for OpenFrame.** Some instances don't have it installed. Confirm before you commit to the timeline.
- **Context passing is custom work.** If the client wants the widget to know which case the rep has open, that's a dev task, not config.

## Consultant notes

- The two-admin dependency is the main timeline risk. The D365 admin can get the widget URL in five minutes; the Salesforce or ServiceNow admin then needs to configure their side, and their availability and change management processes may add weeks. Identify both parties in discovery and get the Salesforce/ServiceNow admin involved early: don't treat it as something to sort out when the D365 side is done.
- Context passing between the CRM and the widget is consistently underestimated. Clients often assume that because the widget is embedded in Salesforce, it will automatically know which case or account is open. It won't: that requires custom development on the Salesforce or ServiceNow side to pass context to the widget. Get clarity on whether this is in scope during discovery and estimate the development effort accordingly. The out-of-box embed gives you the conversation widget, not a contextually-aware integration.
- For ServiceNow deployments, confirm the OpenFrame plugin status before committing to the timeline. If it isn't installed, that's a ServiceNow admin task with its own change management and testing cycle. Some enterprise ServiceNow instances have a slow plugin approval process: finding this out mid-project is a scheduling problem.

---

*Source last updated: 2026-02-12 | Check this: Additional CRM embeddings supported, or Salesforce API version requirement changes*
