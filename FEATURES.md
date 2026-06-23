# D365 Contact Center — Feature Reference

Single-pane view of every documented feature. For the section-by-section index, see the [front page](README.md).

**Tags used below:** `⚠️ Preview` — feature is in preview and may change · `⚠️ Deprecated` — approaching or past end-of-life · `[Standalone only]` — not available in embedded deployments · `[🔑 Licence]` — requires an add-on or separate licence

---

## 🆕 New & Updated

| Date | Feature | Change |
|------|---------|--------|
| 2026-06-23 | [Real-Time Streaming Analytics](08-analytics-and-reporting/feature-realtime-streaming-analytics.md) | New doc — event-driven supervisor analytics in a separate CC-only preview portal; Wallboard/Conversations/Queues/Representatives/Assisted Service views; public preview |
| 2026-06-12 | [Quality and Coaching Skills](06-ai-agents/feature-quality-and-coaching-skills.md) | New doc — real-time AI quality scoring and live coaching nudges; evaluation plans, quality indicators, and guardrails; Copilot credit-billed |
| 2026-06-06 | [Proactive Engagement Consent Management](11-security-and-compliance/feature-proactive-engagement-consent.md) | New doc — opt-out tracking and do-not-call enforcement for proactive outbound voice/SMS |
| 2026-06-03 | [Copilot Verbatim Responses for Knowledge Articles](05-copilot-and-ai/feature-copilot-verbatim-responses.md) | GA June 2026 — preview label removed; tagging behaviour now stable |
| 2026-05-22 | [Headset Call Controls (Answer and Hang Up)](03-agent-experience/feature-headset-call-controls.md) | New doc — Teams-certified headset answer/hang-up support; GA September 2026 |
| 2026-05-22 | [Average Wait-Time Diagnostics](08-analytics-and-reporting/feature-awt-diagnostics.md) | New doc — Application Insights AWT logging and real-time queue-level diagnostics; GA May 2026 |
| 2026-05-15 | [Real-Time Voice Agents (Speech-to-Speech IVR)](01-channels/self-service/feature-realtime-voice-agents-speech-to-speech.md) | New doc — Speech-to-speech IVR via Copilot Studio + OpenAI gpt-4o-realtime; GA April 2026 |
| 2026-05-15 | [LLM-Based Sensitive Data Redaction for Human Interactions](11-security-and-compliance/feature-llm-sensitive-data-redaction.md) | New doc — PCI data redaction in live agent conversations using LLM; GA planned September 2026 |
| 2026-05-15 | [Pinned Contacts and Queues During Consult and Transfer](03-agent-experience/feature-pinned-contacts-queues-transfer.md) | New doc — Admin-managed or agent-managed pins for consult/transfer panel; GA May 2026 |
| 2026-05-15 | [Reliable Post-Call Actions for Caller Hangups (Voice Agents)](01-channels/self-service/feature-voice-agent-hangup-detection.md) | New doc — Instant hangup detection for voice agent flows; post-call actions fire on caller disconnect; GA March 2026 |
| 2026-05-15 | [WFM AI Credit Estimation](07-workforce-engagement/feature-wfm-ai-credit-estimation.md) | New doc — Project AI credit consumption from WFM forecast scenarios; supports QEA, Case Mgmt, and Customer Intent agents |
| 2026-05-12 | [Conversation Orchestration (AI-Powered Playbooks)](02-routing/feature-conversation-orchestration.md) | New doc — AI-driven playbooks for dynamic queue prioritisation and overflow; public preview |

---

## 2026 Wave 1 (April – September 2026)

| GA Date | Feature | Notes |
|---------|---------|-------|
| 2026-04-27 | [Real-Time Voice Agents (Speech-to-Speech IVR)](01-channels/self-service/feature-realtime-voice-agents-speech-to-speech.md) | Speech-to-speech IVR via Copilot Studio + OpenAI gpt-4o-realtime through Foundry |
| 2026-05 | [Pinned Contacts and Queues During Consult and Transfer](03-agent-experience/feature-pinned-contacts-queues-transfer.md) | Admin-pushed or agent-managed pins; BU-scoped |
| 2026-09 | [LLM-Based Sensitive Data Redaction for Human Interactions](11-security-and-compliance/feature-llm-sensitive-data-redaction.md) | PCI data redaction in live agent conversations using LLM (not yet released) |
| 2026-04 | [Enhanced Dial Pad for DTMF Tones](01-channels/voice/feature-enhanced-dial-pad-dtmf.md) | Faster, reliable DTMF; admin-enable via DTMF Broadcast |
| 2026-04-13 | [Cancel Voice Consult with External Number](03-agent-experience/feature-cancel-voice-consult.md) | Cancel consult/transfer during ringing; automatic, no config |
| 2026-04 | [Infobip SMS Channel](01-channels/digital-messaging/feature-sms-infobip.md) | Infobip as third SMS provider alongside ACS and Twilio |
| 2026-04 | [Callback Deduplication](01-channels/voice/feature-callback-deduplication.md) | Prevent duplicate callbacks from same caller in overflow |
| 2026-04 | [Queue Availability API](02-routing/feature-queue-availability-api.md) | Real-time rep availability and wait times via API |
| 2026-04 | [Consent-Based Recording](01-channels/voice/feature-consent-based-recording.md) | GDPR-aligned opt-out recording, consent travels through escalation |
| 2026-04 | [Proactive SMS Engagement](01-channels/digital-messaging/feature-sms-proactive-engagement.md) | Outbound SMS via CCaaS API, Journeys, MCP, or file upload |
| 2026-04 | [Conversation Orchestration (AI-Powered Playbooks)](02-routing/feature-conversation-orchestration.md) | ⚠️ Preview — AI-driven playbooks for dynamic queue prioritisation and overflow; voice and chat only; PAYG billing |
| 2026-05 | [WFM AI Credit Estimation](07-workforce-engagement/feature-wfm-ai-credit-estimation.md) | Project AI credit consumption from WFM forecast scenarios; supports QEA, Case Mgmt Agent, Customer Intent Agent |
| 2026-05 | [WFM Adherence History](07-workforce-engagement/feature-wfm-adherence-history.md) | Historical adherence analytics for supervisors; trend chart, metrics dashboard, activity summary |
| 2026-05 | [Segment-Level Metrics Across Queues](08-analytics-and-reporting/feature-segment-level-metrics.md) | Per-queue wait time, SLA, abandonment tracking. **Note: changes existing metric calculations — flag with ops team** |
| 2026-05 | [Service Operations Agent](09-administration/feature-service-operations-agent.md) | ⚠️ Preview — AI assistant for admin config; entered public preview April 2026 |
| 2026-06 | [Secure Consult/Transfer for PSTN and IVR](01-channels/voice/feature-secure-consult-transfer-pstn.md) | ⚠️ Preview — Auto-pause recording on external PSTN transfer; GA Jun 2026 |
| 2026-09 | [Enhanced Chat Widget](01-channels/digital-messaging/feature-enhanced-chat-widget.md) | ⚠️ Preview — Faster load, modern look, new workstream script tag; Preview May 2026, GA Sep 2026 |
| 2026-09 | [Enhanced Customer Authentication](11-security-and-compliance/feature-enhanced-authentication.md) | OAuth 2.0, mid-conversation auth, Copilot Studio alignment; GA Sep 2026 (planned, no preview) |

## 2025 Wave 2 (October 2025 – March 2026)

| GA Date | Feature | Notes |
|---------|---------|-------|
| 2025-10 | [Customer Knowledge Management Agent](06-ai-agents/feature-customer-knowledge-management-agent.md) | Autonomous AI agent that creates and updates KB articles from closed cases; semi/fully autonomous modes |
| 2025-10 | [Agent Inbox Enhancements](03-agent-experience/feature-inbox-enhancements.md) | Configurable inbox card layout and open behaviour for messaging channels; user group filtering |
| 2025-10 | [Feedback Agent (Customer Feedback Survey Agent)](05-copilot-and-ai/feature-feedback-agent.md) | Copilot Studio-based survey agent; in-channel post-conversation feedback |
| 2025-10 | [Pre-Connection Audio Checks](03-agent-experience/feature-voice-pre-connection-audio.md) | Audio device preheating to eliminate clipped greetings |
| 2025-11 | [Audible Sound for Call Connection](03-agent-experience/feature-voice-call-connection-sound.md) | Audio notification when agent's device is live |
| 2026-01 | [Proactive Voice Personalisation](01-channels/voice/feature-proactive-voice-personalization.md) | Three dial modes (Copilot lead, preview, progressive), throttling/pacing, Copilot agent for outbound |
| 2026-02 | [Deep Noise Suppression](03-agent-experience/feature-noise-suppression.md) | Org-level AI noise suppression for voice calls |
| 2026-02 | [SIP X Header Support for Context Transfer](01-channels/voice/feature-sip-x-header-context-transfer.md) | Passes up to 5 custom SIP headers (256 chars each) for Direct Routing deployments |
| 2026-02 | [Custom Reporting Variables for Historical Bot Dashboard](08-analytics-and-reporting/feature-bot-analytics-custom-variables.md) | Copilot Studio variables surface in bot dashboard for LoB/campaign segmentation |
| 2026-02-27 | [Custom Voice for Voice Agents](01-channels/self-service/feature-custom-voice-voice-agents.md) | Custom neural voice for IVR agents |
| 2026-03 | [Proactive Voice Engagement](01-channels/voice/feature-proactive-voice-engagement.md) | Outbound calling with AMD, predictive/preview dial, SIP outcomes |
| 2026-03-23 | [Reliable Post-Call Actions for Caller Hangups (Voice Agents)](01-channels/self-service/feature-voice-agent-hangup-detection.md) | Instant hangup detection for Copilot Studio voice agent flows; post-call actions fire on disconnect |
| 2026-03-30 | [Rich Media Messaging](01-channels/digital-messaging/feature-rich-media-messaging.md) | Forms, suggested replies, adaptive cards for chat and WhatsApp |
| 2025 Wave 2 | [Speaker-Wise Split Recordings](01-channels/voice/feature-speaker-split-recordings.md) | Colour-coded per-speaker recording tracks in closed conversation view |
| 2025 Wave 2 | [Copilot Plugins](05-copilot-and-ai/feature-copilot-plugins.md) | ⚠️ Preview — 15-min publish delay confirmed |
| 2025 Wave 2 | [Verbatim Responses](05-copilot-and-ai/feature-copilot-verbatim-responses.md) | ⚠️ Preview — Ask a Question scope only |
| 2025 Wave 2 | [Knowledge Sources](05-copilot-and-ai/feature-copilot-knowledge-sources.md) | ⚠️ Preview — Uses Graph connectors, not Copilot connectors |

## 2024 Wave 1 (April 2024 – September 2024)

Features available from the D365 Contact Center standalone launch.

| GA Date | Feature | Notes |
|---------|---------|-------|
| 2024 Wave 1 | [Customer Assist Agent](01-channels/self-service/feature-customer-assist-agent.md) | Autonomous AI agent end-to-end, Copilot credits, voice + digital `[🔑 Licence]` |
| 2024 Wave 1 | [Desktop Companion App (Embedded Voice)](01-channels/voice/feature-desktop-companion-app.md) | Windows app required for embedded voice, MDM deployment at scale |
| 2024 Wave 1 | [Predictive / Progressive Dialling](01-channels/voice/feature-voice-proactive-dialling.md) | Automated outbound dialling modes |
| 2024 Wave 1 | [Schedule Adherence & Tracking](07-workforce-engagement/feature-wfm-schedule-adherence.md) | Real-time D365 presence vs. schedule comparison, adherence score |
| 2024 Wave 1 | [Intraday Management (WFM)](07-workforce-engagement/feature-wfm-intraday.md) | Same-day staffing adjustment view, distinct from supervisor Intraday Insights |
| 2024 Wave 1 | [Quality Management (WFM)](07-workforce-engagement/feature-wfm-quality-management.md) | Manual QA scorecard, sampling logic, separate from Quality Evaluation Agent AI |
| 2024 Wave 1 | [Screen Recording](11-security-and-compliance/feature-screen-recording.md) | Desktop companion app required; full-screen capture; no default retention — configure bulk delete before go-live |
| 2024 Wave 1 | [WhatsApp Channel](01-channels/digital-messaging/feature-whatsapp-channel.md) | ACS-based WhatsApp; ⚠️ June 2026 BSUID change required — action required |

## Earlier

Core platform capabilities predating the D365 Contact Center standalone launch; available through Dynamics 365 Customer Service / Omnichannel for Customer Service.

| GA Date | Feature | Notes |
|---------|---------|-------|
| Earlier | [ACS PSTN Integration](01-channels/voice/feature-voice-acs-pstn.md) | ACS resource setup, number acquisition |
| Earlier | [Direct Routing (Bring Your Own Carrier)](01-channels/voice/feature-voice-direct-routing.md) | SBC requirements, SIP carrier via ACS |
| Earlier | [Microsoft Calling Plans](01-channels/voice/feature-voice-calling-plans.md) | Teams Phone numbers in Contact Center `[🔑 Licence]` |
| Earlier | [Real-Time Translation (Voice)](01-channels/voice/feature-voice-realtime-translation.md) | Live audio translation, Azure AI Speech |
| Earlier | [Callback (In-Queue & Scheduled)](01-channels/voice/feature-voice-callback.md) | Callback workstream, capacity counting |
| Earlier | [E911 Emergency Calling](01-channels/voice/feature-voice-e911.md) | Regulatory requirement, location policy |
| Earlier | [Music on Hold](01-channels/voice/feature-voice-music-on-hold.md) | Custom audio upload, supported formats |
| Earlier | [Phone Number Management & Porting](01-channels/voice/feature-voice-phone-number-management.md) | Porting timeline, release impact |
| Earlier | [Email Channel](01-channels/digital-messaging/feature-email-channel.md) | Exchange/EWS, threading, email routing |
| Earlier | [Proactive Chat](01-channels/digital-messaging/feature-proactive-chat.md) | Trigger rules, JS snippet, opt-out |
| Earlier | [Persistent Chat](01-channels/digital-messaging/feature-persistent-chat.md) | Auth requirement, multi-session threading |
| Earlier | [Co-browse / Screen Share](01-channels/digital-messaging/feature-cobrowse-screen-share.md) | Surfly provider, consent prompt |
| Earlier | [Instagram Direct Messages](01-channels/digital-messaging/feature-instagram-channel.md) | Meta Business Account, 24-hr window |
| Earlier | [Microsoft Teams Channel](01-channels/digital-messaging/feature-teams-channel.md) | Internal employee support via Teams chat |
| Earlier | [Custom Messaging Channel (Direct Line)](01-channels/digital-messaging/feature-custom-messaging-channel.md) | Azure Bot Framework Direct Line |
| Earlier | [Bot-to-Agent Escalation](01-channels/self-service/feature-bot-escalation.md) | Context transfer, variable mapping |
| Earlier | [Intelligent Skill Finder](02-routing/feature-intelligent-skill-finder.md) | ML routing, training data requirement |
| Earlier | [Wrap-Up / After Contact Work](03-agent-experience/feature-wrap-up-acw.md) | ACW timer modes, capacity interaction |
| Earlier | [Real-Time Translation (Chat)](03-agent-experience/feature-real-time-translation.md) | Azure AI Translator, chat channels only |
| Earlier | [Conversation Diagnostics](03-agent-experience/feature-conversation-diagnostics.md) | Per-conversation routing trace |
| Earlier | [Intraday Insights Dashboard](04-supervisor-experience/feature-intraday-insights.md) | Same-day KPIs, differs from Real-Time Analytics |
| Earlier | [Sentiment-Triggered Alerts](04-supervisor-experience/feature-sentiment-alerts.md) | Threshold config, supervisor alerts |
| Earlier | [Real-Time Sentiment Analysis](05-copilot-and-ai/feature-realtime-sentiment.md) | 1-10 scale, live conversation display |
| Earlier | [Voice Analytics Dashboard](08-analytics-and-reporting/feature-voice-analytics.md) | Separate enable toggle, call metrics |
| Earlier | [Bot / Self-Service Analytics](08-analytics-and-reporting/feature-bot-analytics.md) | Containment rate, escalation rate |
| Earlier | [Customer Sentiment Analytics](08-analytics-and-reporting/feature-sentiment-analytics.md) | Historical sentiment trends |
| Earlier | [Topics Analytics](08-analytics-and-reporting/feature-topics-analytics.md) | AI conversation clustering |
| Earlier | [Holiday Schedule](09-administration/feature-holiday-schedule.md) | Annual re-entry, Operating Hours linkage |
| Earlier | [Data Retention & Purge Policies](09-administration/feature-data-retention.md) | No native policy, bulk delete jobs |
| Earlier | [Channel Integration Framework v2](10-integration-and-extensibility/feature-cif-v2.md) | Multi-session widget embedding |
| Earlier | [Azure Event Grid Integration](10-integration-and-extensibility/feature-azure-event-grid.md) | Conversation lifecycle events |
| Earlier | [Omnichannel JavaScript SDK](10-integration-and-extensibility/feature-omnichannel-javascript-sdk.md) | Agent-side context API |
| Earlier | [RBAC / Security Roles](11-security-and-compliance/feature-rbac-security-roles.md) | Three-tier role structure |
| Earlier | [Agent SSO](11-security-and-compliance/feature-agent-sso.md) | Entra ID, MFA, embedded SSO |
| Earlier | [PCI-DSS Compliance](11-security-and-compliance/feature-pci-dss-compliance.md) | Masking, DTMF suppression, shared responsibility |
| Earlier | [Data Residency](11-security-and-compliance/feature-data-residency.md) | Dataverse region, ACS cross-region flows |
| Earlier | [GDPR & Data Subject Requests](11-security-and-compliance/feature-gdpr.md) | DSR tools, right to erasure |
| Earlier | [Voice Channel — Overview & Architecture](01-channels/voice/feature-voice-channel-overview.md) | ⚠️ Deprecated — local hosting removed for Switzerland (Oct 2024), India & Japan (Sep 2024) |
| Earlier | [Customer Feedback Surveys](10-integration-and-extensibility/feature-surveys.md) | ⚠️ Deprecated — post-call survey toggle on voice workstream Language tab removed Aug 2025 |
| Earlier | [Copilot Draft a Chat Response](05-copilot-and-ai/feature-copilot-draft-chat-response.md) | ⚠️ Deprecated — removed 14 Jul 2025; no migration path, replaced by Copilot Help Pane |
| Earlier | [Recording & Transcription](01-channels/voice/feature-voice-recording-transcription.md) | Event Grid now required for recording upload |
| Earlier | [Outbound Messaging](10-integration-and-extensibility/feature-outbound-messaging.md) | Flow-only trigger confirmed for SMS + WhatsApp |

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
- [Conversation Orchestration (AI-Powered Playbooks)](02-routing/feature-conversation-orchestration.md) — ⚠️ Preview — natural-language playbooks for dynamic queue prioritisation and overflow; watches wait time, agent availability, and transfer events in real time; voice and chat only; PAYG billing

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
- [Data Residency](11-security-and-compliance/feature-data-residency.md) — Dataverse region set at environment creation; ACS voice may process in a different region
- [GDPR & Data Subject Requests](11-security-and-compliance/feature-gdpr.md) — Power Platform DSR tools cover Dataverse; ACS/recording data needs manual process

**Monitoring & Control**

- [Audit Logging](11-security-and-compliance/feature-audit-logging.md) — Power Platform audit + Microsoft Purview; routing table audit is separate
- [Blocked Numbers](11-security-and-compliance/feature-blocked-numbers.md) — Manual block list + auto-block threshold for spam detection
- [Screen Recording](11-security-and-compliance/feature-screen-recording.md)