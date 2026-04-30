# WhatsApp Channel (Azure Communication Services)

**Category:** Channels — Digital Messaging
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-whatsapp-acs](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-whatsapp-acs)

## What it does
Routes WhatsApp conversations into D365 unified routing via Azure Communication Services Advanced Messaging + an Azure Event Grid webhook. Representatives send and receive WhatsApp messages in Copilot Service workspace. A 24-hour messaging window governs when free-form vs template messages can be sent.

## Key facts
- Requires ACS resource in the **same tenant** as the D365 organisation — one ACS resource per organisation
- Event Grid webhook uses **Microsoft Entra app authentication** — requires an Entra ID app registration with admin consent
- Five values needed from Azure: ACS resource name, Event Grid app ID, Event Grid app tenant ID, ACS connection string, Channel ID
- **24-hour window:** free-form messages allowed within 24 hours of last customer message; outside that window, only approved WhatsApp templates can be sent
- Only **text-based** message templates are supported in workstream configuration
- **June 2026 breaking change:** WhatsApp replacing phone numbers with Business-Scoped User IDs (BSUIDs) for customers who adopt WhatsApp usernames. Format: `US.13491208655302741918`. Any routing rule or flow using `msdyn_CustomerPhoneNumber` will break for those customers.

## When to use / skip
Use when WhatsApp is a significant customer communication channel for the client's market. High relevance in LATAM, MENA, South Asia, and Southeast Asia. Less relevant for predominantly North American B2B clients.

## Configuration decisions
- Message templates to configure — only text-based templates; design them before go-live so reps can contact customers outside the 24-hour window
- Whether to keep the **WhatsApp Contact Book enabled** — disabling it loses phone number identification for customers who adopt usernames; this decision is permanent
- Routing rule design — must handle both phone number and BSUID patterns if deploying close to June 2026

## Gotchas
- **Event Grid Entra authentication is where most setups get stuck.** The Entra app registration and admin consent step is often blocked by IT security teams. Plan for this dependency early.
- **The June 2026 BSUID change is a breaking change.** Audit routing rules and Power Automate flows that reference `msdyn_CustomerPhoneNumber` before June 2026. Add fallback routing for customers without a phone number. Don't defer this.
- **The 24-hour template boundary surprises representatives.** Free-form messaging works in testing (recent conversations), then fails in production when a customer goes quiet for a day. Train reps on this and have templates ready before go-live.
- **ACS resource must connect to only one D365 organisation.** Reusing an ACS resource across multiple D365 environments is not supported.

---

*Source last updated: 2026-04-17 | Review when: BSUID migration completes (June 2026), or WhatsApp rich media templates supported*
