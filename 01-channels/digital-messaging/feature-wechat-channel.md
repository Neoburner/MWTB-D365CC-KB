# WeChat Channel

**Category:** Digital Messaging
**Applies To:** Both
**Source:** No dedicated Microsoft Learn page available at time of writing

> **Status note:** WeChat channel support exists in D365 Contact Center but Microsoft has not published a dedicated configuration guide on Microsoft Learn. The information below is based on general D365 channel patterns and known WeChat Business API requirements. Verify with Microsoft support or documentation when this becomes available.

## What it does
WeChat is a messaging channel option in D365 Contact Center that allows customers in China (or WeChat users globally) to contact the organisation via the WeChat platform. Like other social messaging channels (WhatsApp, LINE, Facebook Messenger), it integrates as an async digital messaging channel, conversations route through unified routing, appear in the agent's omnichannel inbox, and transcripts are stored in Dataverse.

## Key facts
- WeChat Business Account (Official Account or Service Account) is required: WeChat does not allow third-party integration via personal or standard business accounts
- Integration uses WeChat's messaging API, which is available only for verified Official Accounts registered in mainland China via Tencent's business registration process
- Channel appears in Copilot Service Admin Center under Messaging channels alongside other social channels
- No dedicated Microsoft Learn configuration doc exists at the time of this writing: Microsoft acknowledges WeChat as a supported channel but documentation is sparse
- WeChat channel messages are async: customers initiate a conversation, which routes through the workstream configuration like any other digital channel
- WeChat has strict content policies (enforced by Tencent) that restrict certain topics, links, and external redirects: agents cannot always send arbitrary URLs or attachments
- File and media attachment support is limited to WeChat's permitted media types; these differ from web chat or WhatsApp attachment capabilities
- The WeChat API requires ongoing compliance with Tencent's terms of service, which change independently of Microsoft's release cycle

## When to use / skip
Only relevant for deployments targeting customers in mainland China or global users who primarily use WeChat for business communication. The account registration and verification process with Tencent takes 4–8 weeks and requires a Chinese business entity or an authorised representative, this is a significant pre-requisite. If China is not a target market, skip entirely.

If China market access is a genuine requirement, start the Tencent account verification process during discovery, it is the longest-lead-time item in any WeChat channel deployment.

## Configuration decisions
- Obtain and verify a WeChat Official Account (Service Account tier, not Subscription Account) before beginning any D365 configuration
- Register the WeChat account as a channel in the D365 messaging channels section and configure the webhook connection to the WeChat API
- Set up a workstream for WeChat with appropriate routing rules: WeChat messages often come outside business hours due to time zone differences, so consider operating hours configuration carefully
- Define content policies for agents: WeChat's Tencent-enforced restrictions on external URLs and certain content types must be in the agent training materials
- Test attachment handling explicitly: WeChat's supported media types do not match web chat and agents used to web chat will hit errors if they try to send unsupported file types

## Gotchas
- No dedicated Microsoft documentation means implementation relies on general messaging channel patterns plus WeChat API documentation. Expect more troubleshooting than with well-documented channels.
- Tencent's approval process for WeChat Official Accounts is slow and opaque. Rejections without explanation are common. Budget significant time for this and don't make the WeChat channel part of the go-live critical path.
- WeChat API rate limits and message format restrictions can cause delivery failures that are not surfaced clearly in D365 conversation logs. If messages aren't delivering, check WeChat API error codes directly rather than relying solely on D365 diagnostics.
- WeChat conversations initiated outside agent operating hours will sit in queue: but WeChat's own 48-hour session window (similar to Facebook Messenger) means if an agent doesn't respond within 48 hours of the last customer message, certain message types become restricted.

## Consultant notes

- If a client lists WeChat as a channel requirement, validate it immediately in discovery. "WeChat support" as a line item on a requirements list can mean anything from "we want to know if it's possible" to "we have 50,000 WeChat contacts." The business account registration and verification process with Tencent is the actual blocker, not the D365 configuration. Clarify what the client actually needs before committing to a timeline.
- The lack of a dedicated Microsoft Learn page is a real gap. Treat WeChat configuration as a higher-risk activity than other channels: test in a sandbox first, expect undocumented behaviour, and build in additional testing time. If the deployment timeline is tight, flag WeChat as a phase 2 channel rather than a go-live requirement.
- Content restrictions on WeChat (Tencent-enforced, not Microsoft-controlled) need to be in the agent training pack. Agents who are used to sending external links in web chat will hit silent delivery failures or content blocks when trying to do the same in WeChat. This is not a D365 configuration issue: it's a Tencent policy issue.

---

*No stable source date: check Microsoft Learn for a dedicated WeChat configuration doc when available; check Tencent Business documentation for current API requirements*
