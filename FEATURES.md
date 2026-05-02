# D365 Contact Center — Feature Reference

Single-pane view of every documented feature. For the section-by-section index, see the [front page](README.md).

**Tags used below:** `⚠️ Preview` — feature is in preview and may change · `⚠️ Deprecated` — approaching or past end-of-life · `[Standalone only]` — not available in embedded deployments · `[🔑 Licence]` — requires an add-on or separate licence

---

## 🆕 New & Updated — May 2026

| Date | Feature | What changed / why it's here |
|------|---------|------------------------------|
| 2026-05-02 | [Segment-Level Metrics Across Queues](08-analytics-and-reporting/feature-segment-level-metrics.md) | New doc — per-queue wait time, SLA, abandonment tracking; GA May 2026. **Note: changes existing metric calculations — flag with ops team** |
| 2026-05-02 | [Enhanced Chat Widget](01-channels/digital-messaging/feature-enhanced-chat-widget.md) | New doc — faster load, modern look, new workstream script tag; Preview May 2026 / GA Sep 2026 |
| 2026-05-02 | [Enhanced Customer Authentication](11-security-and-compliance/feature-enhanced-authentication.md) | New doc — OAuth 2.0, mid-conversation auth, Copilot Studio alignment; GA Sep 2026 |
| 2026-05-02 | [Copilot Draft a Chat Response](05-copilot-and-ai/feature-copilot-draft-chat-response.md) | ⚠️ Deprecated — removed 14 Jul 2025; no migration path, replaced by Copilot Help Pane |
| 2026-05-02 | [Voice Channel — Overview & Architecture](01-channels/voice/feature-voice-channel-overview.md) | Deprecation noted — local hosting removed for Switzerland (Oct 2024), India & Japan (Sep 2024) |
| 2026-05-01 | [Custom Voice for Voice Agents](01-channels/self-service/feature-custom-voice-voice-agents.md) | New doc — custom neural voice for IVR agents; GA Feb 27, 2026 |
| 2026-05-01 | [Proactive Voice Engagement](01-channels/voice/feature-proactive-voice-engagement.md) | New doc — outbound calling with AMD, predictive/preview dial, SIP outcomes; GA Mar 2026 |
| 2026-05-01 | [Rich Media Messaging](01-channels/digital-messaging/feature-rich-media-messaging.md) | New doc — forms, suggested replies, adaptive cards for chat and WhatsApp; GA Mar 30, 2026 |
| 2026-05-01 | [Speaker-Wise Split Recordings](01-channels/voice/feature-speaker-split-recordings.md) | New doc — colour-coded per-speaker recording tracks in closed conversation view |
| 2026-05-01 | [Customer Feedback Surveys](10-integration-and-extensibility/feature-surveys.md) | Deprecation noted — post-call survey toggle on voice workstream Language tab removed Aug 2025 |

## 🆕 New & Updated — Feb to Apr 2026

| Date | Feature | What changed / why it's here |
|------|---------|------------------------------|
| 2026-04-30 | [Enhanced Dial Pad for DTMF Tones](01-channels/voice/feature-enhanced-dial-pad-dtmf.md) | New doc — faster, reliable DTMF; admin-enable via DTMF Broadcast |
| 2026-04-30 | [Cancel Voice Consult with External Number](03-agent-experience/feature-cancel-voice-consult.md) | New doc — cancel consult/transfer during ringing; automatic, no config |
| 2026-04-30 | [Infobip SMS Channel](01-channels/digital-messaging/feature-sms-infobip.md) | New doc — Infobip as third SMS provider alongside ACS and Twilio |
| 2026-04-30 | [Callback Deduplication](01-channels/voice/feature-callback-deduplication.md) | New doc — prevent duplicate callbacks from same caller in overflow |
| 2026-04-30 | [Queue Availability API](02-routing/feature-queue-availability-api.md) | New doc — real-time rep availability and wait times via API |
| 2026-04-30 | [Consent-Based Recording](01-channels/voice/feature-consent-based-recording.md) | New doc — GDPR-aligned opt-out recording, consent travels through escalation |
| 2026-04-30 | [Proactive SMS Engagement](01-channels/digital-messaging/feature-sms-proactive-engagement.md) | New doc — outbound SMS via CCaaS API, Journeys, MCP, or file upload |
| 2026-04-30 | [Service Operations Agent](09-administration/feature-service-operations-agent.md) | ⚠️ Preview — AI assistant for admin config; GA May 2026 |
| 2026-04-30 | [Secure Consult/Transfer for PSTN and IVR](01-channels/voice/feature-secure-consult-transfer-pstn.md) | ⚠️ Preview — auto-pause recording on external PSTN transfer; GA Jun 2026 |
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

## ⚡ Top Gotchas

The single most important thing to know about each major area. Read this before starting any implementation.

**Routing**
- **Workstream push/pick mode is permanent.** You cannot change it after creation. Decide before you build, not during UAT. → [Workstreams](02-routing/feature-workstreams.md)
- **Queue type is permanent.** Voice, messaging, and entity queues cannot be converted. Set the type correctly the first time. → [Queues](02-routing/feature-queues.md)
- **Capacity profile reset frequency cannot be changed after creation.** Get sign-off on this setting before configuring. → [Capacity Profiles](02-routing/feature-capacity-profiles.md)

**Channels**
- **WhatsApp BSUID change required by June 2026.** Existing integrations will break without migration. This needs to be in every active client's action log now. → [WhatsApp Channel](01-channels/digital-messaging/feature-whatsapp-channel.md)
- **Facebook tokens expire every 60 days.** There is no auto-renewal. Build a calendar reminder or automation into the client's ops runbook. → [Facebook Channel](01-channels/digital-messaging/feature-facebook-channel.md)
- **Persistent chat requires authenticated users.** Anonymous visitors cannot use it. Confirm your auth setup before scoping. → [Persistent Chat](01-channels/digital-messaging/feature-persistent-chat.md)
- **E911 location policy must be configured before go-live.** Regulatory requirement — commonly missed until the final checklist. → [E911 Emergency Calling](01-channels/voice/feature-voice-e911.md)
- **Desktop companion app requires MDM deployment (Intune/SCCM) for embedded voice.** A one-time manual install will create gaps as new agents join. → [Desktop Companion App](01-channels/voice/feature-desktop-companion-app.md)

**Copilot & AI**
- **Copilot opt-out is permanent per environment.** You cannot re-enable it once an environment is opted out. Test everything in a lower environment first. → [Configure Copilot](05-copilot-and-ai/feature-configure-copilot.md)
- **Smart Assist native AI suggestions were deprecated June 2025.** Any existing Smart Assist configuration using native suggestions needs to be migrated to the Copilot Help Pane. → [Smart Assist](03-agent-experience/feature-smart-assist.md)
- **Quality Evaluation Agent scoring cannot be turned off once enabled.** Every conversation will be scored from that point forward. → [Quality Evaluation Agent](06-ai-agents/feature-quality-evaluation-agent.md)

**Administration**
- **Operating Hours cannot be migrated via the configuration migration tool.** They must be recreated manually in every target environment. → [Operating Hours](09-administration/feature-operating-hours.md)
- **Holiday schedules must be re-entered every year.** There is no auto-rollover. Add this to the annual ops calendar. → [Holiday Schedule](09-administration/feature-holiday-schedule.md)
- **There is no native retention policy for recordings, transcripts, or screen recordings.** Storage grows indefinitely. Bulk delete jobs must be configured before go-live, not as a Phase 2 item. → [Data Retention](09-administration/feature-data-retention.md)
- **Every agent requires a Bookable Resource record.** Missing this blocks routing assignment entirely. → [User Management](09-administration/feature-user-management.md)

**Routing diagnostics**
- **Routing Diagnostics is deprecated but still the best debugging tool available.** Enable it in UAT from day one — you will need it. → [Routing Diagnostics](02-routing/feature-routing-diagnostics.md)

**Data & Compliance**
- **Chat masking and voice sensitive variable masking are two completely separate systems.** Configuring one does not cover the other. PCI/sensitive data environments need both. → [Data Masking](11-security-and-compliance/feature-data-masking.md)
- **Sentiment analytics cannot be backfilled.** If you enable it after go-live, historical data is not retroactively scored. Turn it on before the first conversation. → [Customer Sentiment Analytics](08-analytics-and-reporting/feature-sentiment-analytics.md)

---

## Full Reference — All 127 Features

### 01 · Voice Channel

**PSTN Setup** — how the voice channel connects to the phone network

- [Voice Channel Overview](01-channels/voice/feature-voice-channel-overview.md) — Architecture, ACS dependency, network assessment requirements
- [ACS PSTN Integration](01-channels/voice/feature-voice-acs-pstn.md) — ACS resource provisioning, number acquisition, connecting ACS to D365
- [Direct Routing (Bring Your Own Carrier)](01-channels/voice/feature-voice-direct-routing.md) — SBC setup, SIP carrier connected via ACS Direct Routing
- [Microsoft Calling Plans](01-channels/voice/feature-voice-calling-plans.md) — Teams Phone number licence, geographic availability, acquired via M365 admin `[🔑 Licence]`
- [Phone Number Management & Porting](01-channels/voice/feature-voice-phone-number-management.md) — ACS vs Direct Routing numbers, porting timeline, service disruption risk

**Inbound, Outbound & Self-Service**

- [Inbound Calling](01-channels/voice/feature-voice-inbound-calling.md) — Bridged vs non-bridged transfer, operating hours interaction
- [Outbound Calling](01-channels/voice/feature-voice-outbound-calling.md) — Personal numbers, 20-min outbound queue delay, geographic restrictions
- [Callback (In-Queue & Scheduled)](01-channels/voice/feature-voice-callback.md) — Callback workstream config, counts against capacity until returned
- [Predictive / Progressive Dialling](01-channels/voice/feature-voice-proactive-dialling.md) — Automated outbound modes, Power Automate trigger, SIP outcome codes
- [IVR / Voice Agents](01-channels/self-service/feature-ivr-voice-agents.md) — Copilot Studio IVR, 1-hour call limit, NLU+ licensing `[🔑 Licence]`

**In-Call Features**

- [Recording & Transcription](01-channels/voice/feature-voice-recording-transcription.md) — Event Grid prerequisite for upload, MIME type allowlisting
- [Real-Time Translation (Voice)](01-channels/voice/feature-voice-realtime-translation.md) — Azure AI Speech, translated audio stream, latency implications
- [Voicemail](01-channels/voice/feature-voice-voicemail.md) — Operating hours conflict, IVR limitation, storage
- [Music on Hold](01-channels/voice/feature-voice-music-on-hold.md) — Custom audio upload (WAV/MP3), per-queue or global config
- [E911 Emergency Calling](01-channels/voice/feature-voice-e911.md) — Regulatory requirement, location policy config via ACS/Teams

**Infrastructure**

- [Desktop Companion App (Embedded Voice)](01-channels/voice/feature-desktop-companion-app.md) — Windows app required for embedded voice, MDM deployment at scale

---

### 01 · Digital Messaging

**Chat Variants**

- [Chat Channel](01-channels/digital-messaging/feature-chat-channel.md) — Widget setup, domain allowlisting, screen sharing toggle
- [Proactive Chat](01-channels/digital-messaging/feature-proactive-chat.md) — Trigger rules (time-on-page, URL, events), JS snippet, opt-out handling
- [Persistent Chat](01-channels/digital-messaging/feature-persistent-chat.md) — Requires authenticated users, conversation lifespan config, thread continuity
- [Pre-Conversation Survey](01-channels/digital-messaging/feature-pre-conversation-survey.md) — Chat only, 10-question limit, exact context variable key names
- [Co-browse / Screen Share](01-channels/digital-messaging/feature-cobrowse-screen-share.md) — Third-party provider (Surfly), agent-initiated, customer consent prompt

**Email**

- [Email Channel](01-channels/digital-messaging/feature-email-channel.md) — Exchange/EWS mailbox connection, email threading, routing to queues

**Social & Messaging Platforms**

- [SMS Channel](01-channels/digital-messaging/feature-sms-channel.md) — ACS and Twilio providers, no rep-initiated outbound SMS, toll-free verification
- [WhatsApp Channel](01-channels/digital-messaging/feature-whatsapp-channel.md) — ⚠️ June 2026 BSUID change required, 24-hour messaging window, Event Grid auth
- [Facebook Channel](01-channels/digital-messaging/feature-facebook-channel.md) — 60-day token refresh, message tag requirement, dev mode limitations
- [Instagram Direct Messages](01-channels/digital-messaging/feature-instagram-channel.md) — Meta Business Account, 24-hour window, requires Facebook channel first
- [Apple Messages for Business](01-channels/digital-messaging/feature-apple-messages-channel.md) — Apple registration approval (allow weeks), two external dependencies
- [LINE Channel](01-channels/digital-messaging/feature-line-channel.md) — Japan/SEA markets, long-lived access token

**Internal & Custom Channels**

- [Microsoft Teams Channel](01-channels/digital-messaging/feature-teams-channel.md) — Internal employee support via Teams chat, bot manifest deployment
- [Custom Messaging Channel (Direct Line)](01-channels/digital-messaging/feature-custom-messaging-channel.md) — Azure Bot Framework Direct Line, Copilot Studio bot required

---

### 01 · Self-Service / Bots

- [Customer Assist Agent](01-channels/self-service/feature-customer-assist-agent.md) — Autonomous AI agent end-to-end, Copilot credits, voice + digital `[🔑 Licence]`
- [Bot-to-Agent Escalation](01-channels/self-service/feature-bot-escalation.md) — Context and variable transfer at handoff, agent notification on takeover

---

### 02 · Routing

**Core Setup** — must be configured before any work can be routed

- [Unified Routing Overview](02-routing/feature-unified-routing-overview.md) — Classification → assignment pipeline, channel-agnostic architecture
- [Workstreams](02-routing/feature-workstreams.md) — **Push vs pick is permanent** — decide before build; capacity modes; async plug-ins
- [Queues](02-routing/feature-queues.md) — **Queue type is permanent** — voice/messaging/entity; fallback queue; design order matters
- [Capacity Profiles](02-routing/feature-capacity-profiles.md) — **Reset frequency is permanent** at creation; blocks assignment when full

**Classification** — how work gets labelled and directed

- [Work Classification](02-routing/feature-work-classification.md) — 10 rulesets / 100 rules / 5 outputs per work item, chaining rulesets
- [Intelligent Skill Finder](02-routing/feature-intelligent-skill-finder.md) — ML-based skill assignment, minimum training data required, co-exists with rules
- [Route-to-Queue Rules](02-routing/feature-route-to-queue-rules.md) — Hit-all vs hit-first evaluation, percentage-based split routing

**Assignment** — which agent gets the work

- [Assignment Methods](02-routing/feature-assignment-methods.md) — Highest capacity / round robin / advanced / dynamic prioritisation
- [Skill-Based Routing](02-routing/feature-skill-based-routing.md) — Rating model mismatch risk, Exact vs Closest match, proficiency fallback
- [Preferred Agent Routing](02-routing/feature-preferred-agent-routing.md) — Bypasses skill matching, push mode only, fallback on agent unavailability
- [Overflow Management](02-routing/feature-overflow-management.md) — Pre-queue vs post-queue triggers, operating hours condition interaction

**Specialist Routing**

- [Record Routing](02-routing/feature-record-routing.md) — 5-min polling cycle, capacity release on case resolve, security role requirement
- [Routing Diagnostics](02-routing/feature-routing-diagnostics.md) — ⚠️ Deprecated but still useful — enable in every UAT environment

---

### 03 · Agent Experience

**Productivity Tools**

- [Agent Scripts](03-agent-experience/feature-agent-scripts.md) — Linked to session templates, expression-based script selection per conversation
- [Macros](03-agent-experience/feature-macros.md) — "Start macro execution" step required, no conditional branching
- [Quick Replies](03-agent-experience/feature-quick-replies.md) — Locale mismatch causes agents to see wrong language, context key slugs
- [Wrap-Up / After Contact Work](03-agent-experience/feature-wrap-up-acw.md) — Timer modes (auto/forced/none), ACW blocks capacity, disposition code config

**Knowledge & AI Assistance**

- [Knowledge Management](03-agent-experience/feature-knowledge-management.md) — Full-text vs relevance search, portal domain matching for external KB
- [Smart Assist](03-agent-experience/feature-smart-assist.md) — ⚠️ Deprecated June 2025 — migrate to Copilot Help Pane
- [Real-Time Translation](03-agent-experience/feature-real-time-translation.md) — Azure AI Translator, chat channels only (not voice), agent language detection

**Conversation Management**

- [Transfer & Consult](03-agent-experience/feature-transfer-consult.md) — Wrap-up config affects consultability, FetchXML for agent directory filtering
- [Conversation Diagnostics](03-agent-experience/feature-conversation-diagnostics.md) — Routing trace per conversation, error flags, visible to both agent and supervisor

---

### 04 · Supervisor Experience

**Monitoring & Dashboards**

- [Real-Time Analytics](04-supervisor-experience/feature-realtime-analytics.md) — Enabled by default; voice analytics requires a separate checkbox
- [Intraday Insights Dashboard](04-supervisor-experience/feature-intraday-insights.md) — Same-day operational view, 5–15 min refresh; distinct from Real-Time Analytics
- [Sentiment-Triggered Alerts](04-supervisor-experience/feature-sentiment-alerts.md) — Configurable 1-10 threshold, alerts surface in supervisor dashboard

**Intervention Controls**

- [Supervisor Controls](04-supervisor-experience/feature-supervisor-controls.md) — All 4 controls (listen/whisper/barge/assign) are **off by default**
- [Supervisor Conversation Controls](04-supervisor-experience/feature-supervisor-conversation-controls.md) — Role toggle AND dashboard access both required — a common miss

---

### 05 · Copilot and AI

**Setup & Governance**

- [Copilot Overview & Configuration](05-copilot-and-ai/feature-copilot-overview-and-configuration.md) — Feature availability matrix: Standalone vs Embedded, GA vs Preview
- [Configure Copilot](05-copilot-and-ai/feature-configure-copilot.md) — GA regions only; **opt-out is permanent**; custom role privileges required
- [Real-Time Sentiment Analysis](05-copilot-and-ai/feature-realtime-sentiment.md) — 1-10 scale updated per message, visible to agent and supervisor, Azure AI dependency

**Agent-Facing Features**

- [Copilot Help Pane](05-copilot-and-ai/feature-copilot-help-pane.md) — Ask a Question, custom instructions per queue, KB article refresh timing
- [Copilot Summaries](05-copilot-and-ai/feature-copilot-summaries.md) — 50-token conversation minimum, bot transcripts excluded from summary
- [Conversation Summary Format](05-copilot-and-ai/feature-copilot-summary-format.md) — One global format, 5 built-in categories, affects all agents
- [Email Drafting](05-copilot-and-ai/feature-copilot-email-drafting.md) — Standalone draft panel vs inline (RTE v2 required for inline mode)
- [Verbatim Responses](05-copilot-and-ai/feature-copilot-verbatim-responses.md) — ⚠️ Preview — Ask a Question only, configured by KB manager not admin

**Knowledge & Extensibility**

- [Knowledge Sources](05-copilot-and-ai/feature-copilot-knowledge-sources.md) — ⚠️ Preview — uses Graph connectors, NOT Copilot connectors
- [Copilot Plugins](05-copilot-and-ai/feature-copilot-plugins.md) — ⚠️ Preview — 15-min publish delay after saving

---

### 06 · AI Agents

**Self-Service Agents**

- [Copilot Studio Agent Integration](06-ai-agents/feature-copilot-agent-integration.md) — One agent per workstream, push mode only, 30-min inactivity timeout
- [Azure AI Agent](06-ai-agents/feature-azure-ai-agent.md) — Chat and social channels only, Managed Identity required
- [Customer Intent Agent](06-ai-agents/feature-customer-intent-agent.md) — Copilot credits consumed, intent library, lines of business grouping `[🔑 Licence]`

**Quality & Insights**

- [Quality Evaluation Agent](06-ai-agents/feature-quality-evaluation-agent.md) — 3 prerequisites; **scoring cannot be turned off** once enabled
- [Agent Insights Dashboard](06-ai-agents/feature-agent-insights-dashboard.md) — Standalone only, depends on Quality Evaluation Agent for scoring data `[Standalone only]`

**Administration & Extended Surfaces**

- [Agent Hub](06-ai-agents/feature-agent-hub.md) — Navigation surface in admin center, not a configuration layer itself
- [Service Agent in M365 Copilot](06-ai-agents/feature-service-agent-m365.md) — Requires M365 Copilot licence, English only, dual icon in Teams (known issue) `[🔑 Licence]`

---

### 07 · Workforce Engagement

**Setup & Forecasting**

- [WFM Setup & Installation](07-workforce-engagement/feature-wfm-setup.md) — Separate managed package; every agent needs a Bookable Resource record `[🔑 Licence]`
- [Conversation Forecasting](07-workforce-engagement/feature-conversation-forecasting.md) — AI-backed, concurrency config critical for accuracy, 24-hr data delay
- [WFM Forecasting & Capacity Planning](07-workforce-engagement/feature-wfm-forecasting-capacity.md) — WFM-native forecast with scenario modelling, enable alongside Conversation Forecasting

**Scheduling**

- [Schedule Management](07-workforce-engagement/feature-wfm-schedule-management.md) — Shift bidding, swapping, time-off requests; activity type Duration required
- [Shift-Based Routing](07-workforce-engagement/feature-wfm-shift-based-routing.md) — Only enable after schedules are published
- [Schedule Adherence & Tracking](07-workforce-engagement/feature-wfm-schedule-adherence.md) — Real-time D365 presence vs. schedule comparison, adherence score
- [Intraday Management](07-workforce-engagement/feature-wfm-intraday.md) — Same-day staffing adjustment view, distinct from supervisor Intraday Insights

**Quality**

- [Quality Management (WFM)](07-workforce-engagement/feature-wfm-quality-management.md) — Manual QA scorecard, sampling logic, separate from Quality Evaluation Agent AI

---

### 08 · Analytics and Reporting

**Operational Analytics**

- [Omnichannel Historical Analytics](08-analytics-and-reporting/feature-omnichannel-historical-analytics.md) — Standalone only; base toggle required before add-on dashboards `[Standalone only]`
- [Voice Analytics Dashboard](08-analytics-and-reporting/feature-voice-analytics.md) — Separate enable toggle, 24-hr delay, call volume/AHT/abandon rate
- [Bot / Self-Service Analytics](08-analytics-and-reporting/feature-bot-analytics.md) — Containment and escalation rates; requires Copilot Studio bot connected

**Customer & Case Insights**

- [CS Historical Analytics](08-analytics-and-reporting/feature-cs-historical-analytics.md) — Case-level analytics, AI topic clustering, custom app needs App Designer step
- [Customer Sentiment Analytics](08-analytics-and-reporting/feature-sentiment-analytics.md) — Historical 1-10 sentiment trends; sentiment analysis must be enabled first — **cannot backfill**
- [Topics Analytics](08-analytics-and-reporting/feature-topics-analytics.md) — AI clusters conversations into themes automatically, links to Customer Intent Agent

**Feature-Specific Analytics**

- [Knowledge Analytics](08-analytics-and-reporting/feature-knowledge-analytics.md) — Article insights default-on; search term insights requires a separate checkbox
- [Copilot Analytics](08-analytics-and-reporting/feature-copilot-analytics.md) — Tracks adoption/usage not quality; requires Help Pane and Summaries opted-in first

---

### 09 · Administration

**Provisioning & Setup**

- [System Requirements](09-administration/feature-system-requirements.md) — Supported browsers, network bandwidth, full URL allowlist, third-party cookies
- [Copilot Service Admin Center](09-administration/feature-copilot-service-admin-center.md) — Unified admin surface replacing OC Admin, adaptive site map by licence
- [Provisioning Unified Routing](09-administration/feature-provisioning-unified-routing.md) — Auto in Contact Center; manual steps in CS-only; root BU requirement

**User & Access Management**

- [User Management](09-administration/feature-user-management.md) — Bookable Resource record required per agent; bulk management via tools
- [Role Persona Mapping](09-administration/feature-role-persona-mapping.md) — Custom roles require three-step grant (Dataverse role + persona + experience profile)
- [Presence & Custom Presence](09-administration/feature-presence-and-custom-presence.md) — Custom statuses map to a base status; Busy-DND auto-triggered by calls

**Templates**

- [Experience Profiles](09-administration/feature-experience-profiles.md) — Controls which tools agents see; gates Copilot feature visibility
- [Session Templates](09-administration/feature-session-templates.md) — Anchor tab required; additional tabs load on session open; comm panel modes
- [Application Tab Templates](09-administration/feature-application-tab-templates.md) — Page types, slugs, OData filter parameters for entity-type tabs
- [Notification Templates](09-administration/feature-notification-templates.md) — 4-field display limit; desktop notification opt-in; reject button config

**Operations**

- [Operating Hours](09-administration/feature-operating-hours.md) — **Cannot be migrated** via config migration tool — recreate manually per environment
- [Holiday Schedule](09-administration/feature-holiday-schedule.md) — **Must be re-entered every year** — no auto-rollover; linked to Operating Hours
- [Capacity Profiles](09-administration/feature-capacity-profiles.md) — Reset frequency permanent at creation; blocks assignment when full
- [Record Identification](09-administration/feature-record-identification.md) — Context key names are exact-match only; active record status required
- [Data Retention & Purge Policies](09-administration/feature-data-retention.md) — No native automated policy; configure bulk delete jobs before go-live

---

### 10 · Integration and Extensibility

**CRM Connectors**

- [Embedded Widget (Salesforce / ServiceNow)](10-integration-and-extensibility/feature-embedded-third-party-crm.md) — CTI Adapter/OpenFrame embedding, context variable passing to D365
- [Salesforce Data Connector](10-integration-and-extensibility/feature-salesforce-connector.md) — One-way Salesforce → D365 sync, 10 GB limit, column mapping required
- [Configuration Data Migration](10-integration-and-extensibility/feature-config-data-migration.md) — Migrate routing config between environments; operating hours excluded

**Messaging & Engagement**

- [Outbound Messaging](10-integration-and-extensibility/feature-outbound-messaging.md) — SMS and WhatsApp outbound via Power Automate flow only, opt-in compliance
- [Customer Feedback Surveys](10-integration-and-extensibility/feature-surveys.md) — Copilot Studio backed, MCS_CSAT variable required for CSAT score capture

**Microsoft Ecosystem**

- [Teams Phone Integration](10-integration-and-extensibility/feature-teams-phone-integration.md) — Reuse existing Teams PSTN numbers in Contact Center voice channel
- [Teams Voice Consult (VOIP)](10-integration-and-extensibility/feature-teams-voice-consult.md) — Consult or transfer to Teams users who don't have a D365 licence
- [Azure Event Grid Integration](10-integration-and-extensibility/feature-azure-event-grid.md) — Subscribe to conversation lifecycle events for downstream integrations

**Extensibility APIs**

- [Channel Integration Framework v2](10-integration-and-extensibility/feature-cif-v2.md) — Multi-session third-party widget embedding, session lifecycle APIs
- [Omnichannel JavaScript SDK](10-integration-and-extensibility/feature-omnichannel-javascript-sdk.md) — Agent-side context API for custom tabs; customer-side widget SDK is separate

---

### 11 · Security and Compliance

**Identity & Access**

- [RBAC / Security Roles](11-security-and-compliance/feature-rbac-security-roles.md) — Three-tier model: Dataverse security role → persona → experience profile
- [Agent SSO](11-security-and-compliance/feature-agent-sso.md) — Entra ID default SSO, MFA via Conditional Access, embedded deployment nuances
- [Chat Authentication](11-security-and-compliance/feature-chat-authentication.md) — OAuth 2.0 JWT tokens, portal-based sign-in, authenticated context passing to agent

**Data Protection**

- [Data Masking](11-security-and-compliance/feature-data-masking.md) — **Two independent systems** — chat regex rules (10 max) AND voice variable masking
- [PCI-DSS Compliance](11-security-and-compliance/feature-pci-dss-compliance.md) — Native masking + DTMF suppression; actual payment capture needs external PCI system
- [Data Residency](11-security-and-compliance/feature-data-residency.md) — Dataverse region set at environment creation; ACS voice may process in different region
- [GDPR & Data Subject Requests](11-security-and-compliance/feature-gdpr.md) — Power Platform DSR tools cover Dataverse; ACS/recording data needs manual process

**Monitoring & Control**

- [Audit Logging](11-security-and-compliance/feature-audit-logging.md) — Power Platform audit + Microsoft Purview; routing table audit is separate
- [Blocked Numbers](11-security-and-compliance/feature-blocked-numbers.md) — Manual block list + auto-block threshold for spam detection
- [Screen Recording](11-security-and-compliance/feature-screen-recording.md) — Desktop companion app required; full-screen capture; **no default retention** — configure bulk delete before go-live

---

*127 features documented · New & Updated covers last 3 months · Entries graduate to main reference after 3 months*

*Last updated: 2026-04-30*
