# Responsible AI Controls

**Category:** Copilot & AI Assistance
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/responsible-ai-overview

## What it does
Responsible AI controls are the guardrails, transparency mechanisms, and governance settings that Microsoft and administrators apply to Copilot and AI features in D365 Contact Center to make AI behaviour safe, auditable, and controllable. This covers content filtering, AI transparency disclosures, grounding controls (keeping Copilot responses tied to authorised knowledge sources), human oversight settings, and the mechanisms for disabling AI features that produce problematic outputs.

## Key facts
- Microsoft applies content safety filters to all Copilot outputs by default: responses are filtered for harmful, offensive, or policy-violating content
- Grounding: Copilot is configured to base responses on specified knowledge sources (SharePoint, knowledge articles, configured URLs): this is the primary mechanism for keeping Copilot answers accurate and on-topic
- Verbatim response control: administrators can require Copilot to cite sources and surface verbatim article content rather than paraphrasing: reduces hallucination risk (see `feature-copilot-verbatim-responses.md`)
- Copilot usage is logged in the Copilot Analytics dashboard: administrators can audit which features are being used, by whom, and with what outcomes
- Agents can provide feedback on Copilot responses (thumbs up/down): this feedback is logged and available to administrators for quality review
- Administrators can disable specific Copilot features (conversation summary, email drafting, knowledge suggestions) per experience profile without disabling Copilot entirely
- Microsoft publishes a Transparency Note for D365 Customer Service Copilot describing the AI system's capabilities, limitations, and failure modes: this is a required disclosure for enterprise AI deployments in regulated industries
- AI Builder and Azure OpenAI Service underpin the Copilot features: the data processing occurs within the Microsoft cloud region of the environment (subject to data residency configuration)

## When to use / skip
Responsible AI isn't a feature to "use or skip", it's a framework that applies to all Copilot deployments. The relevant questions are: what governance controls has the client configured, have they reviewed Microsoft's Transparency Notes, and is the AI usage auditable?

For regulated industries (financial services, healthcare, public sector), the responsible AI documentation is often a procurement or compliance requirement, not just a good-practice consideration.

## Configuration decisions
- Review and configure Copilot knowledge source grounding: restrict Copilot to authorised sources rather than allowing open-ended responses; this is the most important single control for accuracy
- Enable agent feedback collection on Copilot responses and assign someone to periodically review negative feedback: identify patterns in poor-quality AI outputs
- Configure which Copilot features are available per agent role via experience profiles: not every agent role needs every Copilot feature; reduce scope to what's relevant
- Read and retain Microsoft's Transparency Note for D365 Customer Service: for regulated industries, this forms part of the AI governance documentation required by some regulatory frameworks
- Document the AI decision-making in the system design: which decisions are AI-assisted (Copilot suggests, agent decides) vs automated (AI acts without agent review): this distinction matters for accountability and audit

## Gotchas
- Copilot grounding does not guarantee accuracy. Copilot answers are based on the knowledge sources provided, but if those sources are incomplete, outdated, or poorly written, Copilot will confidently produce answers that are incomplete, outdated, or misleading. Grounding addresses the source; knowledge quality is a separate content management problem.
- Content safety filters can be too aggressive in some contexts. Copilot responses in technical or compliance domains may include terminology that triggers content filters incorrectly, producing unhelpful sanitised responses. If agents report Copilot giving unexpected or truncated responses on specific topics, content filter interaction is a potential cause.
- The agent feedback mechanism (thumbs up/down) is only useful if someone reviews the negative feedback. Enabling the feedback button without a process for reviewing and acting on it creates false assurance that AI quality is being monitored.
- AI features that are "off" in the experience profile are off for the agent UI: but underlying AI processing (transcription, sentiment analysis) may still occur even if the agent-facing output is hidden. Review the full processing scope with the client's privacy team, not just the visible features.
- Transparency Notes describe the AI system's general design, not the client's specific deployment. The Notes are useful for compliance documentation but don't absolve the client of documenting their specific AI use case and the controls they've implemented.

## Consultant notes

- The Transparency Note review is something to put on the client's project checklist rather than doing it for them. The client's compliance or legal team should read it and sign off that they understand what the AI does and doesn't do. Making it a client action: not a consultant checkbox: means the right people in the client organisation are accountable for the AI governance decision.
- "Grounding is on" is not the same as "Copilot answers will be accurate." Grounding is a necessary condition for accuracy, not a sufficient one. The quality of what Copilot is grounded to: the knowledge articles, the SharePoint content, the website pages: determines whether grounded Copilot responses are useful. Include a knowledge content quality review in the implementation scope for any deployment that prioritises Copilot knowledge accuracy.
- In regulated industries, document the human-in-the-loop position for every AI-assisted action. Copilot in D365 is always assistive (agent reviews and approves before anything is sent), so the human oversight is built in: but this should be stated explicitly in any AI governance documentation the client produces for their regulator. "Agent reviews every Copilot suggestion before it is sent to the customer" is the sentence the compliance team needs.

---

*Source last updated: 2026-04-30 | Revisit when Microsoft updates the Transparency Note or adds new responsible AI controls to the admin centre*
