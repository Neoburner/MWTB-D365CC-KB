# Audit Logging

**Category:** Security and Compliance
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../enable-audit-tables](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-audit-tables)

## What it does
Tracks administrator configuration changes across Contact Center objects (queues, workstreams, routing rules, channels, Copilot settings, capacity profiles, etc.) via Dataverse audit logging. Logs surface in Microsoft Purview compliance portal.

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
- **Audit configuration is a Power Platform admin task, not a Contact Center task.** It often falls outside the Contact Center project scope — explicitly assign ownership or it won't get done.
- **Purview access must be confirmed separately.** If the compliance team isn't already using Purview, getting them access is a separate workstream. Don't leave this to the week before go-live.
- **Table-level audit must be explicitly enabled.** Environment-level auditing does not automatically capture all tables. Check the specific routing tables are enabled, not just that environment auditing is on.

---

*Source last updated: 2026-02-03 | Review when: New Contact Center activity types added to audit scope, or Purview integration changes*
