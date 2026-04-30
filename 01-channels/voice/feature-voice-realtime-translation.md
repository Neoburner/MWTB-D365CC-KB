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
**Use Real-Time Translation** when you serve a multilingual customer base but cannot staff bilingual agents, or when you want to expand into new geographic markets without hiring locally. Example: a US support center translating calls to Spanish, Mandarin, or Arabic. **Skip it** if all your customers speak the same language, or if call volumes are low enough that hiring bilingual staff is more cost-effective. Also avoid it for highly specialized or regulated interactions (e.g., legal, medical) where translation accuracy and liability are critical—human interpretation is safer.

## Configuration decisions
- **Language pair enablement**: Which language pairs should be available? (E.g., English ↔ Spanish, English ↔ Mandarin)
- **Translation initiation**: Automatic (detect customer language and translate immediately) or agent-initiated (agent requests translation mid-call)?
- **Fallback if translation fails**: Offer callback with interpreter, escalate to bilingual agent, or disconnect with apology?
- **Transcript storage location**: Store in Contact Center transcripts table, external CRM, or both?
- **Transcript retention policy**: How long to keep translated transcripts? Compliance may require longer retention
- **Quality threshold**: Monitor translation accuracy; set threshold for when human review or escalation is needed
- **Customer notification**: Do you inform the customer that translation is active? ("Your call will be translated for accessibility")
- **Recording policy**: Inform customers of recording + translation per GDPR, CCPA, or other regulations
- **Accent and dialect handling**: Some customers may have strong accents; test real scenarios before full rollout

## Gotchas
- Translation latency impacts call naturalness: A 2–4 second delay per back-and-forth can make conversations feel awkward; customers may talk over each other
- Accuracy loss with colloquialisms, slang, or industry jargon: Translation AI may misinterpret technical terms or colloquialisms, leading to misunderstanding
- Homophone confusion: Words that sound alike in one language may be mistranslated (e.g., "bear" vs. "bare" in English); context helps but isn't foolproof
- Accent affects recognition: Thick accents or regional dialects may reduce speech-to-text accuracy before translation, compounding the problem
- Translation of names and numbers: Proper names and numeric sequences (e.g., order numbers, account IDs) may be garbled; agents must verify
- Agent cannot interject in customer's language: The agent must speak English (or their native language); they cannot switch to customer's language mid-call to build rapport
- No translation of hold music, IVR prompts, or system messages: Only the agent-customer dialogue is translated; if customers are in an automated queue or on hold, they hear untranslated content
- GDPR/privacy considerations: Customer voice data is sent to Azure services for translation; ensure data residency and compliance with regional requirements
- Cost surprises: Translation is metered by minutes of translated audio; high-volume call centers may face unexpected Azure bills
- Conversation recording size: Storing both original and translated transcripts doubles storage; plan for archive costs
- Dialect variations: Spanish (Latin American vs. Spain), Arabic (Modern Standard vs. regional), English (Indian vs. UK) may be mis-detected or mistranslated; test with real customer base

---

*Source last updated: 2026-04-30 | Review when: Customer escalations due to translation misunderstandings exceed 5%, CSAT scores for translated calls drop, or if new language pairs are needed*
