# Multimodal Support in Customer Intent Agent

**Category:** Self-Service / AI Bots
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/multimodal-customer-intent-agent

> **Status:** Planned — GA: June 2026. No public preview at time of writing. Treat details as subject to change.

## What it does
Multimodal support extends the Customer Intent Agent (the AI-powered autonomous agent in D365 Contact Center) to handle not just text but images and documents sent by customers as part of the conversation. A customer who sends a photo of a damaged product, a screenshot of an error, or an uploaded document can have that content understood and acted on by the AI agent without needing to type a description. The AI agent interprets the visual content and incorporates it into its response and intent resolution.

## Key facts
- GA: June 2026; no public preview announced
- Applies to the Customer Assist Agent — the AI autonomous agent built on Copilot Studio and Copilot control plane
- Supported input types: images (PNG, JPG), PDF documents, and potentially other document types (full list not confirmed pre-GA)
- The AI agent uses multimodal models (vision-capable LLMs) to interpret image and document content in the context of the conversation
- Applies to digital messaging channels where attachments are supported — not applicable to voice (which is audio-only)
- Customer-uploaded images or documents are processed by the AI model; the content is not stored separately from the standard attachment storage (Azure Blob)
- Agents reviewing AI-handled conversations will see the image/document in the conversation transcript alongside the AI's interpretation and response
- This is an extension of the existing Customer Intent Agent — no separate configuration product; enabling multimodal is a capability setting within the agent configuration

## When to use / skip
Relevant for any deployment where customers frequently share visual content as part of their service interaction — insurance claims (photos of damage), technical support (screenshots of errors), retail (photos of products), utilities (meter reading photos). If the contact centre's use cases are text-only, multimodal adds no value.

Don't scope it for go-live before June 2026 — it doesn't exist yet. Plan for it in phase 2 for relevant use cases.

## Configuration decisions
- Confirm the feature is GA and stable before committing it to a project timeline — June 2026 target dates can shift
- Define which customer intent scenarios benefit from image/document input and design the agent conversation flows to prompt customers to upload relevant content at the right point in the flow
- Ensure attachment handling is configured on the relevant channels (see `feature-attachment-handling.md`) — multimodal requires attachment support to be enabled
- Review Azure AI usage costs — multimodal model inference is more expensive than text-only; estimate cost impact based on expected volume of image-containing conversations
- Define what happens when image content cannot be interpreted (low quality, unsupported content) — the agent should have a fallback path rather than stalling

## Gotchas
- Multimodal AI inference costs more per conversation than text-only. If image-rich conversations are high volume, the Azure AI cost increase should be modelled before enabling broadly.
- Privacy implications of customer-uploaded images being processed by an AI model should be reviewed with the client's legal team, especially for sensitive images (medical photos, ID documents). This is an AI data processing question with GDPR implications.
- Image interpretation quality depends on image quality and the specific content type. Low-resolution photos, heavily compressed images, or unusual document formats may not interpret correctly. The agent needs a graceful fallback for poor-quality uploads.
- This feature is planned for June 2026. Feature specifics, capability limits, and supported file types should be confirmed against the GA release notes before building solutions that depend on it.

## Consultant notes

- The multimodal capability is the right answer for a specific set of use cases, and clients in the right verticals (insurance, utilities, technical support) will immediately see the value. The conversation to have is around cost and privacy, not capability — "yes this is technically possible" is the easy part; "here's what it costs at your volume and here's what your legal team needs to review" is the useful part.
- Pre-GA feature planning: include multimodal as a flagged item in solution design for post-June 2026 deployments in relevant verticals. Don't build flows that depend on it until it's GA and tested. Add it to the project backlog with a "verify at GA" gate.
- The privacy review for AI processing of customer-uploaded images is non-trivial in regulated industries. An insurance customer uploading photos of a car accident, a healthcare customer uploading a prescription — these are sensitive content categories. Make sure the client's DPA (Data Processing Agreement) with Microsoft covers AI model processing of uploaded content, not just storage.

---

*Feature planned for GA: June 2026. Revisit against GA release notes before scoping into any project.*
