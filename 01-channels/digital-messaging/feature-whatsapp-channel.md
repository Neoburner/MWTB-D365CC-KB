# WhatsApp Channel (Azure Communication Services)

**Category:** Channels — Digital Messaging
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-whatsapp-acs](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-whatsapp-acs)

## What it does
Routes WhatsApp to D365 queues via Azure Communication Services + Event Grid. Reps send and receive messages in Copilot Service workspace. A 24-hour window controls when reps can send free-form vs template messages.

## Key facts
- Requires ACS resource in the **same tenant** as the D365 organisation — one ACS resource per organisation
- Event Grid webhook uses **Microsoft Entra app authentication** — requires an Entra ID app registration with admin consent
- Five values needed from Azure: ACS resource name, Event Grid app ID, Event Grid app tenant ID, ACS connection string, Channel ID
- **24-hour window:** free-form messages allowed within 24 hours of last customer message; outside that window, only approved WhatsApp templates can be sent
- Only **text-based** message templates are supported in workstream configuration
- **June 2026 breaking change:** WhatsApp replacing phone numbers with Business-Scoped User IDs (BSUIDs) for customers who adopt WhatsApp usernames. Format: `US.13491208655302741918`. Any routing rule or flow using `msdyn_CustomerPhoneNumber` will break for those customers.

## When to use / skip
Use WhatsApp if it's a significant channel in the customer's market—high relevance in LATAM, MENA, South Asia, Southeast Asia. Less relevant for North American B2B.

## Configuration decisions
- Message templates to configure — only text-based templates; design them before go-live so reps can contact customers outside the 24-hour window
- Whether to keep the **WhatsApp Contact Book enabled** — disabling it loses phone number identification for customers who adopt usernames; this decision is permanent
- Routing rule design — must handle both phone number and BSUID patterns if deploying close to June 2026

## Gotchas
- Event Grid Entra authentication is where most setups fail. The Entra app registration and admin consent step often gets blocked by IT security. Plan this dependency early.
- The June 2026 BSUID change is breaking. Audit routing rules and Power Automate flows using `msdyn_CustomerPhoneNumber` before then. Add fallback routing for customers without a phone. Don't put this off.
- The 24-hour template boundary catches reps out. Free-form messaging works in testing, then fails in production when a customer doesn't reply for a day. Train reps and have templates ready before launch.
- ACS resource must connect to only one D365 organisation. Reusing it across multiple D365 environments won't work.

---

*Source last updated: 2026-04-17 | Revisit after BSUID migration (June 2026), or when WhatsApp rich media templates launch*
