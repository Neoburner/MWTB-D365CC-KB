# System Requirements

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../system-requirements-contact-center](https://learn.microsoft.com/en-us/dynamics365/contact-center/implement/system-requirements-contact-center)

## What it does
Defines the mandatory technical prerequisites for D365 Contact Center — browsers, hardware, network, and URL allowlist. Validate these in discovery before any deployment commitment.

## Key facts
- Supported browsers: **Microsoft Edge (Chromium)** and **Google Chrome** only — IE not supported
- **Third-party cookies must NOT be blocked** — required for presence and authentication; blocked cookies are a common enterprise go-live blocker
- Desktop notification requires Edge v79.0.309.65+ 
- Agent hardware: minimum 4 GB RAM; microphone + speakers required for voice
- Voice bandwidth: minimum 4 Mbps upload / 8 Mbps download; recommended 8/16 Mbps
- **Azure Communication Services (ACS) required** for PSTN voice and SMS — not available in all regions
- Live chat widget supports last 3 major versions of Edge, Chrome, Firefox (Windows), Safari (macOS/iOS), Edge/Chrome (Android)
- Geo-specific CDN URL must match client's data centre region — using wrong CDN causes intermittent chat widget failures

**Key URL allowlist domains (provide full list to client network team):**
- `*.omnichannelengagementhub.com`
- `*.communication.azure.com`
- `ccaas-embed-prod.azureedge.net`
- `login.microsoftonline.com` / `login.windows.net`
- `*.teams.microsoft.com` / `*.skype.com`
- `ocsdk-prod.azureedge.net`
- `*.service.signalr.net`

## When to use / skip
Reference in discovery and pre-sales to validate client environment readiness. Always send the URL allowlist to the client's network team early — firewall change requests typically take 2–3 weeks in enterprise environments.

## Configuration decisions
None — this is a requirements reference; decisions are on the client side (browser policy, network allowlisting, ACS regional availability).

## Gotchas
- **Third-party cookie blocking is the most common enterprise go-live blocker.** Edge and Chrome often have this blocked at group policy level. Resolve it before go-live — presence and auth depend on it.
- **URL allowlist timing.** Clients with Zscaler, Palo Alto, or similar proxies need a formal IT change request. Allow 2–3 weeks lead time — don't leave it until the week before go-live.
- **Geo-specific CDN URL must match the correct region.** Wrong CDN causes intermittent widget failures that are hard to diagnose.
- **Check ACS regional availability for international clients** before committing to voice or SMS.

## Consultant notes

- Send the URL allowlist to the client's network team at the start of the project, not the end. Enterprise firewall change requests typically take two to three weeks to process through IT governance. Missing this step by one week has blocked more go-lives than any technical issue I've seen. Get it in their hands in discovery and follow up.
- Third-party cookie blocking is worth testing explicitly in the client's actual environment — not just on your demo machine. Group policy settings vary by organisation, and it's not always obvious whether cookies are being blocked until presence stops updating mid-UAT. Run the browser check on a standard-issue client laptop before UAT begins.
- For any international deployment, ACS regional availability is a hard constraint to verify before signing off on the solution design. It's not something you can work around if the region isn't supported — voice and SMS simply won't provision. Check the ACS product page for the current region list; it expands periodically.

---

*Source last updated: 2026-01-30 | Check this: New browser support added, network requirements updated, or ACS regional availability changes*
