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

## Consultant notes

- The adaptive site map regularly confuses clients during UAT when settings they expect to see aren't there yet. Walk them through the provisioning dependency at the start — the admin center reveals its options progressively as channels and features are turned on. It's not a bug, it's by design, but it doesn't feel intuitive until you've seen it a few times.
- The System Administrator constraint is a genuine governance headache for clients who want to delegate routine admin tasks (managing holiday schedules, updating operating hours) to an operations lead without giving them full D365 admin rights. There's no clean solution currently — the options are full System Admin, or doing everything through a trusted intermediary. Raise it in the security design conversation so it's a documented decision, not a surprise.
- The built-in search is genuinely useful and worth showing to clients in handover. Once you know the feature name, searching beats navigating the site map every time. Frame it as the first thing to use when they can't remember where a setting lives.

---

*Source last updated: 2026-01-30 | Check this: Scoped admin roles added, or major admin center UI changes*
