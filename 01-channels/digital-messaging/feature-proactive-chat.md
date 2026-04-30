# Proactive Chat

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/proactive-chat

## What it does
Automatically invites website visitors to chat based on trigger rules (time on page, URL, scroll depth, custom events). When they accept, the chat routes to an available agent. The idea is to offer help at the moment someone's most likely to need it, before they ask.

## Key facts
- Trigger rules can combine: page URL, time spent on page (in seconds), scroll depth percentage, or custom JavaScript events
- Chat invitation auto-closes after 60 seconds if the customer doesn't respond (non-configurable timer)
- Requires the chat widget to be embedded on the target website pages
- Only one proactive chat rule fires per visit; subsequent rules don't trigger until the page reloads
- Trigger context (page URL, time on page, scroll depth) is visible to agents in the Additional Details tab
- Proactive chat messages are personalized per rule (you set the invitation text)
- A visitor who declines a proactive chat invitation won't see another invitation from the same rule for 24 hours
- Works with both tracked and anonymous website visitors
- Requires Copilot Studio or a custom bot connected via Direct Line for bot-assisted proactive chat

## When to use / skip
Use proactive chat to reduce friction for new visitors or people stuck on a page—pricing, high-abandonment product pages, checkout. Skip it if your team can't handle the volume. Also skip if traffic is low or sessions are short; the rules won't trigger often enough to matter.

## Configuration decisions
- Which page(s) will trigger proactive chat? Single landing page, all product pages, or specific URLs?
- Which metric triggers the invitation: time on page, scroll depth, or a custom event?
- What will the invitation message say? Keep it short and action-oriented.
- Should the invitation include a chat bot handoff or go straight to an agent?
- Which queue(s) receive proactive chat requests?
- Should different pages have different invitation messages or routing?

## Gotchas
- If the chat widget isn't fully loaded, the trigger won't fire.
- Scroll depth triggers fire once per page load; scrolling back up doesn't retrigger them.
- Custom JavaScript events require exact naming in your page code; typos break the rule.
- Agents only see trigger context if Additional Details is configured. Without it, they won't know why the chat started.
- Proactive chat doesn't work with restrictive Content Security Policy (CSP) headers.
- High-frequency triggers (like "scroll past 10%") spam customers with invitations; set realistic thresholds.
- If an agent doesn't respond within the routing timeout, the invitation expires and the visitor sees "no agents available."

---

*Source last updated: 2026-02-13 | Worth checking again if chat widget version changes or you spot trigger accuracy issues*
