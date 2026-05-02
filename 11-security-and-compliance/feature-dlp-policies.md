# Data Loss Prevention (DLP) Policies

**Category:** Security & Compliance
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/power-platform/admin/wp-data-loss-prevention

## What it does
Data Loss Prevention (DLP) policies in the Power Platform context are governance controls that restrict which connectors (external services) can be used in Power Automate flows, Power Apps, and Copilot Studio bots within a given environment. DLP policies don't prevent data from being viewed in D365 — they prevent data from flowing out of the D365 environment to unauthorised external services via the Power Platform connector ecosystem. For example, a DLP policy can block a Power Automate flow from sending conversation data to a personal Gmail account or an unapproved third-party service.

## Key facts
- DLP policies are configured in the Power Platform admin centre at the tenant or environment level — tenant-level policies apply globally; environment-level policies apply to specific environments
- Policies classify connectors into tiers: **Business** (approved for use with business data), **Non-Business** (consumer/personal connectors, not allowed with business data), and **Blocked** (not available for use at all)
- Common "Business" connectors in contact centre context: Dataverse, SharePoint, Teams, Office 365, approved external connectors
- Common "Non-Business" or "Blocked" connectors: personal Gmail, social media platforms, consumer Dropbox, unapproved third-party APIs
- DLP policies apply to Power Automate flows and Power Apps in the environment — they do not apply to direct API integrations or code-level Dataverse access
- Policies are enforced at flow design/save time and at flow run time — a flow that violates a DLP policy will fail to save or fail to run
- Copilot Studio bots that use connectors (Power Automate flows for agentic actions) are also subject to DLP policies

## When to use / skip
DLP policies should be configured in every production D365 Contact Center environment as a baseline security control. Without them, any user who can build a Power Automate flow could extract conversation data to personal or unapproved services. The configuration effort is low; the protection is meaningful.

The scope and strictness of DLP policies depends on the client's security posture — a minimum viable DLP policy blocks known consumer/personal connectors; a stricter policy allows only an explicitly approved whitelist of business connectors.

## Configuration decisions
- Define the list of approved external connectors for the contact centre environment — connectors the organisation has authorised for use with contact centre data (specific partner systems, internal Azure services, approved third-party services)
- Configure a tenant-level DLP policy as the baseline, then add environment-level policies for any environment-specific restrictions — tenant-level policies apply across all environments and cannot be overridden by environment-level policies for a given environment
- Block or classify as Non-Business: consumer email providers (Gmail, Yahoo), file sharing services (personal Dropbox, Google Drive), social media connectors, unapproved third-party services
- Test DLP policies against existing Power Automate flows in the environment before applying — a new DLP policy that blocks a connector used by an existing flow will cause that flow to fail
- Document the DLP policy and the approval process for adding new connectors — developers who need a new connector have a path to request approval rather than being blocked silently

## Gotchas
- DLP policies apply to Power Platform connectors only. They don't restrict code-level integrations (REST API calls from custom applications), database-level access, or access via the Dataverse OData Web API by external systems. DLP is one layer of data governance, not a comprehensive data exfiltration prevention system.
- An existing Power Automate flow that uses a connector that a new DLP policy blocks will fail immediately when the policy is applied — it won't warn before enforcement. Audit existing flows in the environment before applying new DLP policies and communicate changes to flow owners.
- Environment-level DLP policies are additive with tenant-level policies — an environment can have stricter restrictions than the tenant default, but not looser ones. If the tenant policy blocks a connector, an environment-level policy cannot unblock it.
- Copilot Studio bots that call Power Automate flows are subject to DLP — if the flow the bot calls uses a blocked connector, the bot action will fail at runtime. Test bot flows against the DLP policy in a non-production environment before deploying.
- DLP policy changes require Power Platform admin rights. If the client's Power Platform admin is a shared role, DLP changes may need a change management process with appropriate approval sign-off.

## Consultant notes

- DLP policy setup is a quick win in the security configuration that's often skipped because it doesn't feel like "building the contact centre." Add it to the go-live readiness checklist as a named item — "DLP policy configured and tested" — and assign a named owner. Without this, it tends to get deferred to "after go-live" and then forgotten.
- The audit-first approach to DLP is important: before applying a new DLP policy, export a list of all Power Automate flows in the environment and check which connectors they use. Any connector that the new DLP policy would restrict needs to be reviewed — is the flow legitimate? Is the connector use approved? Does the flow need to be modified before the policy applies? Skipping this audit results in unexpected flow failures on the day the policy is applied.
- DLP is most relevant in environments where multiple teams have Power Platform access — contact centre implementation teams, the client's IT team, business users who've attended a Power Platform training. In environments with multiple builder roles, the risk of someone accidentally (or deliberately) creating a flow that exfiltrates data to an unapproved service is real. DLP is the guardrail.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft changes the connector classification framework or adds new connector categories to DLP policies*
