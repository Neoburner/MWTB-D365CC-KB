# MWTB — Dynamics 365 Contact Center Knowledge Base

Internal consultant reference for Dynamics 365 Contact Center and Customer Service. One doc per feature. No sales copy — just what it does, when to use it, and what will catch you out.

**127 features documented** across 11 categories. Coverage is ongoing.

---

## How to use

Each doc follows the same structure:

- **What it does** — plain English, one or two sentences
- **Key facts** — limits, defaults, prerequisites, non-obvious behaviour
- **When to use / skip** — when this is the right tool and when it isn't
- **Configuration decisions** — the choices an implementer has to make
- **Gotchas** — things that will catch you out on a real project

Docs link back to the Microsoft Learn source and include a review trigger note at the bottom.

---

## 01 · Channels

### Voice
| Doc | What it covers |
|-----|---------------|
| [Voice Channel Overview](01-channels/voice/feature-voice-channel-overview.md) | Architecture, prerequisites, network assessment |
| [ACS PSTN Integration](01-channels/voice/feature-voice-acs-pstn.md) | ACS resource setup, number acquisition, ACS-to-D365 connection |
| [Direct Routing (Bring Your Own Carrier)](01-channels/voice/feature-voice-direct-routing.md) | SBC requirements, SIP carrier connection via ACS |
| [Microsoft Calling Plans](01-channels/voice/feature-voice-calling-plans.md) | Teams Phone numbers in Contact Center, geographic availability |
| [Inbound Calling](01-channels/voice/feature-voice-inbound-calling.md) | Bridged vs non-bridged transfer, operating hours interaction |
| [Outbound Calling](01-channels/voice/feature-voice-outbound-calling.md) | Personal numbers, 20-min queue delay, geographic restrictions |
| [Predictive / Progressive Dialling](01-channels/voice/feature-voice-proactive-dialling.md) | Automated outbound dialling modes, Power Automate trigger, SIP outcome codes |
| [Recording & Transcription](01-channels/voice/feature-voice-recording-transcription.md) | Event Grid prerequisite, MIME allowlisting |
| [Real-Time Translation (Voice)](01-channels/voice/feature-voice-realtime-translation.md) | Azure AI Speech, translated audio stream, latency implications |
| [Voicemail](01-channels/voice/feature-voice-voicemail.md) | Operating hours conflict, IVR limitation |
| [Callback (In-Queue & Scheduled)](01-channels/voice/feature-voice-callback.md) | Callback workstream config, capacity counting |
| [E911 Emergency Calling](01-channels/voice/feature-voice-e911.md) | Regulatory requirement, location policy, ACS/Teams dependency |
| [Music on Hold](01-channels/voice/feature-voice-music-on-hold.md) | Custom audio upload, supported formats, admin center location |
| [Phone Number Management & Porting](01-channels/voice/feature-voice-phone-number-management.md) | ACS vs Direct Routing numbers, porting timeline, release impact |
| [Desktop Companion App (Embedded Voice)](01-channels/voice/feature-desktop-companion-app.md) | Windows app for embedded deployments, Intune/SCCM requirement |

### Digital Messaging
| Doc | What it covers |
|-----|---------------|
| [Chat Channel](01-channels/digital-messaging/feature-chat-channel.md) | Widget setup, screen sharing, domain restrictions |
| [Proactive Chat](01-channels/digital-messaging/feature-proactive-chat.md) | Trigger rules, JavaScript snippet, opt-out handling |
| [Persistent Chat](01-channels/digital-messaging/feature-persistent-chat.md) | Auth requirement, conversation lifespan, multi-session threading |
| [Co-browse / Screen Share](01-channels/digital-messaging/feature-cobrowse-screen-share.md) | Third-party provider (Surfly), consent prompt, agent-initiated flow |
| [Email Channel](01-channels/digital-messaging/feature-email-channel.md) | Exchange/EWS connection, threading, email vs. standard Dynamics activity |
| [SMS Channel](01-channels/digital-messaging/feature-sms-channel.md) | ACS/Twilio, no rep-initiated outbound, toll-free verification |
| [WhatsApp Channel](01-channels/digital-messaging/feature-whatsapp-channel.md) | June 2026 BSUID change, 24-hour window, Event Grid auth |
| [Facebook Channel](01-channels/digital-messaging/feature-facebook-channel.md) | 60-day token refresh, message tag, dev mode |
| [Instagram Direct Messages](01-channels/digital-messaging/feature-instagram-channel.md) | Meta Business Account, 24-hour window, Facebook channel dependency |
| [Apple Messages for Business](01-channels/digital-messaging/feature-apple-messages-channel.md) | Apple approval lead time, two external dependencies |
| [LINE Channel](01-channels/digital-messaging/feature-line-channel.md) | Japan/SEA markets, long-lived token |
| [Microsoft Teams Channel](01-channels/digital-messaging/feature-teams-channel.md) | Internal employee support, bot manifest, Teams app deployment |
| [Custom Messaging Channel (Direct Line)](01-channels/digital-messaging/feature-custom-messaging-channel.md) | Azure Bot Framework Direct Line, Copilot Studio requirement |
| [Pre-Conversation Survey](01-channels/digital-messaging/feature-pre-conversation-survey.md) | Chat only, 10-question limit, exact context key names |

### Self-Service
| Doc | What it covers |
|-----|---------------|
| [IVR / Voice Agents](01-channels/self-service/feature-ivr-voice-agents.md) | Copilot Studio IVR, 1-hour call limit, NLU+ |
| [Customer Assist Agent (AI Self-Service)](01-channels/self-service/feature-customer-assist-agent.md) | Autonomous AI agent, Copilot credits, voice + digital, escalation |
| [Bot-to-Agent Escalation](01-channels/self-service/feature-bot-escalation.md) | Context transfer at handoff, variable mapping, agent notification |

---

## 02 · Routing

| Doc | What it covers |
|-----|---------------|
| [Unified Routing Overview](02-routing/feature-unified-routing-overview.md) | Architecture, classification before assignment |
| [Workstreams](02-routing/feature-workstreams.md) | Push/Pick permanent, async plug-ins |
| [Queues](02-routing/feature-queues.md) | Type permanent, fallback queue, design order |
| [Assignment Methods](02-routing/feature-assignment-methods.md) | 4 methods, decline limit, Dynamic Prioritisation |
| [Work Classification](02-routing/feature-work-classification.md) | 10 rulesets/100 rules/5 outputs, chaining |
| [Route-to-Queue Rules](02-routing/feature-route-to-queue-rules.md) | Hit-all vs hit-first, percentage routing |
| [Skill-Based Routing](02-routing/feature-skill-based-routing.md) | Rating model mismatch, Exact vs Closest |
| [Intelligent Skill Finder (ML Routing)](02-routing/feature-intelligent-skill-finder.md) | ML-based skill classification, training data minimum, co-exists with rule-based |
| [Capacity Profiles](02-routing/feature-capacity-profiles.md) | Reset frequency permanent, record capacity release |
| [Overflow Management](02-routing/feature-overflow-management.md) | Pre-queue vs post-queue, operating hours condition |
| [Preferred Agent Routing](02-routing/feature-preferred-agent-routing.md) | Skills bypassed, push-mode only |
| [Record Routing](02-routing/feature-record-routing.md) | 5-minute cycle, capacity release, security permissions |
| [Routing Diagnostics](02-routing/feature-routing-diagnostics.md) | ⚠️ Deprecated — enable in UAT from day one |

---

## 03 · Agent Experience

| Doc | What it covers |
|-----|---------------|
| [Agent Scripts](03-agent-experience/feature-agent-scripts.md) | Session templates, expression-based selection |
| [Macros](03-agent-experience/feature-macros.md) | Start macro execution required, no branching |
| [Knowledge Management](03-agent-experience/feature-knowledge-management.md) | Search mode, portal domain matching |
| [Quick Replies](03-agent-experience/feature-quick-replies.md) | Locale mismatch, context key slugs |
| [Smart Assist](03-agent-experience/feature-smart-assist.md) | ⚠️ Native suggestions deprecated June 2025 |
| [Transfer & Consult](03-agent-experience/feature-transfer-consult.md) | Wrap-up config, FetchXML filters |
| [Wrap-Up / After Contact Work](03-agent-experience/feature-wrap-up-acw.md) | ACW timer modes, capacity interaction, disposition codes |
| [Real-Time Translation](03-agent-experience/feature-real-time-translation.md) | Azure AI Translator, chat only, agent language detection |
| [Conversation Diagnostics](03-agent-experience/feature-conversation-diagnostics.md) | Per-conversation routing trace, error flags, agent + supervisor access |

---

## 04 · Supervisor Experience

| Doc | What it covers |
|-----|---------------|
| [Real-Time Analytics](04-supervisor-experience/feature-realtime-analytics.md) | On by default, voice analytics separate checkbox |
| [Supervisor Controls](04-supervisor-experience/feature-supervisor-controls.md) | All 4 toggles off by default, direct role assignment |
| [Supervisor Conversation Controls](04-supervisor-experience/feature-supervisor-conversation-controls.md) | Toggles AND dashboard access both required |
| [Intraday Insights Dashboard](04-supervisor-experience/feature-intraday-insights.md) | Same-day operational KPIs, data refresh rate, differs from Real-Time Analytics |
| [Sentiment-Triggered Alerts](04-supervisor-experience/feature-sentiment-alerts.md) | Threshold config, supervisor dashboard alert display |

---

## 05 · Copilot and AI

| Doc | What it covers |
|-----|---------------|
| [Copilot Overview & Configuration](05-copilot-and-ai/feature-copilot-overview-and-configuration.md) | Feature matrix by deployment type |
| [Configure Copilot](05-copilot-and-ai/feature-configure-copilot.md) | GA regions, opt-out permanent, custom role privileges |
| [Copilot Help Pane](05-copilot-and-ai/feature-copilot-help-pane.md) | Ask a Question, custom instructions, KB refresh |
| [Copilot Summaries](05-copilot-and-ai/feature-copilot-summaries.md) | 50-token minimum, bot transcripts excluded |
| [Conversation Summary Format](05-copilot-and-ai/feature-copilot-summary-format.md) | One global setting, 5 built-in categories |
| [Email Drafting](05-copilot-and-ai/feature-copilot-email-drafting.md) | Two modes, RTE v2 required for inline |
| [Knowledge Sources](05-copilot-and-ai/feature-copilot-knowledge-sources.md) | ⚠️ Preview — Graph connectors, not Copilot connectors |
| [Copilot Plugins](05-copilot-and-ai/feature-copilot-plugins.md) | ⚠️ Preview — 15-min publish delay |
| [Verbatim Responses](05-copilot-and-ai/feature-copilot-verbatim-responses.md) | ⚠️ Preview — Ask a Question only, KB manager configures |
| [Real-Time Sentiment Analysis](05-copilot-and-ai/feature-realtime-sentiment.md) | 1-10 scale, live conversation display, Azure AI dependency |

---

## 06 · AI Agents

| Doc | What it covers |
|-----|---------------|
| [Agent Hub](06-ai-agents/feature-agent-hub.md) | Navigation surface only, not config |
| [Copilot Studio Agent Integration](06-ai-agents/feature-copilot-agent-integration.md) | One agent per workstream, push-mode, 30-min inactivity |
| [Azure AI Agent](06-ai-agents/feature-azure-ai-agent.md) | Chat/social only, Managed Identity required |
| [Customer Intent Agent](06-ai-agents/feature-customer-intent-agent.md) | Copilot credits, intent library, lines of business |
| [Quality Evaluation Agent](06-ai-agents/feature-quality-evaluation-agent.md) | 3 prerequisites, scoring permanent once enabled |
| [Agent Insights Dashboard](06-ai-agents/feature-agent-insights-dashboard.md) | Standalone only, quality score dependency |
| [Service Agent in M365 Copilot](06-ai-agents/feature-service-agent-m365.md) | M365 Copilot licence, English only, dual icon |

---

## 07 · Workforce Engagement

| Doc | What it covers |
|-----|---------------|
| [WFM Setup & Installation](07-workforce-engagement/feature-wfm-setup.md) | Separate package, Bookable Resource requirement |
| [Conversation Forecasting](07-workforce-engagement/feature-conversation-forecasting.md) | AI-backed report, concurrency config, 24-hr delay |
| [WFM Forecasting & Capacity Planning](07-workforce-engagement/feature-wfm-forecasting-capacity.md) | WFM-native forecasting, scenario modelling |
| [Schedule Management](07-workforce-engagement/feature-wfm-schedule-management.md) | Shift bidding, swapping, time-off, activity types |
| [Shift-Based Routing](07-workforce-engagement/feature-wfm-shift-based-routing.md) | Routes based on published shift schedules |
| [Schedule Adherence & Tracking](07-workforce-engagement/feature-wfm-schedule-adherence.md) | Real-time schedule vs. presence comparison, adherence scoring |
| [Intraday Management](07-workforce-engagement/feature-wfm-intraday.md) | Same-day staffing adjustments, forecast vs. actual headcount |
| [Quality Management (Conversation Scoring)](07-workforce-engagement/feature-wfm-quality-management.md) | Manual QA scorecard, sampling, coaching workflow |

---

## 08 · Analytics and Reporting

| Doc | What it covers |
|-----|---------------|
| [Omnichannel Historical Analytics](08-analytics-and-reporting/feature-omnichannel-historical-analytics.md) | Standalone only, add-on dashboards, 24-hr delay |
| [CS Historical Analytics](08-analytics-and-reporting/feature-cs-historical-analytics.md) | Case-level analytics, AI topic clustering |
| [Knowledge Analytics](08-analytics-and-reporting/feature-knowledge-analytics.md) | Article insights + search term insights (separate toggle) |
| [Copilot Analytics](08-analytics-and-reporting/feature-copilot-analytics.md) | Adoption tracking, usage not quality |
| [Voice Analytics Dashboard](08-analytics-and-reporting/feature-voice-analytics.md) | Separate enable toggle, call volume/AHT/abandon rate, 24-hr delay |
| [Bot / Self-Service Analytics](08-analytics-and-reporting/feature-bot-analytics.md) | Containment rate, escalation rate, Copilot Studio dependency |
| [Customer Sentiment Analytics](08-analytics-and-reporting/feature-sentiment-analytics.md) | Historical sentiment trends, 1-10 scale, requires sentiment enabled |
| [Topics Analytics (AI-Clustered)](08-analytics-and-reporting/feature-topics-analytics.md) | AI conversation clustering, topic-level KPIs, Customer Intent Agent link |

---

## 09 · Administration

| Doc | What it covers |
|-----|---------------|
| [System Requirements](09-administration/feature-system-requirements.md) | Browsers, network, URL allowlist, third-party cookies |
| [Copilot Service Admin Center](09-administration/feature-copilot-service-admin-center.md) | Unified admin surface, adaptive site map |
| [Provisioning Unified Routing](09-administration/feature-provisioning-unified-routing.md) | Auto in CC, manual in CS-only, root BU requirement |
| [User Management](09-administration/feature-user-management.md) | Bookable Resource requirement, bulk management |
| [Capacity Profiles](09-administration/feature-capacity-profiles.md) | Reset frequency permanent, assignment blocking |
| [Experience Profiles](09-administration/feature-experience-profiles.md) | Workspace tool toggles, Copilot gating |
| [Session Templates](09-administration/feature-session-templates.md) | Anchor tab, additional tabs, comm panel mode |
| [Application Tab Templates](09-administration/feature-application-tab-templates.md) | Page types, slugs, OData parameters |
| [Notification Templates](09-administration/feature-notification-templates.md) | 4-field limit, desktop notifications, reject button |
| [Operating Hours](09-administration/feature-operating-hours.md) | Cannot be migrated, auto-created overflow condition |
| [Holiday Schedule](09-administration/feature-holiday-schedule.md) | Annual re-entry requirement, Operating Hours linkage |
| [Presence & Custom Presence](09-administration/feature-presence-and-custom-presence.md) | Base status mapping, Busy-DND auto-trigger |
| [Record Identification](09-administration/feature-record-identification.md) | Exact context key names, active status only |
| [Role Persona Mapping](09-administration/feature-role-persona-mapping.md) | Custom roles, three-step grant process |
| [Data Retention & Purge Policies](09-administration/feature-data-retention.md) | Bulk delete jobs, no native retention policy, storage growth risk |

---

## 10 · Integration and Extensibility

| Doc | What it covers |
|-----|---------------|
| [Configuration Data Migration](10-integration-and-extensibility/feature-config-data-migration.md) | Per-channel migration, operating hours excluded |
| [Embedded Widget (Salesforce / ServiceNow)](10-integration-and-extensibility/feature-embedded-third-party-crm.md) | CTI/OpenFrame embedding, context passing |
| [Salesforce Data Connector](10-integration-and-extensibility/feature-salesforce-connector.md) | One-way sync, 10 GB limit, column mapping |
| [Outbound Messaging](10-integration-and-extensibility/feature-outbound-messaging.md) | SMS + WhatsApp via Flow only, opt-in compliance |
| [Customer Feedback Surveys](10-integration-and-extensibility/feature-surveys.md) | Copilot Studio backed, MCS_CSAT variable required |
| [Teams Phone Integration](10-integration-and-extensibility/feature-teams-phone-integration.md) | Reuse existing Teams PSTN numbers in Contact Center |
| [Teams Voice Consult (VOIP)](10-integration-and-extensibility/feature-teams-voice-consult.md) | Consult/transfer to Teams users without a phone number |
| [Channel Integration Framework v2](10-integration-and-extensibility/feature-cif-v2.md) | Multi-session widget embedding, session lifecycle APIs, CIF v1 vs v2 |
| [Azure Event Grid Integration](10-integration-and-extensibility/feature-azure-event-grid.md) | Conversation lifecycle events, recording notifications, downstream triggers |
| [Omnichannel JavaScript SDK](10-integration-and-extensibility/feature-omnichannel-javascript-sdk.md) | Agent-side context API, session methods, customer-side widget SDK |

---

## 11 · Security and Compliance

| Doc | What it covers |
|-----|---------------|
| [Audit Logging](11-security-and-compliance/feature-audit-logging.md) | Power Platform audit, Purview, routing table audit |
| [Blocked Numbers](11-security-and-compliance/feature-blocked-numbers.md) | Voice spam, auto-block threshold |
| [Chat Authentication](11-security-and-compliance/feature-chat-authentication.md) | OAuth 2.0 JWT, portal sign-in, context passing |
| [Data Masking](11-security-and-compliance/feature-data-masking.md) | Chat regex rules + voice sensitive variable masking |
| [Screen Recording](11-security-and-compliance/feature-screen-recording.md) | Desktop companion app, full-screen capture, retention |
| [RBAC / Security Roles](11-security-and-compliance/feature-rbac-security-roles.md) | OOB role set, three-tier structure, Dataverse + persona + experience profile |
| [Agent SSO](11-security-and-compliance/feature-agent-sso.md) | Entra ID, MFA, embedded deployment SSO considerations |
| [PCI-DSS Compliance](11-security-and-compliance/feature-pci-dss-compliance.md) | Voice/chat masking, DTMF suppression, shared responsibility model |
| [Data Residency](11-security-and-compliance/feature-data-residency.md) | Dataverse region, ACS cross-region flows, AI processing regions |
| [GDPR & Data Subject Requests](11-security-and-compliance/feature-gdpr.md) | DSR tools, right to erasure, AI-derived data deletion |

---

## Coverage gaps

The following features are identified in the batch audit checklist but not yet documented:

- Voice: conference calls, hold/mute/resume controls
- Digital messaging: WeChat (no dedicated MS Learn page exists), Google Business Messages, attachment handling, rich text/card support, real-time message translation (chat)
- Self-service: Azure Bot Service integration, third-party bot integration (Direct Line), multimodal customer intent, bot deflection analytics
- Routing: percent-based routing (partially covered in route-to-queue doc), priority-based routing
- Agent experience: swarming, email threading, internal notes & tags, customer summary/360 view, multi-session handling overview
- Copilot: AI-suggested similar cases, AI-suggested knowledge articles, responsible AI controls
- Supervisor: service operations agent (AI), supervisor extensibility (custom metrics)
- WFM: external data import for forecasting, agent feedback & coaching
- Analytics: custom dashboards/extensibility, data export to Azure Data Lake, Power BI embedded, SLA management
- Administration: locale/language settings, geo-redundancy & failover, email configuration (Exchange/EWS admin setup), licensing management
- Integration: CIF v1, Power Automate custom workflows, Power Apps integration, Copilot Studio deep integration, Azure AI services, CTI third-party, ServiceNow connector
- Security: DLP policies, network security/IP allowlisting

---

*Last updated: 2026-04-30 · 127 features documented*
