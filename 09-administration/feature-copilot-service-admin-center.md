# Copilot Service Admin Center

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../cc-admin-center](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/cc-admin-center)

## What it does
The single unified admin interface for D365 Contact Center. Consolidates all configuration — routing, channels, experience profiles, Copilot, knowledge, analytics — into one app. Automatically installed in every Contact Center org; no separate installation required.

## Key facts
- Requires **System Administrator** role — no delegated or scoped admin role exists
- Site map is **adaptive** — settings for channels or features only appear after those capabilities are provisioned
- Built-in search across all admin settings for fast navigation
- Includes guided setup wizards for first-time channel configuration
- Legacy settings may still exist in Customer Service Hub for older implementations migrated from Omnichannel for Customer Service

## When to use / skip
Always the entry point for all new configuration. Avoid using legacy Customer Service Hub admin areas for new builds.

## Configuration decisions
None — this is the admin surface; decisions happen in the individual feature areas.

## Gotchas
- **Adaptive site map means settings won't appear until the relevant feature is provisioned.** Provision voice or chat first, then watch the corresponding settings become visible.
- **System Administrator is the only supported admin role.** There is no scoped admin permission model — delegating partial admin access to a team lead means giving them full System Admin, which most clients want to avoid.

---

*Source last updated: 2026-01-30 | Check this: Scoped admin roles added, or major admin center UI changes*
