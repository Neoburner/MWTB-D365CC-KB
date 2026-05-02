# Attachment Handling Across Channels

**Category:** Digital Messaging
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-file-attachment

## What it does
Attachment handling controls whether agents and customers can send files (images, documents, media) within digital messaging conversations. Each channel has different attachment capabilities governed by both D365 configuration and the underlying channel's API limits. D365 provides configuration to enable or disable attachments, set file size limits, and restrict permitted file types, but the channel's own constraints (WhatsApp, LINE, Facebook) take precedence where they are more restrictive.

## Key facts
- Attachment settings are configured per-workstream in Copilot Service Admin Center under the channel's file attachment settings
- Separate controls exist for agent-to-customer attachments and customer-to-agent attachments: each can be enabled/disabled independently
- Default maximum file size in D365: 5 MB for most channels; can be raised up to 28 MB for web chat (live chat widget)
- Permitted file types are configurable: you can restrict to specific extensions (e.g., PDF, JPG, PNG only) or allow all types
- Files sent through D365 are stored in Azure Blob Storage linked to the Dataverse environment, not in the chat transcript record itself
- Channel-specific limits override D365 settings when they are more restrictive:
  - WhatsApp: 16 MB for documents, 5 MB for images; no .exe, .bat, or .zip
  - Facebook Messenger: 25 MB; format restrictions apply
  - LINE: varies by media type; audio and video have lower limits
  - Web chat: configurable up to 28 MB (set at the widget level)
  - SMS: attachments not natively supported in standard SMS; MMS varies by carrier
- Customers uploading files in the chat widget see a file picker in the browser; agents use the attachment button in the communication panel
- Uploaded files are accessible in the conversation record in Dataverse for GDPR/DSAR purposes

## When to use / skip
Enable for any channel where customers legitimately need to share documents (proof of identity, invoices, photos of defects, screenshots). Disable for channels where security policy or compliance requirements prohibit it, or where the channel type (SMS) doesn't support it.

Default to enabling for chat and messaging channels, customers expect to be able to share images and documents in modern messaging. Deciding to disable it requires a policy reason, not a technical one.

## Configuration decisions
- Enable or disable agent-to-customer and customer-to-agent attachments separately per workstream: in some use cases (e.g., outbound notifications) you may want agent-to-customer only
- Set maximum file size to the lowest common limit across your target channel mix to avoid channel-specific errors; or set per-workstream if channels are clearly separated
- Restrict permitted file types if the use case is specific (e.g., only accept PDFs for document uploads); otherwise a broad allowlist is fine for general service channels
- Set up an Azure Blob Storage lifecycle policy for attachment storage: file attachments in conversations are subject to the same GDPR deletion requirements as conversation records
- For voice + digital mixed deployments, ensure agents know that voice conversations do not support attachments: this is a digital-channel-only feature

## Gotchas
- Channel API limits override D365 configuration: if you configure a 28 MB limit in D365 but the customer is on WhatsApp (16 MB limit), the upload will fail with a channel-level error that isn't clearly explained in the conversation. Agents will see the send failure; the error message may not identify the cause.
- Files are stored in Azure Blob Storage, not in Dataverse. This matters for GDPR deletion: deleting the conversation record does not delete the attachment. The Blob Storage lifecycle policy is a separate deletion path.
- Antivirus/malware scanning of uploaded files is not provided natively by D365: files pass through to Blob Storage without scanning. If the security policy requires AV scanning, this needs a custom Azure function or a DLP-layer service in front of Blob Storage.
- The permitted file types list is the client's first line of defence against malicious uploads. Allowing .exe, .bat, .js, or .sh is a risk: restrict these explicitly even if the default list doesn't.
- MMS (image SMS) is technically supported by some carriers but the D365 SMS channel does not handle MMS natively. Customers who try to send photos via SMS will either get an error or the attachment will be stripped by the carrier silently.

## Consultant notes

- Antivirus scanning of customer-uploaded files is the gap that catches security-conscious clients by surprise. The question always comes up in security reviews: "can customers upload malicious files?" The answer is yes, and D365 does not scan them. If the client's security team has a malware scanning requirement, design the Blob Storage ingest path to go through an Azure security service before files are accessible to agents. This is a custom integration step, not a D365 configuration.
- The per-channel file size difference is worth putting in the agent training materials or the operational runbook for each channel. Agents who handle multiple channels will hit inconsistent behaviour if they don't know that WhatsApp has a 5 MB image limit when web chat allows 28 MB. A simple channel-by-channel limits table in the agent guide prevents a lot of confusion.
- GDPR attachment deletion is the part clients underestimate. They understand that they need to delete conversation records for erasure requests. They often don't realise that conversation attachments are stored separately in Blob Storage and need a separate deletion step. Include attachment storage in the data map you walk through with the client's compliance team.

---

*Source last updated: 2026-04-30 | Revisit when channel API limits change (WhatsApp, LINE, Facebook update frequently) or if Microsoft adds native AV scanning*
