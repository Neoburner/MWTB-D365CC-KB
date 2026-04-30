# Real-Time Translation (Voice)

**Category:** Voice / Multilinguality
**Applies To:** Standalone / Embedded (via Contact Center voice channel)
**Source:** [Enable Real-Time Translation of Conversations - Microsoft Learn](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-real-time-translation)

## What it does
Real-Time Translation for voice calls provides live translation of conversations between an agent and customer who speak different languages. The agent hears a translated audio stream in their language while the customer hears the agent's speech translated back to theirs. A translated transcript is generated in real time and stored alongside the original call recording. This enables agents to serve multilingual customers without requiring bilingual staff.

## Key facts
- Powered by Azure AI Speech and Cognitive Services (separate subscription required)
- Supported language pairs: 50+ major languages (see Azure documentation for full list)
- Translation latency: 2–4 seconds per utterance (customer speaks → translation delay → agent hears translated audio)
- Audio quality may degrade slightly due to translation processing; accent and nuance can be lost
- Transcript includes both original and translated text, searchable and auditable
- Conversation is recorded before translation; original language is preserved in primary recording
- Agent and customer each hear the translated version, not a mixing of languages
- No special agent training required; agent speaks normally, system handles audio routing
- Licensing: Separate Azure Cognitive Services charges apply (per minute of translated audio, not per call)
- Translation accuracy depends on audio quality, accents, background noise, and language pair; less common language pairs may be less accurate
- Does not translate written chat, SMS, or email—only voice calls

## When to use / skip
Use real-time translation if you've got multilingual customers but can't hire bilingual agents, or want to expand geographically without local hiring. Skip it if everyone speaks the same language, or if your call volume is low enough that hiring bilinguals is cheaper. Also skip it for specialized or regulated work (legal, medical) where accuracy and liability matter — hire a human interpreter instead.

## Configuration decisions
- **Language pairs** — Which pairs do you enable? English ↔ Spanish, English ↔ Mandarin, etc.
- **Translation triggers** — Automatic (detect language, translate immediately) or agent-initiated (request mid-call).
- **Failover** — If translation fails, callback with an interpreter, escalate to a bilingual agent, or apologise and hang up.
- **Transcript storage** — Contact Centre table, external CRM, or both.
- **Retention policy** — How long to keep translated transcripts? Compliance may force longer retention.
- **Quality thresholds** — When does translation accuracy drop enough to escalate or flag for review.
- **Customer disclosure** — Tell them translation is active ("Your call will be translated for accessibility").
- **Recording disclosure** — GDPR, CCPA: inform them about recording + translation.
- **Dialect testing** — Test with real customers before rollout. Accents matter.

## Gotchas
- **Latency kills call flow.** A 2–4 second delay per exchange makes conversations feel clunky. People talk over each other.
- **Colloquialisms and jargon don't translate well.** Slang, technical terms, regional expressions — the AI can mess these up.
- **Homophones trip up translation.** "Bear" vs. "bare" — context helps but it's not foolproof.
- **Accents degrade speech recognition first.** Thick accents or dialects reduce the accuracy of speech-to-text before translation even happens.
- **Names and numbers get mangled.** Proper names, order numbers, account IDs — agents must verify these.
- **Agents can't switch languages.** The agent can't suddenly speak the customer's language to build rapport. They're stuck in their own language.
- **Hold music and IVR prompts don't translate.** Only the live conversation translates. Customers in queue or on hold hear untranslated content.
- **Voice data goes to Azure.** Customer audio is sent to Azure services for translation. Check data residency and GDPR compliance.
- **Translation bills surprise you.** It's metered by minutes of audio. High-volume centres can face unexpected Azure charges.
- **Storage doubles with bilingual transcripts.** Original + translated = 2x storage. Plan for archive costs.
- **Dialect variations cause problems.** Latin American vs. Spain Spanish, Modern Standard vs. regional Arabic, Indian vs. UK English. Test with your real customer base.

---

*Source last updated: 2026-04-30 | Worth revisiting if translation escalations hit 5%, translated-call CSAT drops, or you need new language pairs*
