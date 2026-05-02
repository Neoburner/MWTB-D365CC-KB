# Audit Logging

**Category:** Security and Compliance
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../enable-audit-tables](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-audit-tables)

## What it does
Tracks admin configuration changes (queues, workstreams, routing rules, channels, Copilot settings) via Dataverse audit logging. Logs show up in Microsoft Purview.

## Key facts
- **Configured in Power Platform admin center**, not Copilot Service admin center
- Three levels: environment-level, table-level, column-level: **table-level must be explicitly enabled per table; environment-level alone does not cover all tables**
- Key unified routing tables to audit: `msdyn_decisionruleset` (classification/assignment/route-to-queue rules), `msdyn_liveworkstream` (workstreams), `msdyn_operatinghours`
- Audit log review and retention is governed by **Microsoft Purview**: may require additional licensing/preview access
- Requires Microsoft Administrator role and Purview portal access

## When to use / skip
Enable unified routing table auditing on every deployment from day one. Routing configuration changes are the most operationally sensitive changes, having an audit trail is essential when diagnosing unexpected routing behaviour post-go-live.

## Configuration decisions
- **Which tables to enable**: at minimum enable routing rule tables and workstreams; expand based on compliance requirements
- **Retention policy**: governed by Purview settings; confirm with the client's compliance team

## Gotchas
- **This is a Power Platform admin task.** Often falls outside the Contact Center scope. Assign ownership explicitly or it won't get done.
- **Purview access is separate.** If compliance isn't already in Purview, getting access is a separate job. Don't leave it for the week before go-live.
- **Table-level audit must be explicitly enabled.** Environment-level auditing doesn't auto-capture all tables. Check routing tables are enabled specifically.

## Consultant notes

- Enable routing table auditing at the start of UAT, not post-go-live. The value of audit logging is in having a record when something goes wrong: and the most common post-go-live question is "who changed this routing rule?". Without auditing enabled from the beginning, that question has no answer.
- This is a Power Platform admin task, which means it's easy for it to fall between the Contact Center project scope and the client's IT team. Make it explicit in the project responsibility matrix: assign it to someone and confirm they have Power Platform admin access before the UAT configuration sprint begins.
- Check Microsoft Purview access as a separate step. Clients who aren't already using Purview may not have the portal access set up, and provisioning it can involve a licensing check and an admin approval. If the client's compliance team expects to review audit logs in Purview, confirm access works before go-live rather than at the point when someone actually needs it.

---

*Source last updated: 2026-02-03 | Check this: New Contact Center activity types added to audit scope, or Purview integration changes*
