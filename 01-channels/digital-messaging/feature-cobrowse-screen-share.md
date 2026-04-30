# Co-browse / Screen Share

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/cobrowse-screen-share

## What it does
Allows a support agent to view the customer's browser session (and optionally take limited control) during a live chat interaction. The agent can see exactly what the customer sees, reducing misunderstandings and enabling real-time visual guidance. Co-browse is typically powered by a third-party provider (Surfly, UserReplay, or similar) integrated into the chat widget.

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
Use co-browse for complex visual issues: "I can't find the button," navigation confusion, or form-filling assistance. It dramatically reduces resolution time for these types of issues. Skip co-browse for simple text-based support, privacy-sensitive customer data entry (credit cards, SSNs should not be visible to agent), or when the customer's connection is poor. Also skip if you haven't trained agents on using co-browse responsibly and respecting customer privacy boundaries.

## Configuration decisions
- Should agents be able to take control (click, scroll) or view-only?
- Will co-browse sessions be recorded? If yes, must have customer consent flow.
- How long should co-browse sessions remain active? (15, 30, or 60 minutes)
- Which support queues have co-browse enabled? All or specific high-touch queues?
- What third-party provider will you use? Surfly, UserReplay, or custom integration?
- Should there be a limit on co-browse usage per customer or per agent per day?

## Gotchas
- Customer's browser performance may degrade during co-browse (5-15% CPU increase typical); inform customers to expect this
- Co-browse doesn't work on pages with restrictive CSP (Content Security Policy) or iframe restrictions; testing is required per website
- Agent control features (if enabled) can feel invasive to customers; clear communication and training reduce friction
- Recording compliance: you must have explicit consent before recording co-browse sessions and must disclose retention period
- If the customer navigates to a different domain during co-browse, the session drops; agent must request access again
- Co-browse provider outages or latency directly impact chat quality; SLA for third-party provider is critical
- Agent accidental actions (clicking wrong button, typing in wrong field) are visible to customer; training is essential
- Co-browse doesn't work on mobile browsers or app-based chat (only web browsers); clarify this limitation to customers upfront

---

*Source last updated: 2026-04-30 | Review when: third-party provider changes or security compliance updates*
