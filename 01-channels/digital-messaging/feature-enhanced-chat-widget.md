# Enhanced Chat Widget

**Category:** Digital Messaging — Channels
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/delight-customers-enhanced-chat-widget

> **Status:** Public Preview — behaviour may change. Preview: May 2026 | GA: Sep 2026

## What it does
A redesigned customer-facing live chat widget with faster load times, a modernised default look, and expanded branding customisation options. Delivered via a new script tag in the workstream config — the existing widget script continues to work until you switch over.

## Key facts
- Public preview: May 2026; GA: Sep 2026
- Enabled by admins — requires switching to a new script tag in the workstream configuration in Copilot Service admin center
- Faster load via optimised scripting — reduces time-to-display of the chat button on slower connections
- New default appearance; customisation options expanded to better align with your brand and website design
- Enhanced media support within the widget (specifics not yet published)
- Existing widget script remains available — you opt into the new experience by adopting the new tag

## When to use / skip
Worth switching to once GA if you care about chat load performance or need more visual alignment with your website branding. Not urgent for go-live on Standalone if you're deploying before Sep 2026 — the existing widget works fine. Skip for Embedded deployments if the widget is hidden inside a CIF app and branding isn't a concern.

## Configuration decisions
- Where and when to switch from the existing script tag to the new one — do this in a dev/UAT workstream first
- Review customisation options in the new tag; you may need to re-implement any custom CSS or overrides applied to the existing widget
- Coordinate timing with the web team — the new tag likely changes the DOM structure, so any JavaScript event listeners on the widget will need testing

## Gotchas
- Don't assume the new script tag is a drop-in replacement. Test in a non-production environment before switching production workstreams.
- "Enhanced media support" is vague in the release plan — get clarity on what file types and media embeds are supported before committing to this in a contract.
- The preview period (May–Sep 2026) is relatively short. If you're planning a deployment between now and Sep 2026, factor in whether to start on the old widget or go straight to preview.

---

*Worth revisiting when the GA notes land in Sep 2026 to confirm full customisation option list and any DOM changes.*
