# Google Business Messages

**Category:** Digital Messaging
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-google-business-messages

> **Status note:** Google deprecated the Business Messages API effective July 2024 and replaced it with Google's Business Chat via Google Maps/Search. Review current Google and Microsoft documentation before scoping this channel: the integration path may have changed materially since the original Microsoft Learn page was written.

## What it does
Google Business Messages was a channel that allowed customers to initiate a conversation with a business directly from Google Search results and Google Maps listings, a "Chat" button appeared on the business's Google profile. Conversations routed into D365 Contact Center as an async digital messaging channel. Google deprecated the Business Messages product in mid-2024.

## Key facts
- Google Business Messages was sunset by Google in July 2024; existing integrations stopped working at that point
- The Microsoft Learn configuration page may still exist but the underlying Google API is no longer available for new integrations
- Google's replacement strategy (if any) for business chat via Search/Maps is subject to Google's own roadmap: check Google's current business communication documentation separately
- If a client is asking about "chatting with customers from Google Search," this is currently the channel that would have covered that use case, but it no longer exists in its previous form
- Any existing D365 deployments that had Google Business Messages configured before July 2024 will have lost that channel connectivity

## When to use / skip
Do not configure Google Business Messages as a new channel, the Google API is no longer available. If a client asks for this capability, confirm the current status with Microsoft and Google before making any commitments.

If a client had an existing integration before July 2024, the channel is no longer functional and should be removed from their workstream configuration to avoid confusion.

## Configuration decisions
- Remove any existing Google Business Messages workstream and channel configuration from deployments that had it configured before deprecation
- If the client requires a "chat from Google" presence, monitor Google's and Microsoft's announcements for any successor product

## Gotchas
- The Microsoft Learn page and Copilot Service Admin Center may still show Google Business Messages as a configurable channel even though the underlying Google API is defunct. Admins attempting to configure it will be able to create the channel object in D365 but will not be able to complete the connection to Google's side.
- Clients who see "Google Business Messages" in the D365 channel list may assume it's still active and try to configure it. Make this clear in any admin handover.

## Consultant notes

- This is a deprecated channel. The only reason it's in this KB is for reference when clients ask about it or when auditing existing environments that might still have dead configuration from a pre-2024 deployment. If you encounter it in an environment, remove the configuration: it serves no purpose and creates confusion in the admin interface.
- If a client specifically asks about chat functionality from Google Search or Maps, the honest answer as of May 2026 is that there is no supported path through D365 Contact Center to replace what Google Business Messages provided. Monitor Google's Business Communications documentation and Microsoft's channel announcements for any successor integration.

---

*This feature was deprecated by Google in July 2024. Verify current status before citing this document in any project context.*
