# D365 Contact Center — Quick Reference

Single-pane view of every documented feature. Use this to orient quickly without opening individual docs.

**New & Updated** (top section) — features whose Microsoft source docs changed in the last 3 months. Entries move to the main reference after 3 months.

---

## 🆕 New & Updated — Feb to Apr 2026

| Date | Feature | What changed / why it matters |
|------|---------|-------------------------------|
| 2026-04-30 | [Quality Evaluation Agent](06-ai-agents/feature-quality-evaluation-agent.md) | Email evaluation added (preview); scoring threshold now permanent once enabled |
| 2026-04-27 | [WFM Setup & Installation](07-workforce-engagement/feature-wfm-setup.md) | Documentation updated; Bookable Resource requirement clarified |
| 2026-04-27 | [WFM Schedule Management](07-workforce-engagement/feature-wfm-schedule-management.md) | Documentation updated; activity type Duration requirement clarified |
| 2026-04-27 | [Assignment Methods](02-routing/feature-assignment-methods.md) | Dynamic Prioritisation remains preview; decline limit OData config clarified |
| 2026-04-27 | [Overflow Management](02-routing/feature-overflow-management.md) | AI-powered immediate overflow remains preview |
| 2026-04-17 | [WhatsApp Channel](01-channels/digital-messaging/feature-whatsapp-channel.md) | **BSUID breaking change — June 2026 deadline.** All WhatsApp workstreams must be migrated before June 2026 or messaging stops |
| 2026-04-16 | [WFM Forecasting & Capacity Planning](07-workforce-engagement/feature-wfm-forecasting-capacity.md) | Documentation updated |
| 2026-04-15 | [User Management](09-administration/feature-user-management.md) | Enhanced User Management bulk update capabilities updated |
| 2026-04-15 | [Unified Routing Overview](02-routing/feature-unified-routing-overview.md) | Routing architecture docs updated for 2026 W1 release wave |
| 2026-04-15 | [Smart Assist](03-agent-experience/feature-smart-assist.md) | Native AI suggestions confirmed deprecated June 2025 — Azure Bot only |
| 2026-04-14 | [Customer Intent Agent](06-ai-agents/feature-customer-intent-agent.md) | Lines of business, simulation, and Copilot Studio component collection steps clarified |
| 2026-04-07 | [Service Agent in M365 Copilot](06-ai-agents/feature-service-agent-m365.md) | Production-ready preview status; dual Copilot icon behaviour documented |
| 2026-04-03 | [Experience Profiles](09-administration/feature-experience-profiles.md) | Profile assignment logic and default behaviour updated |
| 2026-03-26 | [Conversation Summary Format](05-copilot-and-ai/feature-copilot-summary-format.md) | Error Codes pattern hint behaviour clarified |
| 2026-03-25 | [Preferred Agent Routing](02-routing/feature-preferred-agent-routing.md) | Overflow interaction clarified |
| 2026-03-18 | [Config Data Migration](10-integration-and-extensibility/feature-config-data-migration.md) | Per-channel migration sequence docs updated |
| 2026-03-18 | [Operating Hours](09-administration/feature-operating-hours.md) | Auto-created overflow condition behaviour clarified |
| 2026-03-12 | [IVR / Voice Agents](01-channels/self-service/feature-ivr-voice-agents.md) | SIP context passing and NLU+ data residency updated |
| 2026-03-10 | [Chat Channel](01-channels/digital-messaging/feature-chat-channel.md) | Persistent chat and screen sharing limitations updated |
| 2026-03-10 | [Voice Inbound Calling](01-channels/voice/feature-voice-inbound-calling.md) | Enhanced voice anonymous inbound via Direct Routing clarified |
| 2026-03-05 | [Screen Recording](11-security-and-compliance/feature-screen-recording.md) | Desktop companion app retention configuration added |
| 2026-02-20 | [Teams Phone Integration](10-integration-and-extensibility/feature-teams-phone-integration.md) | New feature — use existing Teams PSTN numbers in Contact Center |
| 2026-02-20 | [Voice Outbound Calling](01-channels/voice/feature-voice-outbound-calling.md) | Outbound dialer preview status updated |
| 2026-02-19 | [Workstreams](02-routing/feature-workstreams.md) | Push/Pick permanent at creation re-confirmed |
| 2026-02-19 | [Realtime Analytics](04-supervisor-experience/feature-realtime-analytics.md) | Contact Center-specific report changes noted |
| 2026-02-18 | [Salesforce Data Connector](10-integration-and-extensibility/feature-salesforce-connector.md) | New feature — one-way Salesforce → Dataverse sync |
| 2026-02-16 | [Workstreams](02-routing/feature-workstreams.md) | Work distribution mode permanence confirmed |
| 2026-02-15 | [Voice Recording & Transcription](01-channels/voice/feature-voice-recording-transcription.md) | Real-time translation language support scope updated |
| 2026-02-12 | [Embedded Widget (Salesforce/ServiceNow)](10-integration-and-extensibility/feature-embedded-third-party-crm.md) | ServiceNow OpenFrame setup steps updated |

---

## 01 · Channels

### Voice

- **[Voice Channel Overview](01-channels/voice/feature-voice-channel-overview.md)** — Architecture, ACS dependency, Copilot Service workspace requirement, network assessment. Push mode only.
- **[Inbound Calling](01-channels/voice/feature-voice-inbound-calling.md)** — Bridged vs non-bridged transfer, operating hours vs voicemail conflict, enhanced vs basic voice.
- **[Outbound Calling](01-channels/voice/feature-voice-outbound-calling.md)** — Rep-initiated outbound, personal numbers (geographic only), 20-min delay after adding a queue.
- **[Recording & Transcription](01-channels/voice/feature-voice-recording-transcription.md)** — Event Grid is the most-missed prerequisite. MIME allowlisting for playback. Real-time translation separate.
- **[Voicemail](01-channels/voice/feature-voice-voicemail.md)** — Operating hours required, phone number format for rules, IVR cannot offer voicemail directly.

### Digital Messaging

- **[Chat Channel](01-channels/digital-messaging/feature-chat-channel.md)** — Widget setup, screen sharing not native, domain restrictions default off, pre-survey drives routing.
- **[SMS Channel](01-channels/digital-messaging/feature-sms-channel.md)** — ACS or Twilio only, no rep-initiated outbound, toll-free verification 3–6 weeks.
- **[WhatsApp Channel](01-channels/digital-messaging/feature-whatsapp-channel.md)** — ⚠️ BSUID migration required before June 2026. 24-hour messaging window. Event Grid Entra auth.
- **[Facebook Channel](01-channels/digital-messaging/feature-facebook-channel.md)** — 60-day page token refresh, message tag requires both sides opted in, dev mode blocks UAT.
- **[Apple Messages for Business](01-channels/digital-messaging/feature-apple-messages-channel.md)** — Apple approval lead time (weeks), two external dependencies (Apple + ACS), not self-service.
- **[LINE Channel](01-channels/digital-messaging/feature-line-channel.md)** — Japan/SEA markets, long-lived token maintenance, contact linking is a rep workflow task.
- **[Pre-Conversation Survey](01-channels/digital-messaging/feature-pre-conversation-survey.md)** — Chat only, max 10 questions, exact context key names required for record identification.

### Self-Service

- **[IVR / Voice Agents](01-channels/self-service/feature-ivr-voice-agents.md)** — Copilot Studio IVR, 1-hour call limit, build escalation path before going live, NLU+ for data residency.

---

## 02 · Routing

- **[Unified Routing Overview](02-routing/feature-unified-routing-overview.md)** — Classification runs before assignment. Copilot Service workspace mandatory. Design queues before workstreams.
- **[Workstreams](02-routing/feature-workstreams.md)** — Push/Pick mode permanent at creation. Async plug-ins must be enabled. One workstream per channel instance.
- **[Queues](02-routing/feature-queues.md)** — Queue type permanent. Fallback queue required. Design queues before workstreams or you're rebuilding.
- **[Work Classification](02-routing/feature-work-classification.md)** — 10 rulesets / 100 rules / 5 output slots per workstream. Rules chain. First match wins per ruleset.
- **[Route-to-Queue Rules](02-routing/feature-route-to-queue-rules.md)** — Hit-all vs hit-first matters. One ruleset per workstream. Percentage routing max 5 queues.
- **[Assignment Methods](02-routing/feature-assignment-methods.md)** — 4 methods: Highest Capacity, Round Robin, Least Active, Custom. Decline limit 3 (OData configurable). Dynamic Prioritisation is preview.
- **[Skill-Based Routing](02-routing/feature-skill-based-routing.md)** — Rating model mismatch = silent failure. Exact vs Closest Match is a business decision, not a technical one.
- **[Capacity Profiles](02-routing/feature-capacity-profiles.md)** — Reset frequency permanent at creation. Record routing capacity does not auto-release.
- **[Overflow Management](02-routing/feature-overflow-management.md)** — Pre-queue vs post-queue distinction. Operating hours auto-creates an uneditable overflow condition.
- **[Preferred Agent Routing](02-routing/feature-preferred-agent-routing.md)** — Skills bypassed for preferred reps. Push mode only. Manual matrix maintenance.
- **[Record Routing](02-routing/feature-record-routing.md)** — 5-minute assignment cycle. Capacity not auto-released. Rep needs security permissions on routed entity.
- **[Routing Diagnostics](02-routing/feature-routing-diagnostics.md)** — ⚠️ Deprecated. Enable in UAT from day one regardless — storage accumulates.

---

## 03 · Agent Experience

- **[Agent Scripts](03-agent-experience/feature-agent-scripts.md)** — Tied to session templates. Expression-based default selection. Copilot Service workspace only.
- **[Macros](03-agent-experience/feature-macros.md)** — "Start macro execution" step is mandatory first. No branching logic within a macro.
- **[Knowledge Management](03-agent-experience/feature-knowledge-management.md)** — Search mode Any vs All affects result quality. Portal requires matching domain configuration first.
- **[Quick Replies](03-agent-experience/feature-quick-replies.md)** — Locale mismatch silently hides replies. Custom context key slugs render blank if unpopulated.
- **[Smart Assist](03-agent-experience/feature-smart-assist.md)** — ⚠️ Native AI card suggestions deprecated June 2025. Azure Bot Service only going forward (not Copilot Studio).
- **[Transfer & Consult](03-agent-experience/feature-transfer-consult.md)** — Wrap-up after transfer requires workstream config. FetchXML filters for consult search are off by default.

---

## 04 · Supervisor Experience

- **[Real-Time Analytics](04-supervisor-experience/feature-realtime-analytics.md)** — On by default. Voice analytics is a separate checkbox. Custom app needs App Designer steps to expose reports.
- **[Supervisor Controls](04-supervisor-experience/feature-supervisor-controls.md)** — All 4 monitoring toggles off by default. Direct role assignment required — team membership doesn't work.
- **[Supervisor Conversation Controls](04-supervisor-experience/feature-supervisor-conversation-controls.md)** — Both the supervisor toggles AND dashboard access are required. Missing either breaks the experience.

---

## 05 · Copilot and AI

- **[Copilot Overview & Configuration](05-copilot-and-ai/feature-copilot-overview-and-configuration.md)** — Feature matrix by deployment type. Don't opt out as a troubleshooting step — it's permanent.
- **[Configure Copilot](05-copilot-and-ai/feature-configure-copilot.md)** — GA in North America first. Opt-out permanent. Custom roles need explicit Copilot privileges.
- **[Copilot Help Pane](05-copilot-and-ai/feature-copilot-help-pane.md)** — Ask a Question, custom instructions. Custom instructions don't apply to Copilot Studio sources. KB refresh is daily.
- **[Copilot Summaries](05-copilot-and-ai/feature-copilot-summaries.md)** — 50-token minimum before summary generates. Bot transcripts excluded. Custom forms need extra config.
- **[Conversation Summary Format](05-copilot-and-ai/feature-copilot-summary-format.md)** — One global setting, no per-team config. 5 built-in categories only. Error Codes is a pattern hint, not a filter.
- **[Email Drafting](05-copilot-and-ai/feature-copilot-email-drafting.md)** — Two modes (inline and help pane). RTE v2 required for inline. Case Notes and Email Content always included.
- **[Knowledge Sources](05-copilot-and-ai/feature-copilot-knowledge-sources.md)** — ⚠️ Preview. Ask a Question only. Use Graph connectors — Copilot connectors not supported.
- **[Copilot Plugins](05-copilot-and-ai/feature-copilot-plugins.md)** — ⚠️ Preview. 15-minute publish delay. Connector must exist before configuring the plugin.
- **[Verbatim Responses](05-copilot-and-ai/feature-copilot-verbatim-responses.md)** — ⚠️ Preview. Ask a Question only. Knowledge managers configure this, not Copilot admins.

---

## 06 · AI Agents

- **[Agent Hub](06-ai-agents/feature-agent-hub.md)** — Navigation surface only. Not where AI agent configuration happens — follow the links out to the relevant feature areas.
- **[Copilot Studio Agent Integration](06-ai-agents/feature-copilot-agent-integration.md)** — One agent per workstream. Push mode only. 30-min inactivity auto-close. `CloseOmnichannelConversation` required for voice.
- **[Azure AI Agent](06-ai-agents/feature-azure-ai-agent.md)** — Chat and social channels only (not voice). User-Assigned Managed Identity required — client secret not supported.
- **[Customer Intent Agent](06-ai-agents/feature-customer-intent-agent.md)** — Pay-as-you-go Copilot credits. Discover intents from history. Feeds both deflection and routing. Copilot Studio component collection required.
- **[Quality Evaluation Agent](06-ai-agents/feature-quality-evaluation-agent.md)** — 3 prerequisites must all show Ready. Scoring threshold permanent once enabled. Compliance disclosure required.
- **[Agent Insights Dashboard](06-ai-agents/feature-agent-insights-dashboard.md)** — Standalone only. Tracks autonomous resolution rate and quality score. Quality score blank until Quality Evaluation Agent configured.
- **[Service Agent in M365 Copilot](06-ai-agents/feature-service-agent-m365.md)** — M365 Copilot licence required per user. English only. Two Copilot icons appear if both D365 Copilot and Service Agent enabled simultaneously.

---

## 07 · Workforce Engagement

- **[WFM Setup & Installation](07-workforce-engagement/feature-wfm-setup.md)** — Separate package install via Power Platform admin center. Bookable Resource required per rep — most commonly missed prerequisite.
- **[Conversation Forecasting](07-workforce-engagement/feature-conversation-forecasting.md)** — AI-backed staffing demand report. Concurrency config is the most impactful accuracy lever. 24-hour delay on first enable.
- **[WFM Forecasting & Capacity Planning](07-workforce-engagement/feature-wfm-forecasting-capacity.md)** — WFM-native forecasting with scenario modelling. Enable both Forecasting and Capacity Planning together.
- **[Schedule Management](07-workforce-engagement/feature-wfm-schedule-management.md)** — Shift bidding, swapping, time-off requests, activity types, rep calendar. Each sub-feature enabled independently.
- **[Shift-Based Routing](07-workforce-engagement/feature-wfm-shift-based-routing.md)** — Routes based on published shift bookings. Enable only after schedules are published — enabling early blocks all assignments.

---

## 08 · Analytics and Reporting

- **[Omnichannel Historical Analytics](08-analytics-and-reporting/feature-omnichannel-historical-analytics.md)** — Standalone only. Base toggle required before add-ons appear. 24-hour delay after first enable. Bot add-on essential for any Copilot agent deployment.
- **[CS Historical Analytics](08-analytics-and-reporting/feature-cs-historical-analytics.md)** — Case-level analytics. AI-discovered topic clustering on by default. Custom apps need App Designer navigation entry.
- **[Knowledge Analytics](08-analytics-and-reporting/feature-knowledge-analytics.md)** — Article insights (main toggle) + Search term insights (separate checkbox). Enable both. Internal rep search only.
- **[Copilot Analytics](08-analytics-and-reporting/feature-copilot-analytics.md)** — Tracks Copilot usage adoption, not output quality. Requires Copilot help pane and summaries opted in first. 24-hour provisioning delay.

---

## 09 · Administration

- **[System Requirements](09-administration/feature-system-requirements.md)** — Edge/Chrome only. Third-party cookies must not be blocked. URL allowlist needed — 2–3 weeks lead time for enterprise firewall changes.
- **[Copilot Service Admin Center](09-administration/feature-copilot-service-admin-center.md)** — Unified admin surface. Adaptive site map — settings only appear after relevant features are provisioned. System Administrator only.
- **[Provisioning Unified Routing](09-administration/feature-provisioning-unified-routing.md)** — Auto in Contact Center. Manual in CS-only environments. Root business unit System Admin required — child BU not sufficient.
- **[User Management](09-administration/feature-user-management.md)** — Every rep needs a Bookable Resource — separate from having a user account. Enhanced User Management for bulk operations.
- **[Capacity Profiles](09-administration/feature-capacity-profiles.md)** — Reset frequency permanent at creation. Assignment blocking forces Busy-DND. Record routing capacity doesn't auto-release.
- **[Experience Profiles](09-administration/feature-experience-profiles.md)** — Controls which workspace tools reps see. Copilot must be toggled on per profile. Team membership not supported for profile assignment.
- **[Session Templates](09-administration/feature-session-templates.md)** — Defines workspace layout on session open. Additional tabs cannot be closed by reps. Design with agent scripts together.
- **[Application Tab Templates](09-administration/feature-application-tab-templates.md)** — Defines what opens in tabs. Supports slugs and OData queries for dynamic record loading. Third-party websites reload on tab switch.
- **[Notification Templates](09-administration/feature-notification-templates.md)** — Max 4 data fields per template. Desktop notifications need browser permission + Windows notifications on. No Reject button recommended for record routing.
- **[Operating Hours](09-administration/feature-operating-hours.md)** — Cannot be migrated between environments. Auto-creates uneditable "Out of operation hours" overflow condition when attached to queue.
- **[Presence & Custom Presence](09-administration/feature-presence-and-custom-presence.md)** — Base status controls routing. Custom presence text is cosmetic. Busy-DND auto-triggered by capacity profile assignment blocking.
- **[Record Identification](09-administration/feature-record-identification.md)** — Exact context key names required (Name, Email, Phone, CaseNumber). Active status records only. Single match required for auto-link.
- **[Role Persona Mapping](09-administration/feature-role-persona-mapping.md)** — Three personas: Admin, Supervisor, Agent. Custom roles need three separate steps: create, map persona, grant app access. Direct assignment only — no team inheritance.

---

## 10 · Integration and Extensibility

- **[Config Data Migration](10-integration-and-extensibility/feature-config-data-migration.md)** — Per-channel migration guides. Operating hours excluded — must be recreated manually. Skill finder, presence, queue membership also excluded.
- **[Embedded Widget (Salesforce/ServiceNow)](10-integration-and-extensibility/feature-embedded-third-party-crm.md)** — Contact Center conversation widget embedded in Salesforce (CTI) or ServiceNow (OpenFrame). Records stay in third-party CRM.
- **[Salesforce Data Connector](10-integration-and-extensibility/feature-salesforce-connector.md)** — One-way sync Salesforce → Dataverse. 10 GB recommended limit. Back up Dataverse data before activating.
- **[Outbound Messaging](10-integration-and-extensibility/feature-outbound-messaging.md)** — SMS and WhatsApp (Twilio) via Power Automate flows only. Reps cannot send outbound from workspace. WhatsApp Template Name deprecated April 2025.
- **[Customer Feedback Surveys](10-integration-and-extensibility/feature-surveys.md)** — Copilot Studio backed. Must be published before appearing in channel config. MCS_CSAT variable name required for analytics. Case resolution survey flow is off by default.
- **[Teams Phone Integration](10-integration-and-extensibility/feature-teams-phone-integration.md)** — Use existing Teams PSTN service numbers in Contact Center. Requires Teams resource account and Entra ID permission. Cross-team setup effort.
- **[Teams Voice Consult (VOIP)](10-integration-and-extensibility/feature-teams-voice-consult.md)** — Consult/transfer to Teams users without phone numbers. Enterprise Voice required per user. ACS–Teams federation PowerShell required. No voicemail if Teams user doesn't answer.

---

## 11 · Security and Compliance

- **[Audit Logging](11-security-and-compliance/feature-audit-logging.md)** — Configured in Power Platform admin center, not Copilot Service admin center. Table-level audit must be explicitly enabled per table. Logs in Microsoft Purview.
- **[Blocked Numbers](11-security-and-compliance/feature-blocked-numbers.md)** — Voice only. Auto-block threshold configurable. Rep spam flagging needs training — feature is invisible unless reps know it exists.
- **[Chat Authentication](11-security-and-compliance/feature-chat-authentication.md)** — OAuth 2.0 JWT for chat and Apple Messages only. Sub claim auto-links Dataverse contact. Custom portal JWT is a dev task. Token expiry on long sessions.
- **[Data Masking](11-security-and-compliance/feature-data-masking.md)** — Two separate mechanisms: regex rules for chat/async (max 10), sensitive variable masking for voice agents (Copilot Studio). Neither is automatic — must be explicitly configured.
- **[Screen Recording](11-security-and-compliance/feature-screen-recording.md)** — Full screen capture via desktop companion app. No default retention policy — configure bulk delete job at go-live. Legal compliance is client's responsibility.

---

*Last updated: 2026-04-30 · Entries dated Feb–Apr 2026 are in the New & Updated section above · Older entries roll into the main reference*
