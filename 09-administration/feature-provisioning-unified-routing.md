# Provisioning Unified Routing

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../provision-unified-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/provision-unified-routing)

## What it does
One-time enablement step that activates unified routing in a Customer Service environment. For Contact Center deployments, this happens automatically. For Customer Service-only environments, it must be manually triggered.

## Key facts
- **Contact Center (standalone + embedded): unified routing is provisioned automatically** — no manual step required
- **Customer Service only: must be manually enabled** — Copilot Service admin center → Routing → Manage unified routing → toggle On
- Enabling triggers a **solution import that impacts SQL load** — schedule during off-peak hours in production
- Three prerequisites for Customer Service manual provisioning: Microsoft 365 Administrator role, CSR Manager or Customer Service Representative role, AND **System Administrator on the root business unit** (child BU admin is not sufficient)
- If provisioning fails, contact Microsoft Support — common cause is outdated omnichannel solutions

## When to use / skip
For Contact Center deployments: not applicable (automatic). For Customer Service upgrades to unified routing: required before any routing configuration can begin.

## Configuration decisions
None — this is a single enable step; all routing decisions happen in subsequent workstream/queue/rule configuration.

## Gotchas
- **Root business unit System Admin is specifically required.** Enterprise clients often have admins scoped to child business units. Confirm root BU access before scheduling — it's a common blocker.
- **Schedule production provisioning during off-peak hours.** The solution import hits SQL hard. Don't provision during business hours on a live system.
- **After provisioning, follow the dependency chain in order:** Bookable Resources → Capacity Profiles → Queues → Workstreams → Classification Rules. Miss a step early and you'll get silent failures downstream.

## Consultant notes

- The root business unit requirement catches projects out when the designated IT admin has been given scoped access to a child BU only. This is common in multi-entity or regulated organisations where admin permissions are tightly controlled. Confirm the specific admin account you're using has root BU System Administrator rights before you schedule the provisioning window — finding out mid-session that you don't have the right access wastes everyone's time.
- For Contact Center deployments, this step is automatic and you don't need to think about it. It becomes relevant when a client already has Customer Service and is adding Contact Center components, or when they're upgrading from an older Omnichannel implementation. In those cases, clarify whether unified routing has already been provisioned before touching anything.
- The dependency chain after provisioning is the thing most likely to trip up a new project team member. Bookable Resources first, always. Every downstream step either requires or implicitly assumes a correctly configured Bookable Resource. Document the chain in the project runbook so it's clear to anyone picking up the configuration mid-sprint.

---

*Source last updated: 2025-09-05 | Check this: Provisioning steps change or root BU requirement is removed*
