# Co-browse / Screen Share

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/cobrowse-screen-share

## What it does
Agent can view the customer's browser session during chat and optionally take limited control. Agent sees exactly what the customer sees, reducing confusion and enabling real-time guidance. Requires a third-party provider (Surfly, UserReplay, etc.) integrated into the chat widget.

## Key facts
- Co-browse is agent-initiated; agent requests access and customer must accept via a prompt
- Customer sees a clear indication that the agent is viewing their screen (persistent banner, cursor indicator)
- Agent can view but not control customer's screen by default; limited control (clicking, scrolling) requires explicit customer consent
- Co-browse applies only to the browser window; system clipboard, other apps, and sensitive data outside the browser are not visible
- Session is recorded by default (varies by provider); must comply with privacy laws and inform customer of recording
- Co-browse requires the third-party integration to be configured and license active in D365 Contact Center
- Bandwidth requirement: 2-5 Mbps downstream for smooth co-browse experience
- Co-browse timeout defaults to 15-30 minutes; session auto-terminates if inactive
- Works across most modern browsers (Chrome, Edge, Safari, Firefox) but may have issues with some specialized enterprise browsers

## When to use / skip
Use co-browse for visual problems: button navigation, form-filling, confusion about where something is. It cuts resolution time dramatically. Skip it for text-only issues, privacy-sensitive data entry (cards, SSNs shouldn't be agent-visible), poor connections, or if you haven't trained agents on privacy boundaries.

## Configuration decisions
- Should agents be able to take control (click, scroll) or view-only?
- Will co-browse sessions be recorded? If yes, must have customer consent flow.
- How long should co-browse sessions remain active? (15, 30, or 60 minutes)
- Which support queues have co-browse enabled? All or specific high-touch queues?
- What third-party provider will you use? Surfly, UserReplay, or custom integration?
- Should there be a limit on co-browse usage per customer or per agent per day?

## Gotchas
- Browser performance degrades during co-browse (typical 5-15% CPU increase); set customer expectations.
- Co-browse doesn't work with restrictive CSP (Content Security Policy) or iframe restrictions; you'll need to test per website.
- Agent control can feel invasive if not explained clearly; training helps.
- Recording requires explicit consent and disclosure of retention period.
- If the customer navigates to a different domain, the session drops and the agent has to request access again.
- Co-browse provider uptime and latency directly affect chat quality; third-party SLA is critical.
- Agent misclicks are visible to the customer; training is essential.
- Co-browse doesn't work on mobile browsers or app chat—only desktop web. Tell customers upfront.

## Consultant notes

- Most clients want co-browse because it looks good in demos. The third-party provider licensing cost often kills it when they see the actual numbers. Have the vendor pricing conversation before it becomes a design assumption that's hard to remove.
- CSP and iframe restrictions on the client's website are the most common technical blocker. Test the provider's script on the actual production domain early in the project — not on a dev environment with relaxed headers.
- Agent training is non-negotiable before go-live. Agents who take control without explaining what they're doing genuinely alarm customers. Include a co-browse scenario in UAT and make sure agents narrate what they're doing.

---

*Source last updated: 2026-04-30 | Worth checking again after a third-party provider change or security compliance update*
