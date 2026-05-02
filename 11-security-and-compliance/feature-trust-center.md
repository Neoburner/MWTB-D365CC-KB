# Microsoft Trust Center & Compliance Manager

**Category:** Security & Compliance
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/microsoft-365/compliance/compliance-manager-overview

## What it does
The Microsoft Trust Center is Microsoft's central resource for security, privacy, and compliance documentation about Microsoft cloud services — including D365 Contact Center. It publishes third-party audit reports (ISO 27001, SOC 2, PCI-DSS, etc.), compliance certifications, data processing agreements, and the documentation needed to demonstrate that Microsoft's platform meets regulatory standards. Microsoft Purview Compliance Manager is the complementary tool that helps organisations assess their own compliance posture against regulatory frameworks by mapping their Microsoft 365 and D365 configuration against compliance controls.

## Key facts
- **Microsoft Trust Center** (trust.microsoft.com): public portal for Microsoft's compliance documentation, audit reports, certifications, and regulatory assessments. No login required for most documents; Microsoft's Service Trust Portal (servicetrust.microsoft.com) requires Microsoft account login for detailed audit reports
- **Available compliance certifications for D365/Power Platform:** ISO 27001, ISO 27018, SOC 1 Type II, SOC 2 Type II, GDPR DPA (Data Processing Addendum), PCI-DSS (platform level, not application level), FedRAMP (US government), IRAP (Australia), and others — check the Trust Center for the current list
- **Microsoft Purview Compliance Manager:** available in the Microsoft 365 Compliance portal; tracks the client's own compliance posture against frameworks like GDPR, ISO 27001, NIST; provides improvement actions and score tracking
- The DPA (Data Processing Addendum) between the client and Microsoft is governed by Microsoft's standard terms; for EU clients, this is the primary GDPR documentation for the controller-processor relationship
- Compliance Manager tracks Microsoft-managed controls and customer-managed controls separately — clients are responsible for the customer-managed controls (their own configuration decisions, access policies, etc.)
- Audit reports (SOC 2, ISO) can be shared with clients or their auditors under NDA via the Service Trust Portal

## When to use / skip
The Trust Center is relevant whenever a client needs compliance documentation for their own regulatory submissions, internal security reviews, or third-party audits. It's the answer to "can you prove that Microsoft's platform meets [standard]?" for procurement, legal, and compliance teams.

Compliance Manager is useful for organisations that need to track their own D365 configuration against regulatory requirements — it shows which controls are Microsoft's responsibility, which are shared, and which are the client's responsibility. Most useful for organisations with formal compliance programmes.

## Configuration decisions
- There is no D365-side configuration for Trust Center or Compliance Manager — these are Microsoft-level and client-tenant-level tools, not D365 Contact Center features
- Ensure the client's compliance team knows where to access Microsoft audit reports — Service Trust Portal (servicetrust.microsoft.com), accessed with a Microsoft account
- For regulated industries: obtain the relevant Microsoft audit reports and certifications during the project's compliance readiness phase; don't leave this to post-go-live
- If the client uses Compliance Manager: assign the Compliance Manager Assessor or Administrator role to the client's compliance team so they can access and update the compliance score

## Gotchas
- Microsoft's compliance certifications cover Microsoft's infrastructure, not the client's deployment. A SOC 2 report for Azure or D365 covers Microsoft's controls — the client still needs to demonstrate their own configuration decisions (access controls, encryption choices, audit log monitoring) are compliant. The Microsoft certification is one layer of a multi-layer compliance picture.
- Audit reports from the Service Trust Portal are time-limited — they cover the assessment period stated in the report. A SOC 2 report from 2024 doesn't certify the current state of Microsoft's controls; request the most recent report available.
- DPA (Data Processing Addendum) acceptance is automatic for Microsoft Online Services when the client accepts the Microsoft Customer Agreement — it doesn't need to be separately negotiated for standard D365 deployments. However, enterprise agreements may have bespoke DPA terms — check with the client's legal team.
- Compliance Manager improvement actions include actions that are Microsoft's responsibility (automatically completed) and actions that are the client's responsibility (require the client to configure D365, document processes, or implement controls). The client's compliance team needs to review and complete the client-managed actions — Compliance Manager doesn't do it for them.

## Consultant notes

- The Trust Center documentation request is one of the earliest things a client's compliance or procurement team asks for. It's worth knowing where to point them immediately: trust.microsoft.com for the public portal, servicetrust.microsoft.com for audit reports. Saying "I'll find out where that is" in week one of a regulated industry engagement is a confidence-undermining first impression.
- The distinction between "Microsoft is certified" and "the client's deployment is compliant" is a conversation that needs to happen with every regulated industry client. Microsoft's certifications confirm that the platform is built and operated to high standards. They do not certify that the client has configured D365 correctly for their specific regulatory obligations. The client's compliance team needs to understand this before they submit any documentation to their regulator.
- Compliance Manager is a useful tool but it's not a compliance programme — it's a tracker. Clients who think that a green compliance score in Compliance Manager means they are compliant have misunderstood what it measures. It measures whether the controls listed in the framework have been documented and configured; it doesn't assess whether the controls are effective in practice. Use it as a useful starting point for compliance gap analysis, not as a compliance certification.

---

*Source last updated: 2026-04-30 | Review Microsoft Trust Center at each project start to confirm current certifications — the list of covered frameworks expands over time*
