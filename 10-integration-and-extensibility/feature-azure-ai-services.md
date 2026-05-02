# Azure AI Services Integration (Speech, Language)

**Category:** Integration & Extensibility
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/azure-ai-services

## What it does
D365 Contact Center's AI features (transcription, sentiment analysis, real-time translation, entity recognition in bots) are powered by Azure AI Services, specifically Azure AI Speech (for STT/TTS), Azure AI Language (for NLP, sentiment, entity extraction), and Azure OpenAI (for Copilot generative AI features). The integration between D365 Contact Center and these Azure AI services is largely managed by Microsoft, but there are configuration options that control service endpoints, language models, and in some cases, client-owned Azure AI resource connections.

## Key facts
- By default, D365 Contact Center uses Microsoft-managed Azure AI resources: the contact centre connects to shared AI services managed within the Microsoft cloud; the client does not need a separate Azure subscription for basic AI features
- For clients who want to use their own Azure AI Speech resource (bring your own resource): this is supported for voice transcription and enables use of custom speech models trained on the client's specific vocabulary
- Custom speech models: Azure AI Speech supports uploading audio training data to improve recognition accuracy for specific accents, domain terminology, or brand names; these models can be connected to D365 Contact Center's voice transcription
- Azure AI Language: used for sentiment analysis and entity extraction in conversation context; not currently configurable to a client-owned Azure AI Language resource (Microsoft-managed)
- Azure OpenAI: powers Copilot generative AI features; Microsoft manages the Azure OpenAI resource; clients cannot currently connect their own Azure OpenAI resource to D365 Copilot
- Data processing: AI processing of voice transcriptions occurs in Azure AI Speech in a region determined by the ACS resource region; this has data residency implications (see `feature-data-residency.md`)
- Cost: the shared Microsoft-managed Azure AI services are included in D365 licensing costs; a client-owned Azure AI Speech resource incurs separate Azure consumption costs

## When to use / skip
The default Microsoft-managed AI services configuration is appropriate for most deployments, it requires no additional Azure setup and the costs are covered in the D365 licence.

Client-owned Azure AI Speech resources with custom models are relevant when: the default transcription accuracy is unacceptable for the client's customer accent profile or domain terminology, or when the client needs to train the speech model on their specific product/service vocabulary. Custom model training is a meaningful investment (time and Azure cost) justified only when baseline accuracy causes real operational problems.

## Configuration decisions
- For default AI services: no configuration required beyond enabling transcription, sentiment, and other AI features in the admin centre: Microsoft manages the service connection
- For custom Azure AI Speech: provision an Azure AI Speech resource in the client's Azure subscription, create and train a custom acoustic or language model using the client's audio training data, and configure the custom model endpoint in D365 Contact Center voice settings
- Custom speech model training requires audio samples with transcripts: typically 30+ hours of client-representative audio for meaningful accuracy improvement; the quality of training data is the main variable in model quality
- Data residency: confirm that the Azure AI Speech resource for custom models is provisioned in the same Azure region as the ACS resource; cross-region AI processing has data residency implications for EU-regulated clients

## Gotchas
- Custom speech model training is a project in itself: collecting training audio, cleaning and transcribing it, uploading to Azure AI Speech Studio, training the model, and testing accuracy takes weeks, not days. If custom speech model training is in scope, plan the timeline accordingly.
- Baseline transcription accuracy for UK English, US English, and major European languages is generally good with the default Microsoft-managed model. Custom models improve accuracy for non-standard accents or specialist terminology but the marginal improvement decreases as the baseline gets better. Test the default model against real call audio before committing to custom model training.
- Azure AI Speech usage costs for a client-owned resource include: audio processing per hour, custom model hosting per hour (even when not actively transcribing), and model training costs. These are separate from D365 licensing and can be significant for high-volume voice contact centres.
- AI processing location is not always the same as the Dataverse environment region. Microsoft routes AI service calls to the nearest available AI service endpoint. For clients with strict data residency requirements, verify that AI processing occurs within the required geographic boundary: this may require explicit configuration of the Azure AI Speech resource region.
- Copilot generative AI uses Azure OpenAI managed by Microsoft. The client cannot substitute a self-hosted OpenAI model or a different LLM provider for Copilot features. If the client's governance requires using their own Azure OpenAI deployment, D365 Copilot cannot currently accommodate this.

## Consultant notes

- Custom speech model training is often proposed in discovery as a solution to "transcription isn't accurate enough": but it's worth testing the default model against actual call audio first. Many deployments find the default accuracy is sufficient, particularly for standard accents and general business vocabulary. Committing to custom model training before testing the baseline is unnecessary cost and delay.
- The Azure AI processing data residency point is one that regularly surprises EU-regulated clients. They've confirmed that Dataverse is in West Europe, ACS is in West Europe, and assume everything is EU-contained. But if AI service routing goes to East US for capacity reasons, transcription data temporarily leaves the EU. Clients with strict EU data residency requirements need to explicitly configure their Azure AI Speech resource to an EU region and verify the routing.
- The "bring your own Azure OpenAI" question comes up regularly from security-conscious clients. The current answer is: not supported for D365 Copilot. Microsoft manages the Azure OpenAI endpoint, and clients cannot substitute their own deployment. If this is a hard requirement, it's a product limitation conversation, not a configuration conversation.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds client-owned Azure OpenAI support for Copilot or changes the AI service data processing routing*
