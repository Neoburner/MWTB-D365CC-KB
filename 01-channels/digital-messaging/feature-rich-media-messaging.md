# Rich Media Messaging

**Category:** Channels: Digital Messaging
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/leverage-rich-media-messaging-across-channels

> **Status:** Generally Available: went GA March 30, 2026 (Public Preview from October 25, 2025).

## What it does
Lets admins create structured message templates, forms, suggested reply buttons, and adaptive card JSON, that agents send to customers during chat or WhatsApp conversations. The customer interacts with the template (fills in a form, taps a reply button) and the response comes back to the agent automatically.

## Key facts
- Templates are created in Copilot Service admin center and are channel-aware; the right template shows automatically depending on whether the agent is in a chat or WhatsApp session
- **Live chat widget supports:** Forms (multi-select, single-select, dropdown, single-line input, date picker, multiline input), Suggested replies (reply buttons), and Custom JSON (freeform adaptive cards)
- **WhatsApp supports:** Suggested replies only: up to 3 reply buttons per card
- SMS and other channels are not supported
- Custom JSON templates are built using Microsoft adaptive card technology and can be reused in Copilot Studio adaptive card nodes: you don't need to rebuild the same card for the bot
- Agents see the templates in Customer Service workspace; they select and send without typing out the content
- Customer responses from form submissions and reply buttons route back to the conversation thread

## When to use / skip
Use this when you want to collect structured data during a live chat without asking customers to type free-form answers, intake forms, preference questions, feedback collection. Suggested replies work well for common "yes/no/not sure" branching points. Skip it if your conversations are primarily voice or email, this is chat and WhatsApp only.

## Configuration decisions
- Who owns template design and maintenance: this is an admin function but has UX implications; marketing or operations teams often want input
- Which channels each template is scoped to: chat-only, WhatsApp-only, or both
- Whether to reuse adaptive card JSON in Copilot Studio bots: worth planning upfront if you have both bot and agent serving the same channel
- Approval workflow for template changes: no built-in approval; establish your own governance

## Gotchas
- WhatsApp is limited to 3 reply buttons per card: that's the WhatsApp platform constraint, not a D365 one. Design your flows around it.
- Custom JSON adaptive cards require someone who knows the adaptive card schema. It's not a no-code experience.
- Templates are channel-aware at admin configuration time: if you misconfigure the channel scope, agents will see templates they can't actually send in their current session.
- No versioning of templates out of the box. If you update a template mid-project, there's no rollback.
- The customer response from a form comes back as structured data, but how that's stored or routed depends on your Copilot Studio / Power Automate handling: plan this before go-live.

## Consultant notes

## Consultant notes

- Template governance is the post-go-live problem nobody scopes. Who creates new templates? Who reviews them? Who has admin access to change them? No built-in approval workflow means you need a process. Get this agreed and documented before handover: otherwise you'll get a support call three months later when someone pushed a broken adaptive card to production.
- The WhatsApp 3-button limit catches clients who design flows on desktop without testing on mobile. Build the WhatsApp flows within the constraint from day one rather than retrofitting.
- Adaptive card JSON is not a no-code skill. If the client's admin team is expected to maintain custom JSON templates post-go-live, either train them specifically or design the templates to only use the standard form controls (forms, suggested replies) that have a UI in admin center. Don't leave raw JSON maintenance to someone who isn't comfortable editing it.


---

*Check whether rich media template support expands to SMS or Teams in 2026wave2.*
