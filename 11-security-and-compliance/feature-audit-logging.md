# Audit Logging

**Category:** Security and Compliance
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../enable-audit-tables](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-audit-tables)

## What it does
Tracks admin configuration changes (queues, workstreams, routing rules, channels, Copilot settings) via Dataverse audit logging. Logs show up in Microsoft Purview.

## Key facts
- **Configured in Power Platform admin center**, not Copilot Service admin center
- Three levels: environment-level, table-level, column-level — **table-level must be explicitly enabled per table; environment-level alone does not cover all tables**
- Key unified routing tables to audit: `msdyn_decisionruleset` (classification/assignment/route-to-queue rules), `msdyn_liveworkstream` (workstreams), `msdyn_operatinghours`
- Audit log review and retention is governed by **Microsoft Purview** — may require additional licensing/preview access
- Requires Microsoft Administrator role and Purview portal access

## When to use / skip
Enable unified routing table auditing on every deployment from day one. Routing configuration changes are the most operationally sensitive changes — having an audit trail is essential when diagnosing unexpected routing behaviour post-go-live.

## Configuration decisions
- **Which tables to enable** — at minimum enable routing rule tables and workstreams; expand based on compliance requirements
- **Retention policy** — governed by Purview settings; confirm with the client's compliance team

## Gotchas
- **This is a Power Platform admin task.** Often falls outside the Contact Center scope. Assign ownership explicitly or it won't get done.
- **Purview access is separate.** If compliance isn't already in Purview, getting access is a separate job. Don't leave it for the week before go-live.
- **Table-level audit must be explicitly enabled.** Environment-level auditing doesn't auto-capture all tables. Check routing tables are enabled specifically.

---

*Source last updated: 2026-02-03 | Check this: New Contact Center activity types added to audit scope, or Purview integration changes*
