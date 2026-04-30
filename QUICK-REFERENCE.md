# D365 Contact Center — Quick Reference

Single-pane view of every documented feature. Use this to orient quickly without opening individual docs.

**New & Updated** (top section) — features added or significantly updated in the last 3 months. Entries move to the main reference after 3 months.

---

## 🆕 New & Updated — Feb to Apr 2026

| Date | Feature | What changed / why it's here |
|------|---------|------------------------------|
| 2026-04-30 | [ACS PSTN Integration](01-channels/voice/feature-voice-acs-pstn.md) | New doc — ACS resource setup, number acquisition |
| 2026-04-30 | [Direct Routing (Bring Your Own Carrier)](01-channels/voice/feature-voice-direct-routing.md) | New doc — SBC requirements, SIP carrier via ACS |
| 2026-04-30 | [Microsoft Calling Plans](01-channels/voice/feature-voice-calling-plans.md) | New doc — Teams Phone numbers in Contact Center |
| 2026-04-30 | [Predictive / Progressive Dialling](01-channels/voice/feature-voice-proactive-dialling.md) | New doc — automated outbound dialling modes |
| 2026-04-30 | [Real-Time Translation (Voice)](01-channels/voice/feature-voice-realtime-translation.md) | New doc — live audio translation, Azure AI Speech |
| 2026-04-30 | [Callback (In-Queue & Scheduled)](01-channels/voice/feature-voice-callback.md) | New doc — callback workstream, capacity counting |
| 2026-04-30 | [E911 Emergency Calling](01-channels/voice/feature-voice-e911.md) | New doc — regulatory requirement, location policy |
| 2026-04-30 | [Music on Hold](01-channels/voice/feature-voice-music-on-hold.md) | New doc — custom audio upload, supported formats |
| 2026-04-30 | [Phone Number Management & Porting](01-channels/voice/feature-voice-phone-number-management.md) | New doc — porting timeline, release impact |
| 2026-04-30 | [Desktop Companion App (Embedded Voice)](01-channels/voice/feature-desktop-companion-app.md) | New doc — Windows app for embedded deployments |
| 2026-04-30 | [Email Channel](01-channels/digital-messaging/feature-email-channel.md) | New doc — Exchange/EWS, threading, email routing |
| 2026-04-30 | [Proactive Chat](01-channels/digital-messaging/feature-proactive-chat.md) | New doc — trigger rules, JS snippet, opt-out |
| 2026-04-30 | [Persistent Chat](01-channels/digital-messaging/feature-persistent-chat.md) | New doc — auth requirement, multi-session threading |
| 2026-04-30 | [Co-browse / Screen Share](01-channels/digital-messaging/feature-cobrowse-screen-share.md) | New doc — Surfly provider, consent prompt |
| 2026-04-30 | [Instagram Direct Messages](01-channels/digital-messaging/feature-instagram-channel.md) | New doc — Meta Business Account, 24-hr window |
| 2026-04-30 | [Microsoft Teams Channel](01-channels/digital-messaging/feature-teams-channel.md) | New doc — internal employee support via Teams chat |
| 2026-04-30 | [Custom Messaging Channel (Direct Line)](01-channels/digital-messaging/feature-custom-messaging-channel.md) | New doc — Azure Bot Framework Direct Line |
| 2026-04-30 | [Customer Assist Agent](01-channels/self-service/feature-customer-assist-agent.md) | New doc — autonomous AI agent, Copilot credits |
| 2026-04-30 | [Bot-to-Agent Escalation](01-channels/self-service/feature-bot-escalation.md) | New doc — context transfer, variable mapping |
| 2026-04-30 | [Intelligent Skill Finder](02-routing/feature-intelligent-skill-finder.md) | New doc — ML routing, training data requirement |
| 2026-04-30 | [Wrap-Up / After Contact Work](03-agent-experience/feature-wrap-up-acw.md) | New doc — ACW timer modes, capacity interaction |
| 2026-04-30 | [Real-Time Translation (Chat)](03-agent-experience/feature-real-time-translation.md) | New doc — Azure AI Translator, chat channels only |
| 2026-04-30 | [Conversation Diagnostics](03-agent-experience/feature-conversation-diagnostics.md) | New doc — per-conversation routing trace |
| 2026-04-30 | [Intraday Insights Dashboard](04-supervisor-experience/feature-intraday-insights.md) | New doc — same-day KPIs, differs from Real-Time Analytics |
| 2026-04-30 | [Sentiment-Triggered Alerts](04-supervisor-experience/feature-sentiment-alerts.md) | New doc — threshold config, supervisor alerts |
| 2026-04-30 | [Real-Time Sentiment Analysis](05-copilot-and-ai/feature-realtime-sentiment.md) | New doc — 1-10 scale, live conversation display |
| 2026-04-30 | [Schedule Adherence & Tracking](07-workforce-engagement/feature-wfm-schedule-adherence.md) | New doc — real-time adherence scoring |
| 2026-04-30 | [Intraday Management (WFM)](07-workforce-engagement/feature-wfm-intraday.md) | New doc — same-day staffing adjustments |
| 2026-04-30 | [Quality Management (WFM)](07-workforce-engagement/feature-wfm-quality-management.md) | New doc — manual QA scorecard, sampling |
| 2026-04-30 | [Voice Analytics Dashboard](08-analytics-and-reporting/feature-voice-analytics.md) | New doc — separate enable toggle, call metrics |
| 2026-04-30 | [Bot / Self-Service Analytics](08-analytics-and-reporting/feature-bot-analytics.md) | New doc — containment rate, escalation rate |
| 2026-04-30 | [Customer Sentiment Analytics](08-analytics-and-reporting/feature-sentiment-analytics.md) | New doc — historical sentiment trends |
| 2026-04-30 | [Topics Analytics](08-analytics-and-reporting/feature-topics-analytics.md) | New doc — AI conversation clustering |
| 2026-04-30 | [Holiday Schedule](09-administration/feature-holiday-schedule.md) | New doc — annual re-entry, Operating Hours linkage |
| 2026-04-30 | [Data Retention & Purge Policies](09-administration/feature-data-retention.md) | New doc — no native policy, bulk delete jobs |
| 2026-04-30 | [Channel Integration Framework v2](10-integration-and-extensibility/feature-cif-v2.md) | New doc — multi-session widget embedding |
| 2026-04-30 | [Azure Event Grid Integration](10-integration-and-extensibility/feature-azure-event-grid.md) | New doc — conversation lifecycle events |
| 2026-04-30 | [Omnichannel JavaScript SDK](10-integration-and-extensibility/feature-omnichannel-javascript-sdk.md) | New doc — agent-side context API |
| 2026-04-30 | [RBAC / Security Roles](11-security-and-compliance/feature-rbac-security-roles.md) | New doc — three-tier role structure |
| 2026-04-30 | [Agent SSO](11-security-and-compliance/feature-agent-sso.md) | New doc — Entra ID, MFA, embedded SSO |
| 2026-04-30 | [PCI-DSS Compliance](11-security-and-compliance/feature-pci-dss-compliance.md) | New doc — masking, DTMF suppression, shared responsibility |
| 2026-04-30 | [Data Residency](11-security-and-compliance/feature-data-residency.md) | New doc — Dataverse region, ACS cross-region flows |
| 2026-04-30 | [GDPR & Data Subject Requests](11-security-and-compliance/feature-gdpr.md) | New doc — DSR tools, right to erasure |
| 2026-03-05 | [Screen Recording](11-security-and-compliance/feature-screen-recording.md) | Desktop companion app install, full-screen scope |
| 2026-02-26 | [WhatsApp Channel](01-channels/digital-messaging/feature-whatsapp-channel.md) | June 2026 BSUID deprecation — action required |
| 2026-02-26 | [Recording & Transcription](01-channels/voice/feature-voice-recording-transcription.md) | Event Grid now required for recording upload |
| 2026-02-03 | [Outbound Messaging](10-integration-and-extensibility/feature-outbound-messaging.md) | Flow-only trigger confirmed for SMS + WhatsApp |
| 2026-02-01 | [Copilot Plugins](05-copilot-and-ai/feature-copilot-plugins.md) | ⚠️ Preview — 15-min publish delay confirmed |
| 2026-02-01 | [Verbatim Responses](05-copilot-and-ai/feature-copilot-verbatim-responses.md) | ⚠️ Preview — Ask a Question scope only |
| 2026-02-01 | [Knowledge Sources](05-copilot-and-ai/feature-copilot-knowledge-sources.md) | ⚠️ Preview — Graph connectors clarified |

---

## Full Reference — All 127 Features

### 01 · Voice Channel

- [Voice Channel Overview](01-channels/voice/feature-voice-channel-overview.md) — Architecture, ACS dependency, network assessment requirements
- [ACS PSTN Integration](01-channels/voice/feature-voice-acs-pstn.md) — ACS resource provisioning, number acquisition, connecting ACS to D365
- [Direct Routing (Bring Your Own Carrier)](01-channels/voice/feature-voice-direct-routing.md) — SBC setup, SIP carrier connected via ACS Direct Routing
- [Microsoft Calling Plans](01-channels/voice/feature-voice-calling-plans.md) — Teams Phone number licence, geographic availability, acquisition via M365 admin
- [Inbound Calling](01-channels/voice/feature-voice-inbound-calling.md) — Bridged vs non-bridged transfer modes, operating hours interaction
- [Outbound Calling](01-channels/voice/feature-voice-outbound-calling.md) — Personal numbers, 20-min outbound queue delay, geographic restrictions
- [Predictive / Progressive Dialling](01-channels/voice/feature-voice-proactive-dialling.md) — Automated outbound dialling, Power Automate trigger, SIP outcome codes
- [Recording & Transcription](01-channels/voice/feature-voice-recording-transcription.md) — Event Grid prerequisite for upload, MIME type allowlisting
- [Real-Time Translation (Voice)](01-channels/voice/feature-voice-realtime-translation.md) — Azure AI Speech, translated audio stream, latency and quality trade-offs
- [Voicemail](01-channels/voice/feature-voice-voicemail.md) — Operating hours conflict, IVR limitation, storage
- [Callback (In-Queue & Scheduled)](01-channels/voice/feature-voice-callback.md) — Callback workstream config, how callbacks count against capacity
- [E911 Emergency Calling](01-channels/voice/feature-voice-e911.md) — Regulatory requirement, location policy config via ACS/Teams
- [Music on Hold](01-channels/voice/feature-voice-music-on-hold.md) — Custom audio upload (WAV/MP3), per-queue or global config
- [Phone Number Management & Porting](01-channels/voice/feature-voice-phone-number-management.md) — ACS vs Direct Routing numbers, porting timeline, release implications
- [Desktop Companion App (Embedded Voice)](01-channels/voice/feature-desktop-companion-app.md) — Windows app required for embedded voice, MDM deployment required

### 01 · Digital Messaging

- [Chat Channel](01-channels/digital-messaging/feature-chat-channel.md) — Widget setup, domain restrictions, screen sharing toggle
- [Proactive Chat](01-channels/digital-messaging/feature-proactive-chat.md) — Trigger rules (time on page, URL, events), JS snippet, opt-out handling
- [Persistent Chat](01-channels/digital-messaging/feature-persistent-chat.md) — Auth required, conversation lifespan config, multi-session thread continuity
- [Co-browse / Screen Share](01-channels/digital-messaging/feature-cobrowse-screen-share.md) — Third-party provider (Surfly), agent-initiated, customer consent prompt
- [Email Channel](01-channels/digital-messaging/feature-email-channel.md) — Exchange/EWS mailbox connection, email threading, routing to queues
- [SMS Channel](01-channels/digital-messaging/feature-sms-channel.md) — ACS and Twilio providers, no rep-initiated outbound SMS, toll-free verification
- [WhatsApp Channel](01-channels/digital-messaging/feature-whatsapp-channel.md) — ⚠️ June 2026 BSUID change, 24-hour messaging window, Event Grid auth
- [Facebook Channel](01-channels/digital-messaging/feature-facebook-channel.md) — 60-day token refresh requirement, message tag, dev mode limitations
- [Instagram Direct Messages](01-channels/digital-messaging/feature-instagram-channel.md) — Meta Business Account, 24-hour window, requires Facebook channel
- [Apple Messages for Business](01-channels/digital-messaging/feature-apple-messages-channel.md) — Apple registration approval (weeks), two external dependencies
- [LINE Channel](01-channels/digital-messaging/feature-line-channel.md) — Japan/SEA markets, long-lived access token
- [Microsoft Teams Channel](01-channels/digital-messaging/feature-teams-channel.md) — Internal employee support via Teams, bot manifest deployment
- [Custom Messaging Channel (Direct Line)](01-channels/digital-messaging/feature-custom-messaging-channel.md) — Azure Bot Framework Direct Line, requires Copilot Studio bot
- [Pre-Conversation Survey](01-channels/digital-messaging/feature-pre-conversation-survey.md) — Chat only, 10-question limit, exact context variable key names

### 01 · Self-Service

- [IVR / Voice Agents](01-channels/self-service/feature-ivr-voice-agents.md) — Copilot Studio IVR for voice, 1-hour call limit, NLU+ licensing
- [Customer Assist Agent](01-channels/self-service/feature-customer-assist-agent.md) — Autonomous AI agent end-to-end, Copilot credits, voice + digital channels
- [Bot-to-Agent Escalation](01-channels/self-service/feature-bot-escalation.md) — Context and variable transfer at handoff, agent notification on takeover

### 02 · Routing

- [Unified Routing Overview](02-routing/feature-unified-routing-overview.md) — Classification → assignment pipeline, channel-agnostic architecture
- [Workstreams](02-routing/feature-workstreams.md) — Push vs pick (permanent choice), capacity modes, async plug-ins
- [Queues](02-routing/feature-queues.md) — Type is permanent, fallback queue, design-before-config order matters
- [Assignment Methods](02-routing/feature-assignment-methods.md) — Highest capacity / round robin / advanced / dynamic prioritisation
- [Work Classification](02-routing/feature-work-classification.md) — 10 rulesets / 100 rules / 5 outputs per item, chaining rulesets
- [Route-to-Queue Rules](02-routing/feature-route-to-queue-rules.md) — Hit-all vs hit-first, percentage-based split routing
- [Skill-Based Routing](02-routing/feature-skill-based-routing.md) — Rating model mismatch risk, Exact vs Closest match modes
- [Intelligent Skill Finder](02-routing/feature-intelligent-skill-finder.md) — ML-based skill assignment, training data minimum, co-exists with rules
- [Capacity Profiles](02-routing/feature-capacity-profiles.md) — Reset frequency is permanent, record routing capacity release
- [Overflow Management](02-routing/feature-overflow-management.md) — Pre-queue vs post-queue triggers, operating hours condition
- [Preferred Agent Routing](02-routing/feature-preferred-agent-routing.md) — Skills bypassed, push mode only, fallback on unavailability
- [Record Routing](02-routing/feature-record-routing.md) — 5-min polling cycle, capacity release on resolve, security role requirement
- [Routing Diagnostics](02-routing/feature-routing-diagnostics.md) — ⚠️ Deprecated feature — enable in every UAT environment from day one

### 03 · Agent Experience

- [Agent Scripts](03-agent-experience/feature-agent-scripts.md) — Linked to session templates, expression-based script selection
- [Macros](03-agent-experience/feature-macros.md) — "Start macro execution" step required, no conditional branching
- [Knowledge Management](03-agent-experience/feature-knowledge-management.md) — Full-text vs relevance search, portal domain matching for external KB
- [Quick Replies](03-agent-experience/feature-quick-replies.md) — Locale mismatch means agents see wrong language, context key slugs
- [Smart Assist](03-agent-experience/feature-smart-assist.md) — ⚠️ Native AI suggestions deprecated June 2025 — migrate to Copilot Help Pane
- [Transfer & Consult](03-agent-experience/feature-transfer-consult.md) — Wrap-up config affects consultability, FetchXML for directory filtering
- [Wrap-Up / After Contact Work](03-agent-experience/feature-wrap-up-acw.md) — Timer modes (auto/forced/none), ACW blocks capacity, disposition codes
- [Real-Time Translation](03-agent-experience/feature-real-time-translation.md) — Azure AI Translator, chat channels only (not voice), agent language detection
- [Conversation Diagnostics](03-agent-experience/feature-conversation-diagnostics.md) — Routing trace per conversation, error flags visible to agent and supervisor

### 04 · Supervisor Experience

- [Real-Time Analytics](04-supervisor-experience/feature-realtime-analytics.md) — Enabled by default, voice analytics requires a separate checkbox
- [Supervisor Controls](04-supervisor-experience/feature-supervisor-controls.md) — All 4 controls (listen/whisper/barge/assign) are off by default
- [Supervisor Conversation Controls](04-supervisor-experience/feature-supervisor-conversation-controls.md) — Role toggle AND dashboard access both required (common miss)
- [Intraday Insights Dashboard](04-supervisor-experience/feature-intraday-insights.md) — Same-day operational view, 5–15 min refresh, distinct from Real-Time Analytics
- [Sentiment-Triggered Alerts](04-supervisor-experience/feature-sentiment-alerts.md) — Configurable threshold (1-10), alerts appear in supervisor dashboard

### 05 · Copilot and AI

- [Copilot Overview & Configuration](05-copilot-and-ai/feature-copilot-overview-and-configuration.md) — Feature availability matrix: Standalone vs Embedded, GA vs Preview
- [Configure Copilot](05-copilot-and-ai/feature-configure-copilot.md) — GA regions only, opt-out is permanent, custom role privileges required
- [Copilot Help Pane](05-copilot-and-ai/feature-copilot-help-pane.md) — Ask a Question, custom instructions per queue, KB article refresh timing
- [Copilot Summaries](05-copilot-and-ai/feature-copilot-summaries.md) — 50-token conversation minimum, bot transcripts excluded from summary
- [Conversation Summary Format](05-copilot-and-ai/feature-copilot-summary-format.md) — One global format setting, 5 built-in categories, affects all agents
- [Email Drafting](05-copilot-and-ai/feature-copilot-email-drafting.md) — Standalone draft panel vs inline (RTE v2 required for inline)
- [Knowledge Sources](05-copilot-and-ai/feature-copilot-knowledge-sources.md) — ⚠️ Preview — uses Graph connectors, NOT Copilot connectors
- [Copilot Plugins](05-copilot-and-ai/feature-copilot-plugins.md) — ⚠️ Preview — 15-min publish delay after saving
- [Verbatim Responses](05-copilot-and-ai/feature-copilot-verbatim-responses.md) — ⚠️ Preview — Ask a Question only, configured by KB manager not admin
- [Real-Time Sentiment Analysis](05-copilot-and-ai/feature-realtime-sentiment.md) — 1-10 scale updated per message, visible to agent and supervisor, Azure AI dependency

### 06 · AI Agents

- [Agent Hub](06-ai-agents/feature-agent-hub.md) — Navigation surface in admin center, not a configuration layer itself
- [Copilot Studio Agent Integration](06-ai-agents/feature-copilot-agent-integration.md) — One agent per workstream, push mode only, 30-min inactivity timeout
- [Azure AI Agent](06-ai-agents/feature-azure-ai-agent.md) — Chat and social channels only, Managed Identity required
- [Customer Intent Agent](06-ai-agents/feature-customer-intent-agent.md) — Copilot credits consumed, intent library, lines of business grouping
- [Quality Evaluation Agent](06-ai-agents/feature-quality-evaluation-agent.md) — 3 prerequisites (connection references, flows, Copilot Studio agent), scoring is permanent once on
- [Agent Insights Dashboard](06-ai-agents/feature-agent-insights-dashboard.md) — Standalone deployment only, depends on Quality Evaluation Agent scores
- [Service Agent in M365 Copilot](06-ai-agents/feature-service-agent-m365.md) — Requires M365 Copilot licence, English only, dual icon in Teams (known issue)

### 07 · Workforce Engagement

- [WFM Setup & Installation](07-workforce-engagement/feature-wfm-setup.md) — Separate managed package, every rep needs a Bookable Resource record
- [Conversation Forecasting](07-workforce-engagement/feature-conversation-forecasting.md) — AI-backed, concurrency config critical for accuracy, 24-hr data delay
- [WFM Forecasting & Capacity Planning](07-workforce-engagement/feature-wfm-forecasting-capacity.md) — WFM-native forecast, scenario modelling, enable alongside Conversation Forecasting
- [Schedule Management](07-workforce-engagement/feature-wfm-schedule-management.md) — Shift bidding, swapping, time-off requests, activity type Duration required
- [Shift-Based Routing](07-workforce-engagement/feature-wfm-shift-based-routing.md) — Only enable after schedules are published, not before
- [Schedule Adherence & Tracking](07-workforce-engagement/feature-wfm-schedule-adherence.md) — Real-time D365 presence vs. schedule comparison, adherence score
- [Intraday Management](07-workforce-engagement/feature-wfm-intraday.md) — Same-day staffing adjustment view, differs from supervisor Intraday Insights
- [Quality Management (WFM)](07-workforce-engagement/feature-wfm-quality-management.md) — Manual QA scorecard, sampling logic, separate from Quality Evaluation Agent AI

### 08 · Analytics and Reporting

- [Omnichannel Historical Analytics](08-analytics-and-reporting/feature-omnichannel-historical-analytics.md) — Standalone deployment only, base toggle required before add-on dashboards
- [CS Historical Analytics](08-analytics-and-reporting/feature-cs-historical-analytics.md) — Case-level analytics, AI topic clustering, custom app needs App Designer step
- [Knowledge Analytics](08-analytics-and-reporting/feature-knowledge-analytics.md) — Article insights default-on; search term insights requires separate checkbox
- [Copilot Analytics](08-analytics-and-reporting/feature-copilot-analytics.md) — Tracks adoption/usage not quality; requires Help Pane and Summaries opted-in
- [Voice Analytics Dashboard](08-analytics-and-reporting/feature-voice-analytics.md) — Separate enable toggle from main analytics, 24-hr delay, call volume/AHT/abandon
- [Bot / Self-Service Analytics](08-analytics-and-reporting/feature-bot-analytics.md) — Containment and escalation rates, requires Copilot Studio bot connected
- [Customer Sentiment Analytics](08-analytics-and-reporting/feature-sentiment-analytics.md) — Historical 1-10 sentiment trends, requires sentiment analysis enabled first
- [Topics Analytics](08-analytics-and-reporting/feature-topics-analytics.md) — AI clusters conversations into themes automatically, links to Customer Intent Agent

### 09 · Administration

- [System Requirements](09-administration/feature-system-requirements.md) — Supported browsers, network bandwidth, full URL allowlist, third-party cookies
- [Copilot Service Admin Center](09-administration/feature-copilot-service-admin-center.md) — Unified admin surface replacing OC Admin, adaptive site map by licence
- [Provisioning Unified Routing](09-administration/feature-provisioning-unified-routing.md) — Auto-provisioned in Contact Center; manual steps in CS-only; root BU required
- [User Management](09-administration/feature-user-management.md) — Bookable Resource record required per agent, bulk management via tools
- [Capacity Profiles](09-administration/feature-capacity-profiles.md) — Reset frequency is permanent at creation, blocks assignment when full
- [Experience Profiles](09-administration/feature-experience-profiles.md) — Controls which tools agents see, gates Copilot feature visibility
- [Session Templates](09-administration/feature-session-templates.md) — Anchor tab is required, additional tabs load on session open, comm panel modes
- [Application Tab Templates](09-administration/feature-application-tab-templates.md) — Page types, slugs, OData filter parameters for entity-type tabs
- [Notification Templates](09-administration/feature-notification-templates.md) — 4-field display limit, desktop notification opt-in, reject button config
- [Operating Hours](09-administration/feature-operating-hours.md) — Cannot be migrated via config migration tool, auto-creates overflow condition
- [Holiday Schedule](09-administration/feature-holiday-schedule.md) — Must be re-entered every year, linked to Operating Hours record
- [Presence & Custom Presence](09-administration/feature-presence-and-custom-presence.md) — Custom statuses map to base status, Busy-DND auto-triggered by calls
- [Record Identification](09-administration/feature-record-identification.md) — Context key names are exact-match only, active record status required
- [Role Persona Mapping](09-administration/feature-role-persona-mapping.md) — Custom roles require three-step grant process (role + persona + experience profile)
- [Data Retention & Purge Policies](09-administration/feature-data-retention.md) — No native automated policy, bulk delete jobs required, storage grows indefinitely without

### 10 · Integration and Extensibility

- [Configuration Data Migration](10-integration-and-extensibility/feature-config-data-migration.md) — Migrate routing config between environments; operating hours excluded
- [Embedded Widget (Salesforce / ServiceNow)](10-integration-and-extensibility/feature-embedded-third-party-crm.md) — CTI Adapter/OpenFrame embedding, context variable passing to D365
- [Salesforce Data Connector](10-integration-and-extensibility/feature-salesforce-connector.md) — One-way Salesforce → D365 sync, 10 GB limit, column mapping required
- [Outbound Messaging](10-integration-and-extensibility/feature-outbound-messaging.md) — SMS and WhatsApp outbound via Power Automate flow only, opt-in compliance
- [Customer Feedback Surveys](10-integration-and-extensibility/feature-surveys.md) — Copilot Studio backed, MCS_CSAT variable required for CSAT score capture
- [Teams Phone Integration](10-integration-and-extensibility/feature-teams-phone-integration.md) — Reuse existing Teams PSTN numbers in Contact Center voice channel
- [Teams Voice Consult (VOIP)](10-integration-and-extensibility/feature-teams-voice-consult.md) — Consult or transfer to Teams users who don't have a D365 licence
- [Channel Integration Framework v2](10-integration-and-extensibility/feature-cif-v2.md) — Multi-session third-party widget embedding, session lifecycle APIs
- [Azure Event Grid Integration](10-integration-and-extensibility/feature-azure-event-grid.md) — Subscribe to conversation lifecycle events for downstream integrations
- [Omnichannel JavaScript SDK](10-integration-and-extensibility/feature-omnichannel-javascript-sdk.md) — Agent-side context API for custom tabs, customer-side widget SDK is separate

### 11 · Security and Compliance

- [Audit Logging](11-security-and-compliance/feature-audit-logging.md) — Power Platform audit + Microsoft Purview, routing table audit separate
- [Blocked Numbers](11-security-and-compliance/feature-blocked-numbers.md) — Manual block list + auto-block threshold for spam detection
- [Chat Authentication](11-security-and-compliance/feature-chat-authentication.md) — OAuth 2.0 JWT tokens, portal-based sign-in, authenticated context passing
- [Data Masking](11-security-and-compliance/feature-data-masking.md) — Chat regex rules (10 max) + voice sensitive variable masking (two separate systems)
- [Screen Recording](11-security-and-compliance/feature-screen-recording.md) — Desktop companion app required, full-screen capture, no default retention
- [RBAC / Security Roles](11-security-and-compliance/feature-rbac-security-roles.md) — Three-tier model: Dataverse security role → persona → experience profile
- [Agent SSO](11-security-and-compliance/feature-agent-sso.md) — Entra ID default SSO, MFA enforced via Conditional Access, embedded deployment nuances
- [PCI-DSS Compliance](11-security-and-compliance/feature-pci-dss-compliance.md) — Native masking + DTMF suppression; payment capture itself needs external PCI-compliant system
- [Data Residency](11-security-and-compliance/feature-data-residency.md) — Dataverse region tied to Power Platform environment; ACS voice may cross regions
- [GDPR & Data Subject Requests](11-security-and-compliance/feature-gdpr.md) — Power Platform DSR tools for Dataverse; ACS/recording data requires manual steps

---

*127 features documented | New & Updated section covers last 3 months | Entries graduate to main reference after 3 months*

*Last updated: 2026-04-30*
