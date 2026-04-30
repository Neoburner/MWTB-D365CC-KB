# Agent SSO

**Category:** Security
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/omnichannel-provision-license

## What it does
D365 Contact Center agents sign in via their Microsoft Entra ID (Azure AD) identity, inheriting M365 authentication and conditional access policies. SSO is enabled by default using Entra ID and is enforced—agents cannot use local usernames and passwords. MFA is supported and recommended, applying the same MFA requirements configured for the user's Entra ID tenant.

## Key facts
- Authentication is tied to the user's Entra ID account; agent sign-in credentials are the same as Teams, Outlook, or other M365 apps
- MFA is enforced if configured at the tenant level; the contact center does not have its own MFA settings
- Embedded deployments (agents access Contact Center from Salesforce or ServiceNow) still use Entra ID; the embedding app provides the container, not alternative authentication
- SSO tokens are refreshed transparently; agents are logged out only if their Entra ID session expires or MFA fails
- Conditional Access policies (IP restrictions, device compliance, risk-based sign-in) apply to Contact Center sessions like any other M365 app
- Guest (B2B) agents cannot be provisioned directly; external partners must be Entra ID B2B users with a valid sign-in account
- Session timeout is not Contact Center-specific; it follows Entra ID session management

## When to use / skip
Use Entra ID SSO in all deployments to reduce credential management overhead and align with M365 security posture. Ensure your Entra ID tenant is enabled for cloud apps (not on-premises-only Active Directory). Skip attempts to use local SQL authentication or form-based login—D365 Contact Center does not support these legacy methods. If you need agent identity to persist across multiple SaaS platforms, consider using the same Entra ID tenant or federation.

## Configuration decisions
- Enable MFA in Entra ID for all contact center users, especially supervisors and administrators
- Use Conditional Access policies to restrict agent sign-ins to corporate networks or managed devices during high-risk hours
- Configure Entra ID tenant email suffix to match your company domain
- For B2B partners, create an Entra ID B2B guest account with their email; do not create a new account in your tenant
- Set session timeout in Entra ID conditional access (default 24 hours); do not leave it at the M365 default

## Gotchas
- If an agent's Entra ID account is disabled or deleted, their Contact Center access is revoked immediately; no grace period
- MFA failures (lost phone, app not synced) will lock out agents from Contact Center like any other M365 app; have a recovery process
- SSO token refresh happens silently, but network interruptions during token renewal can cause unexpected sign-outs
- Embedded deployments require the embedding app (Salesforce/ServiceNow) to pass Entra ID context correctly; misconfiguration can break SSO in the embed
- Guests with Entra ID B2B accounts may see reduced scope on certain records if the parent tenant has guest access restrictions

---

*Source last updated: 2026-04-30 | Review when: Entra ID MFA requirements change or embedding app updates identity handling*
