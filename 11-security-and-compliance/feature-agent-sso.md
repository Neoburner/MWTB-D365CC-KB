# Agent SSO

**Category:** Security
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/omnichannel-provision-license

## What it does
D365 Contact Center agents sign in via their Microsoft Entra ID (Azure AD) identity, inheriting M365 authentication and conditional access policies. SSO is enabled by default using Entra ID and is enforced, agents cannot use local usernames and passwords. MFA is supported and recommended, applying the same MFA requirements configured for the user's Entra ID tenant.

## Key facts
- Authentication is tied to the user's Entra ID account; agent sign-in credentials are the same as Teams, Outlook, or other M365 apps
- MFA is enforced if configured at the tenant level; the contact center does not have its own MFA settings
- Embedded deployments (agents access Contact Center from Salesforce or ServiceNow) still use Entra ID; the embedding app provides the container, not alternative authentication
- SSO tokens are refreshed transparently; agents are logged out only if their Entra ID session expires or MFA fails
- Conditional Access policies (IP restrictions, device compliance, risk-based sign-in) apply to Contact Center sessions like any other M365 app
- Guest (B2B) agents cannot be provisioned directly; external partners must be Entra ID B2B users with a valid sign-in account
- Session timeout is not Contact Center-specific; it follows Entra ID session management

## When to use / skip
Use Entra ID SSO in all deployments. Reduces credential overhead, aligns with M365 security. Ensure Entra is cloud-enabled (not on-premises AD only). Local SQL auth or form-based login aren't supported. For cross-SaaS identity, use same Entra tenant or federation.

## Configuration decisions
- Enable MFA in Entra ID for all contact center users, especially supervisors and administrators
- Use Conditional Access policies to restrict agent sign-ins to corporate networks or managed devices during high-risk hours
- Configure Entra ID tenant email suffix to match your company domain
- For B2B partners, create an Entra ID B2B guest account with their email; do not create a new account in your tenant
- Set session timeout in Entra ID conditional access (default 24 hours); do not leave it at the M365 default

## Gotchas
- Entra ID account disabled/deleted = immediate Contact Center revocation. No grace period.
- MFA failures lock out agents like any M365 app. Have a recovery process.
- Token refresh is silent, but network interruptions during renewal cause unexpected sign-outs.
- Embedded deployments need the embedding app (Salesforce/ServiceNow) to pass Entra ID context correctly. Misconfiguration breaks SSO.
- B2B guests may see reduced scope if parent tenant has guest access restrictions.

## Consultant notes

- The immediate account revocation on Entra ID account disablement is the HR offboarding story to tell the client's IT team during handover. There's no grace period: a rep whose account is disabled in Entra ID loses access instantly and any in-flight conversations are dropped. The IT offboarding process for leavers should account for this: supervisors need to know that contact center access revocation happens at the same moment as the broader M365 account disable, not separately.
- MFA lockout recovery needs to be in the IT support runbook before go-live. An agent who has their MFA factor removed or loses their authenticator device is locked out of Contact Center as completely as they're locked out of any other M365 app. The recovery process (MFA reset by IT helpdesk) should be documented and tested: finding out the recovery path doesn't work on the morning of go-live isn't the right time to discover it.
- For embedded deployments (Salesforce or ServiceNow), confirm that the embedding app passes Entra ID context correctly in the integration testing phase. If the Salesforce SSO configuration doesn't correctly forward the Entra ID session to the Contact Center widget iframe, agents will get auth errors when opening the widget even though they're logged into Salesforce. This is a cross-system configuration issue that requires both the D365 admin and the Salesforce/ServiceNow admin to diagnose.

---

*Source last updated: 2026-04-30 | Check this: Entra ID MFA requirements change or embedding app updates identity handling*
