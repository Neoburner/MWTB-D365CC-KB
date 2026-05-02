# Customer Assist Agent: Voice (Real-Time Low-Latency)

**Category:** AI Agents (Autonomous)
**Applies To:** Standalone (D365 Contact Center)
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/customer-assist-agent-voice

> **Status:** GA: June 2026 (2026 Wave 1). No public preview announced at time of writing. Treat specifics as subject to change until GA notes are published.

## What it does
The Customer Assist Agent, Voice extends the autonomous AI agent capability (previously digital-channel-only) to live voice conversations. Using low-latency speech processing, the AI agent can handle a full voice call, understanding spoken customer intent, responding with synthesised speech, taking actions in CRM systems, without requiring a human agent. When the AI cannot resolve the issue, it escalates to a human agent with conversation context. This is the voice equivalent of the Customer Assist Agent for digital channels.

## Key facts
- GA: June 2026 (2026 Wave 1); no public preview at time of writing
- Requires Azure Communication Services (ACS) for the voice channel: the AI voice agent is a Copilot Studio agent with low-latency voice processing layered on top of the ACS voice infrastructure
- The voice agent uses neural TTS (Text-to-Speech) for synthetic voice output: voice quality and language support follows Azure AI Speech capabilities
- Real-time STT (Speech-to-Text) converts customer speech to text for Copilot Studio intent processing: same transcription pipeline as the agent-visible transcript feature
- End-to-end latency for voice AI responses is the key design constraint: responses must be sub-2-second to avoid unnatural conversation pauses; Microsoft's "low-latency" label addresses this requirement
- The AI voice agent can perform agentic actions (read/write to Dataverse, query external APIs) during the call: not just respond with information
- When escalation to a human agent is triggered, the call transfers through the standard ACS PSTN transfer mechanism; the bot-to-agent handoff includes conversation context just as in digital escalations
- Language support for voice agents follows Azure AI Speech STT/TTS language availability: broader than what Copilot Studio text NLU covers in some languages

## When to use / skip
Use for high-volume, structured voice contact patterns where the interaction can be defined, account queries, order status checks, appointment booking, payment queries. The voice AI agent is most effective for the same scenarios that a well-designed IVR would handle, but with natural language rather than DTMF or menu prompts.

Don't scope for complex, emotionally sensitive, or highly variable conversations, the AI voice agent is not equipped for empathy-driven or unstructured dialogue. Escalation design is the critical safety valve: the agent must reliably recognise when to hand off to a human.

Don't scope for go-live before June 2026, it doesn't exist yet.

## Configuration decisions
- Design the voice agent conversation flows in Copilot Studio: same authoring environment as digital agents, but with voice-specific considerations (shorter responses, clear escalation prompts)
- Select TTS voice persona: Azure AI Speech offers multiple voices in each language; choose one that matches the brand tone and test it with representative customer queries
- Configure escalation triggers carefully: define the conditions under which the AI agent hands off to a human, including failure conditions (customer frustration, repeated misunderstanding, explicit human agent request)
- Test latency in the actual network path from ACS to the Copilot Studio endpoint: latency budget is tight for voice; any network hop that adds significant delay produces an unnatural conversation experience
- Comply with jurisdictional disclosure requirements: in many regions (UK FCA, EU, US state laws) AI-handled telephone calls must disclose that the caller is speaking with an AI; design the opening disclosure into the conversation flow

## Gotchas
- AI voice agent disclosure is a legal requirement in multiple jurisdictions, not a UX choice. Check the regulatory requirements for the client's operating region before finalising the voice agent opening flow. This is not optional.
- Latency is the most common production issue for voice AI agents. STT → Copilot processing → TTS → ACS audio delivery is a multi-hop pipeline. Each hop has latency. If any component is in a distant Azure region from the ACS resource, response times degrade and the conversation becomes unnatural. Keep all components in the same Azure region.
- TTS voice selection matters more for voice agents than for IVR because conversations are natural-language and longer. A robotic TTS voice that was acceptable for a 3-option menu prompt is unacceptable for a 5-minute account service conversation. Test voice quality with actual users, not just technically.
- STT accuracy varies by accent, background noise, and speaking speed. Test with a realistic range of accents for the client's customer base: not just standard RP English or General American. STT inaccuracy in production means misunderstood intent and wrong responses.
- This is a June 2026 planned feature. Verify everything against GA release notes before building: capability specifics, TTS language support, and agentic action scope may differ from the pre-GA documentation.

## Consultant notes

- Voice AI agent deployment for production use requires a voice design specialism that not all implementation consultants have. The conversation flow design: turn-taking, repair strategies, escalation triggers, disambiguation: is a voice UX discipline. If the client is seriously scoping this, involve a conversational UX designer or a team that has deployed voice AI agents before, not just someone who's built Copilot Studio digital agents.
- The regulatory disclosure requirement is non-negotiable and jurisdiction-specific. "Customers don't mind" is not a legal position. Get the client's legal or compliance team to confirm the disclosure requirement for each operating region before any voice AI agent is put in front of live customers. This is a sign-off that should be documented.
- AI voice agents and IVR are not the same thing. Clients who have IVR experience sometimes assume voice AI agents work similarly: press 1 for X, press 2 for Y, but with voice. The difference is that voice AI agents understand natural language and are non-deterministic in their routing. The design process is more like writing a conversational flow than a DTMF menu. If the client's expectations haven't been calibrated on this, the design phase will have misaligned assumptions.

---

*Feature planned for GA: June 2026. Verify all details against GA release notes before scoping into any project.*
