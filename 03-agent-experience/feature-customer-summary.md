# Customer Summary (360 View)

**Category:** Agent Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/oc-customer-summary

## What it does
The Customer Summary is the form that opens in the agent's session tab when they accept or are assigned a conversation. It's the starting point for every interaction — shows who the customer is, their recent history, the current conversation details, and any Copilot-generated pre-conversation summary. In omnichannel terms, it's the output of record identification: whatever the system matched the incoming contact to gets surfaced here.

## Key facts
- Loads automatically when a conversation is accepted; agents don't navigate to it manually
- Top section shows the customer card: name, phone, email, account (if linked) — populated by record identification rules
- "Previous conversations" section shows recent contact history across all channels for the matched customer
- Conversation details panel shows channel, queue, skill tags, and sentiment score
- Copilot conversation summary (if enabled) appears at the top of the form — pre-populates with a summary of the current conversation context before the agent takes it
- The form is customisable via the Power Apps form editor — sections and fields can be added, removed, or reordered
- If record identification fails to match a customer, the customer card shows as anonymous/blank — agent must search and link manually
- The Customer Summary is a standard Dataverse form — customisations are environment-specific and will not survive a managed solution import without export/re-import of those customisations

## When to use / skip
Every live channel deployment uses the Customer Summary — it's the default form for all omnichannel sessions. The question is how much to customise it. Out of the box it covers the basics well; most clients want to add a few business-specific fields (account tier, open cases, last purchase) but rarely need a full redesign.

Worth investing in the Copilot summary integration early — it's the feature agents notice most in demos and the one that saves the most time in practice when configured well.

## Configuration decisions
- Review the default form against the client's agent workflow before go-live — identify which fields are actually used and which create noise; remove or hide unused sections
- Add a "Related Cases" subgrid if agents are expected to link conversations to open cases from the Customer Summary
- Configure record identification rules first — the Customer Summary is only as good as the match quality feeding it; a blank customer card is a record identification problem, not a form problem
- Decide how much conversation history to show — default shows recent conversations; too many items slow the form load for high-volume customers
- If the deployment includes Copilot summaries, configure the summary prompt in Copilot Studio to surface the right context for your specific use cases before training agents on it
- Consider field-level security on sensitive customer data (financial tier, credit score) — the Customer Summary is visible to all agents by default

## Gotchas
- The Customer Summary form is shared across all channels by default. Voice and chat conversations open the same form. If the client wants different layouts for different channels (e.g., more call-specific fields for voice), that requires separate forms and channel-specific session templates to load them.
- Copilot summary at the top of the form is only populated if Copilot is licensed and enabled. If agents see a blank Copilot section, it's either a licence issue or the feature hasn't been switched on in admin centre — not a form customisation problem.
- Form customisations made directly in the environment are not automatically included in solution exports. If you're doing ALM (solution management across dev/test/prod), any Customer Summary customisations must be explicitly added to the relevant solution before migration.
- "Previous conversations" shows conversation records, not case records. Agents sometimes expect to see open cases here — that requires a separate subgrid added to the form.
- Anonymous customer conversations still open the Customer Summary, just with an empty customer card. If agents aren't trained to search and link manually, conversations end up unlinked to any customer record, which breaks reporting and GDPR.

## Consultant notes

- The Customer Summary is typically the first thing the client sees in a demo and the first thing they want to customise. Manage the customisation conversation carefully — every field they add to the form is a field that loads on every conversation accept, and form complexity directly affects load time. For high-volume contact centres, a leaner form loads faster and keeps agents moving. Agree on a short list of additions and defer the rest to a post-go-live phase.
- Record identification and Customer Summary are the same conversation from the agent's perspective — if the customer card is blank, agents don't perceive it as "record identification didn't match." They perceive it as "the system is broken." Make sure record identification is tested thoroughly with real customer data patterns before go-live, including edge cases like shared email addresses and customers who've called from multiple numbers.
- The Copilot conversation summary at the top is worth demonstrating explicitly in agent training, not just handover docs. Agents who don't notice it skip it. Agents who do notice it and understand what it's summarising (bot interaction history, customer intent, previous turns) save significant handle time. Frame it in training as the system doing the pre-read for them.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft restructures the Customer Summary form or changes Copilot summary placement*
