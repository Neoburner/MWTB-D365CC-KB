# Real-Time Translation

**Category:** Agent Experience
**Applies To:** Embedded
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/enable-real-time-translation

## What it does
Real-time translation automatically translates messages between an agent and customer who are speaking different languages during a live chat conversation. Powered by Azure Cognitive Services (Azure AI Translator), the feature detects the customer's language, presents translated messages to the agent, and translates the agent's replies back to the customer's language before display. Both the original and translated text are shown in the conversation transcript.

## Key facts
- Requires Azure Cognitive Services (Azure AI Translator) provisioned and linked to your D365 environment; there is a per-translation cost
- Supported channel: **chat only**: not available for voice, email, or social channels
- Language detection is automatic for incoming customer messages; agent language can be configured per agent or inferred from their region settings
- Translated messages appear alongside original text in the conversation; agents can see both for context
- Translation quality depends on Azure's model; technical jargon, slang, or context-dependent phrases may require human review
- Does *not* translate agent knowledge base articles, canned responses, or UI labels: only live conversation text
- Conversation history and translations are retained in the conversation record for quality assurance and auditing

## When to use / skip
Use real-time translation in multicultural or multilingual contact centers where a single agent pool serves customers in multiple languages and hiring multilingual agents is impractical or costly. Skip if your customer base is predominantly monolingual, if agents are already multilingual and prefer to handle conversations natively, or if regulatory requirements mandate human-verified translation. Avoid using it as a replacement for professional translation in high-stakes interactions (legal disputes, medical advice) where accuracy is critical.

## Configuration decisions
- **Azure Translator integration:** Provision Azure AI Translator and configure the connection endpoint, subscription key, and region
- **Automatic vs. manual:** Decide if translation runs automatically or if agents can opt out per conversation
- **Language pairs:** Restrict translation to supported language pairs (Azure AI Translator supports 100+ languages) or all pairs
- **Display format:** Choose whether to show original and translation side-by-side, stacked, or collapsible for readability
- **Logging and compliance:** Determine if translated text must be archived separately for regulatory compliance (GDPR, CCPA)
- **Cost controls:** Set alerts or caps on monthly translation API usage to prevent budget overruns

## Gotchas
- Azure AI Translator charges per character. High-volume chat centers can incur unexpected costs if usage isn't monitored.
- Translation latency (typically <1 second) can feel slow in fast-paced conversations. Set customer expectations about response time.
- Tone and sentiment are lost in translation. A casual agent phrase may sound curt or rude to a customer after translation.
- System-wide language detection can misidentify code-switching (mixing languages) or minority languages. Manual language selection may be needed.
- Translated canned responses are not automatically handled. Teams must separately translate knowledge base articles if agents rely on them.
- The feature does not translate customer context or interaction history. Agents still see metadata in English, which causes confusion.

## Consultant notes

- Per-character Azure billing catches clients off guard at scale. If the client has significant multilingual chat volumes, build a rough monthly cost estimate into the solution design sign-off: "it looked free in the trial" is not a conversation you want at month-end.
- Quick replies and knowledge articles don't translate automatically. If the client uses either heavily, they'll need separate localised versions for each language in scope. Factor that content work into the project plan.
- This covers chat only: not voice. If a client asks about translation across all channels, the voice and chat features are configured separately and behave differently (see the voice real-time translation doc for the voice-specific notes).

---

*Source last updated: 2026-04-30 | Review when: Language support expansion, cost reviews, or agent feedback on translation accuracy*
