# Copilot Draft a Chat Response (Preview)

**Category:** Copilot and AI
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/implement/deprecations-contact-center

> **Deprecated:** This feature was removed on 14 July 2025. If you had it enabled, it is no longer available.

## What it did
A public preview Copilot capability that generated a suggested response for the agent to send in a live chat conversation. The agent could review and send the draft or discard it. It was a precursor to the current Copilot help pane, which handles response suggestions as part of a broader assist experience.

## Key facts
- Deprecated as of 1 July 2025; support removed 14 July 2025
- Was a public preview feature — never reached GA
- Functionality superseded by the Copilot Help Pane (specifically the "Suggest a response" capability within Ask a Question)
- No migration path required — the replacement is the standard Copilot help pane experience

## When to use / skip
It no longer exists. If you're documenting or auditing a deployment that references "Draft a chat response," it was removed in mid-2025. Point anyone asking to the Copilot Help Pane doc instead.

## Configuration decisions
- None — if it was enabled in a previous environment, it's gone
- If an experience profile or custom workspace layout was built around this control, review the layout — the Copilot help pane requires its own toggle in the experience profile

## Gotchas
- Any implementation documentation from before July 2025 that references "Draft a chat response" is out of date. Worth flagging in discovery if a client's internal runbooks mention it.
- The Copilot help pane does similar things but requires separate configuration — don't assume it's on by default in an environment that had Draft a Chat Response enabled.

---

*No further review needed — feature is removed. See [Copilot Help Pane](feature-copilot-help-pane.md) for the current equivalent.*
