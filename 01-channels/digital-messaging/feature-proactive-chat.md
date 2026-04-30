# Proactive Chat

**Category:** Digital Messaging
**Applies To:** Standalone only
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/proactive-chat

## What it does
Automatically initiates a chat invitation to a website visitor based on trigger rules (time on page, page URL, scroll depth, custom JavaScript events). When the visitor accepts the invitation, the chat routes to an available agent. Proactive chat improves customer engagement by offering help at the moment a customer is most likely to need it, before they have to initiate contact.

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
Use proactive chat to reduce friction for new visitors or customers stuck on a particular page. It's especially valuable on pricing pages, product pages with high abandonment, or checkout flows. Skip proactive chat if your support team is capacity-constrained (too many incoming chats); don't trigger aggressive invitations that agents can't handle. Also skip if your website has low traffic or short session durations (rule triggers won't fire often enough to be useful).

## Configuration decisions
- Which page(s) will trigger proactive chat? Single landing page, all product pages, or specific URLs?
- Which metric triggers the invitation: time on page, scroll depth, or a custom event?
- What will the invitation message say? Keep it short and action-oriented.
- Should the invitation include a chat bot handoff or go straight to an agent?
- Which queue(s) receive proactive chat requests?
- Should different pages have different invitation messages or routing?

## Gotchas
- If the chat widget is not fully loaded on the page, the trigger may not fire
- Scroll depth triggers fire only once per page load; if a visitor scrolls back up, the rule doesn't retrigger
- Custom JavaScript event triggers require the event name to be correctly configured in the page's code; typos prevent the rule from firing
- Agents see the trigger context only if the Additional Details section is configured; without it, agents don't know why the chat was initiated
- Proactive chat doesn't work on pages with restrictive Content Security Policy (CSP) headers
- High-frequency triggers (e.g., "on scroll past 10%") can cause invitation spam; set realistic thresholds
- If an agent doesn't respond to a proactive chat request within the routing timeout, the chat offer expires and the visitor sees a "no agents available" message

---

*Source last updated: 2026-02-13 | Review when: chat widget version changes or trigger accuracy issues reported*
