# Accessibility (Screen Reader & Keyboard Navigation)

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/accessibility

## What it does
D365 Contact Center and Copilot Service Workspace are designed to be accessible to agents using assistive technologies, primarily keyboard-only navigation and screen readers. Microsoft publishes accessibility conformance reports for D365 products against WCAG 2.1 AA and Section 508 standards. The accessible experience covers the main agent workflow: accepting conversations, reading and composing messages, navigating customer records, and accessing the Copilot panel.

## Key facts
- CSW supports keyboard-only navigation: all core agent functions (accept conversation, end conversation, navigate sessions, send messages) have keyboard shortcuts or are reachable via Tab/Enter
- Screen reader support: tested with JAWS, NVDA, and Narrator on Windows with Edge or Chrome; other combinations may work but are not formally supported
- Key keyboard shortcuts: Ctrl+Alt+A (accept conversation), Ctrl+Alt+E (end conversation), Ctrl+Alt+H (hold), Ctrl+Alt+M (mute), Ctrl+Shift+[number] (switch session)
- Microsoft's Accessibility Conformance Report (ACR) for D365 Customer Service is available on request from Microsoft: for clients with formal procurement accessibility requirements
- The chat communication panel supports keyboard navigation for message composition and send
- Some third-party components embedded via CIF v2 or iframe may not inherit D365 accessibility support: each embedded component must be separately assessed
- Mobile accessibility (iOS/Android) is not in scope for D365 Contact Center agents: the agent experience is browser-based on desktop

## When to use / skip
Relevant for any deployment where agents may use assistive technology, where the client has a legal accessibility obligation for employee-facing tools (Section 508 in the US, Equality Act in the UK), or where the procurement process requires an accessibility conformance statement. Not all deployments have this requirement, but it should be explicitly checked rather than assumed.

## Configuration decisions
- There is no on/off configuration for accessibility: it's built into the product; the question is whether the client's specific deployment customisations (custom forms, embedded tabs, third-party widgets) maintain accessibility
- Test any custom forms, application tab templates, or embedded content for keyboard navigability and screen reader compatibility during UAT: customisations can break accessibility even if the base product is accessible
- Provide the keyboard shortcut reference in agent training materials and quick reference cards: agents using keyboard nav benefit from knowing the full shortcut set
- If formal accessibility certification is required for procurement, request Microsoft's Accessibility Conformance Report for D365 Customer Service and supplement it with a deployment-specific UAT using an actual screen reader and keyboard-only navigation

## Gotchas
- Custom model-driven app forms built using Power Apps form editor inherit Unified Interface's accessibility framework, but custom JavaScript on forms can break keyboard focus or screen reader announcements if written without accessibility awareness. Any custom form scripting should be reviewed for accessibility impact.
- Iframe-embedded content (via application tab templates) is a common accessibility gap. An iframe loads external content which is entirely outside D365's accessibility framework: screen readers may not be able to navigate into it. This is a per-component assessment.
- The Copilot productivity panel (right-hand AI panel) is keyboard accessible in the base product, but the navigation between the main form and the panel requires specific key sequences that are not always intuitive. Include this in accessibility UAT.
- Some omnichannel notification toasts have short display windows: for screen reader users who need more time to process audio announcements, the default toast timeout may be too brief. Check the toast timeout configuration in notification templates.
- Browser-level accessibility tools (zoom, high contrast, browser font size settings) interact with CSW's responsive layout: test at 200% zoom and with Windows high contrast mode as part of basic accessibility verification.

## Consultant notes

- Accessibility is often asked about at procurement and then not revisited during implementation. The right time to do accessibility testing is in UAT, not at go-live. Any custom forms, embedded tabs, or iframe content added during build can introduce accessibility regressions. Include at least a basic keyboard-nav and screen reader test in the UAT script for deployments with accessibility requirements.
- The Microsoft Accessibility Conformance Report covers the base product. It does not cover the client's deployment: their custom forms, their embedded widgets, their session template tabs. Make sure procurement teams understand this distinction. A product-level ACR is not the same as a deployment-level accessibility certification.
- If the client has employees with visual impairments using the contact centre system, get an actual screen reader user involved in UAT. Technical accessibility testing (checking ARIA labels and tab order) identifies structural issues; lived experience testing identifies whether the workflow actually works. These are different things.

---

*Source last updated: 2026-04-30 | Revisit when Microsoft publishes updated accessibility conformance reports or when WCAG standards update*
