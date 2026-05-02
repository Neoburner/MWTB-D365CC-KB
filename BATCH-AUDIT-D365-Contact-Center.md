# Dynamics 365 Contact Center — Full Feature Batch Audit
**Documentation Roadmap | BATCH AUDIT MODE**
_Generated: 2026-04-30 | Reconciled: 2026-05-02 | Gaps filled: 2026-05-02 | Sources: Microsoft Learn, Release Wave Plans 2024 W2 → 2026 W1_

---

> **How to use this checklist**
> Each feature entry has a status marker. Work through these systematically using RETROSPECTIVE mode — feed each item's corresponding Microsoft Docs URL to generate a structured `.md` file in the correct category folder.
>
> Status key: `[ ]` Not started · `[~]` In progress · `[x]` Complete · `[–]` Intentional gap / covered elsewhere

---

## 📁 Folder Structure (GitHub)

```
d365-contact-center-kb/
├── 01-channels/
│   ├── voice/
│   ├── digital-messaging/
│   └── self-service/
├── 02-routing/
├── 03-agent-experience/
├── 04-supervisor-experience/
├── 05-copilot-and-ai/
├── 06-ai-agents/
├── 07-workforce-engagement/
├── 08-analytics-and-reporting/
├── 09-administration/
├── 10-integration-and-extensibility/
└── 11-security-and-compliance/
```

---

## 01 · CHANNELS

### 01-A · Voice Channel (`01-channels/voice/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 1.1 | Voice Channel — Overview & Architecture | [learn.microsoft.com/…/voice-channel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel) | `[x]` | `feature-voice-channel-overview.md` |
| 1.2 | Azure Communication Services (ACS) PSTN Integration | learn.microsoft.com/…/voice-channel-acs | `[x]` | `feature-voice-acs-pstn.md` |
| 1.3 | Direct Routing (Bring Your Own Carrier) | learn.microsoft.com/…/voice-channel-bring-your-own-number | `[x]` | `feature-voice-direct-routing.md` |
| 1.4 | Microsoft Calling Plans (Teams Phone) | learn.microsoft.com/…/voice-channel-calling-plan | `[x]` | `feature-voice-calling-plans.md` |
| 1.5 | Inbound Call Routing & IVR via Copilot Studio | learn.microsoft.com/…/voice-channel-configure-ivr | `[x]` | `feature-voice-inbound-calling.md` |
| 1.6 | Outbound Calling (Manual Outbound) | learn.microsoft.com/…/configure-outbound-inbound-calling | `[x]` | `feature-voice-outbound-calling.md` |
| 1.7 | Predictive Dialling Mode | [microsoft.com/…/proactive-voice-engagements](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/02/03/proactive-voice-engagements-dynamics-365-contact-center/) | `[x]` | `feature-voice-proactive-dialling.md` |
| 1.8 | Progressive Dialling Mode | learn.microsoft.com/…/proactive-engagement-outbound | `[–]` | Covered in `feature-voice-proactive-dialling.md` |
| 1.9 | Proactive Voice Engagements (SIP Outcome Codes) | learn.microsoft.com/…/proactive-engagement | `[x]` | `feature-proactive-voice-engagement.md` |
| 1.10 | Call Recording & Playback | learn.microsoft.com/…/call-recording | `[x]` | `feature-voice-recording-transcription.md` |
| 1.11 | Real-Time Call Transcription | learn.microsoft.com/…/voice-channel-transcription-recording | `[–]` | Covered in `feature-voice-recording-transcription.md` |
| 1.12 | Real-Time Translation (Voice) | learn.microsoft.com/…/real-time-translation | `[x]` | `feature-voice-realtime-translation.md` |
| 1.13 | Hold, Mute & Resume Controls | learn.microsoft.com/…/hold-customer-call | `[x]` | `feature-voice-hold-mute-resume.md` |
| 1.14 | Consult & Transfer (Blind / Warm) | learn.microsoft.com/…/voice-consult-transfer | `[–]` | Covered in `03-agent-experience/feature-transfer-consult.md` |
| 1.15 | Conference Calls | learn.microsoft.com/…/conference-calls | `[x]` | `feature-voice-conference-calls.md` |
| 1.16 | Call Overflow Management | learn.microsoft.com/…/manage-overflow | `[–]` | Covered in `02-routing/feature-overflow-management.md` |
| 1.17 | After-Hours Routing | learn.microsoft.com/…/set-up-afterhours-call | `[–]` | Covered in `09-administration/feature-operating-hours.md` |
| 1.18 | Callback (In-Queue & Scheduled) | learn.microsoft.com/…/configure-callback | `[x]` | `feature-voice-callback.md` |
| 1.19 | Voicemail | learn.microsoft.com/…/configure-voicemail | `[x]` | `feature-voice-voicemail.md` |
| 1.20 | Spam Call Detection | learn.microsoft.com/…/manage-spam-detection | `[–]` | Covered in `11-security-and-compliance/feature-blocked-numbers.md` |
| 1.21 | Desktop Companion App (Embedded Voice) | [microsoft.com/…/desktop-companion-app](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/02/26/desktop-companion-app-dynamics-365-contact-center-embedded/) | `[x]` | `feature-desktop-companion-app.md` |
| 1.22 | E911 (Emergency Calling) | learn.microsoft.com/…/emergency-calling | `[x]` | `feature-voice-e911.md` |
| 1.23 | Phone Number Management & Porting | learn.microsoft.com/…/manage-phone-numbers | `[x]` | `feature-voice-phone-number-management.md` |
| 1.24 | Music on Hold Configuration | learn.microsoft.com/…/music-on-hold | `[x]` | `feature-voice-music-on-hold.md` |

**Voice extras (in KB, not on original list):**
- `feature-callback-deduplication.md`
- `feature-consent-based-recording.md`
- `feature-enhanced-dial-pad-dtmf.md`
- `feature-secure-consult-transfer-pstn.md`
- `feature-speaker-split-recordings.md`

---

### 01-B · Digital Messaging Channels (`01-channels/digital-messaging/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 2.1 | Live Chat — Overview & Widget Setup | learn.microsoft.com/…/set-up-chat-widget | `[x]` | `feature-chat-channel.md` |
| 2.2 | Live Chat — Pre-Chat & Post-Chat Surveys | learn.microsoft.com/…/configure-pre-chat-survey | `[x]` | `feature-pre-conversation-survey.md` |
| 2.3 | Live Chat — Proactive Chat | learn.microsoft.com/…/proactive-chat | `[x]` | `feature-proactive-chat.md` |
| 2.4 | Live Chat — Persistent Chat | learn.microsoft.com/…/persistent-chat | `[x]` | `feature-persistent-chat.md` |
| 2.5 | Live Chat — Co-Browse / Screen Share | learn.microsoft.com/…/cobrowse | `[x]` | `feature-cobrowse-screen-share.md` |
| 2.6 | Email Channel | learn.microsoft.com/…/set-up-email | `[x]` | `feature-email-channel.md` |
| 2.7 | SMS — TeleSign Provider | learn.microsoft.com/…/configure-sms-channel | `[x]` | `feature-sms-channel.md` |
| 2.8 | SMS — Twilio Provider | learn.microsoft.com/…/configure-sms-channel-twilio | `[–]` | Covered in `feature-sms-channel.md` |
| 2.9 | SMS — Azure Communication Services | learn.microsoft.com/…/configure-sms-channel-acs | `[–]` | Covered in `feature-sms-channel.md` |
| 2.10 | Proactive SMS Outbound (Conversational) | learn.microsoft.com/…/configure-outbound-messaging | `[x]` | `feature-sms-proactive-engagement.md` |
| 2.11 | WhatsApp (via Twilio) | learn.microsoft.com/…/configure-whatsapp-channel | `[x]` | `feature-whatsapp-channel.md` |
| 2.12 | Facebook Messenger | learn.microsoft.com/…/configure-facebook-channel | `[x]` | `feature-facebook-channel.md` |
| 2.13 | Instagram Direct Messages | learn.microsoft.com/…/configure-instagram-channel | `[x]` | `feature-instagram-channel.md` |
| 2.14 | LINE | learn.microsoft.com/…/configure-line-channel | `[x]` | `feature-line-channel.md` |
| 2.15 | WeChat | learn.microsoft.com/…/configure-wechat-channel | `[x]` | `feature-wechat-channel.md` |
| 2.16 | Google Business Messages | learn.microsoft.com/…/configure-google-business-messages | `[x]` | `feature-google-business-messages.md` (deprecated Jul 2024) |
| 2.17 | Apple Messages for Business | learn.microsoft.com/…/configure-apple-messages-for-business | `[x]` | `feature-apple-messages-channel.md` |
| 2.18 | Microsoft Teams (Internal / Employee Support) | learn.microsoft.com/…/configure-teams-channel | `[x]` | `feature-teams-channel.md` |
| 2.19 | Custom Messaging Channel (Direct Line / Bring Your Own) | learn.microsoft.com/…/configure-custom-channel | `[x]` | `feature-custom-messaging-channel.md` |
| 2.20 | Attachment Handling Across Channels | learn.microsoft.com/…/file-attachments | `[x]` | `feature-attachment-handling.md` |
| 2.21 | Rich Text / Card Messaging Support | learn.microsoft.com/…/card-support | `[x]` | `feature-rich-media-messaging.md` |
| 2.22 | Real-Time Message Translation (Chat) | learn.microsoft.com/…/real-time-translation | `[–]` | Covered in `03-agent-experience/feature-real-time-translation.md` |

**Digital messaging extras (in KB, not on original list):**
- `feature-enhanced-chat-widget.md`
- `feature-sms-infobip.md`

---

### 01-C · Self-Service / AI-Powered Bots (`01-channels/self-service/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 3.1 | Copilot Studio Bot Integration — Overview | learn.microsoft.com/…/configure-bot-virtual-agent | `[–]` | Covered in `feature-bot-escalation.md` |
| 3.2 | Customer Assist Agent (Voice + Digital) | [microsoft.com/…/ai-agents](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/04/27/dynamics-365-contact-center-ai-agents/) | `[x]` | `feature-customer-assist-agent.md` |
| 3.3 | IVR via Copilot Studio (Voice Self-Service) | learn.microsoft.com/…/voice-channel-configure-ivr | `[x]` | `feature-ivr-voice-agents.md` |
| 3.4 | Bot-to-Agent Escalation (Context Transfer) | learn.microsoft.com/…/bot-to-agent-handoff | `[x]` | `feature-bot-escalation.md` |
| 3.5 | Azure Bot Service Integration | learn.microsoft.com/…/configure-bot-azure | `[x]` | `feature-azure-bot-service.md` |
| 3.6 | Third-Party Bot Integration (Direct Line) | learn.microsoft.com/…/configure-third-party-bot | `[x]` | `feature-third-party-bot-direct-line.md` |
| 3.7 | Multimodal Support in Customer Intent Agent | learn.microsoft.com/…/multimodal-customer-intent | `[x]` | `feature-multimodal-customer-intent.md` (planned Jun 2026) |
| 3.8 | Agent Deflection Analytics | learn.microsoft.com/…/bot-analytics | `[–]` | Covered in `08-analytics-and-reporting/feature-bot-analytics.md` |

**Self-service extras (in KB, not on original list):**
- `feature-custom-voice-voice-agents.md`

---

## 02 · ROUTING — Unified Routing (`02-routing/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 4.1 | Unified Routing — Overview & Architecture | [learn.microsoft.com/…/overview-unified-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/overview-unified-routing) | `[x]` | `feature-unified-routing-overview.md` |
| 4.2 | Workstreams — Setup & Configuration | learn.microsoft.com/…/create-workstreams | `[x]` | `feature-workstreams.md` |
| 4.3 | Queues — Setup & Management | [learn.microsoft.com/…/queues-omnichannel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/queues-omnichannel) | `[x]` | `feature-queues.md` |
| 4.4 | Work Classification — Rule-Based | [learn.microsoft.com/…/configure-work-classification](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-work-classification) | `[x]` | `feature-work-classification.md` |
| 4.5 | Work Classification — ML-Based (Intelligent Skill Finder) | learn.microsoft.com/…/intelligent-routing | `[x]` | `feature-intelligent-skill-finder.md` |
| 4.6 | Skill-Based Routing | [learn.microsoft.com/…/set-up-skill-based-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/set-up-skill-based-routing) | `[x]` | `feature-skill-based-routing.md` |
| 4.7 | Preferred Agent Routing | learn.microsoft.com/…/set-up-routing-to-preferred-agent | `[x]` | `feature-preferred-agent-routing.md` |
| 4.8 | Percent-Based Routing | learn.microsoft.com/…/percent-based-routing | `[x]` | `feature-percent-based-routing.md` |
| 4.9 | Assignment Methods — Highest Capacity | learn.microsoft.com/…/assignment-methods | `[x]` | `feature-assignment-methods.md` |
| 4.10 | Assignment Methods — Round Robin | learn.microsoft.com/…/assignment-methods | `[–]` | Covered in `feature-assignment-methods.md` |
| 4.11 | Assignment Methods — Advanced (Custom Rules) | learn.microsoft.com/…/configure-assignment-rules | `[–]` | Covered in `feature-assignment-methods.md` |
| 4.12 | Capacity Profiles | learn.microsoft.com/…/capacity-profiles | `[x]` | `feature-capacity-profiles.md` |
| 4.13 | Presence & Availability Management | learn.microsoft.com/…/presence-custom-presence | `[–]` | Covered in `09-administration/feature-presence-and-custom-presence.md` |
| 4.14 | Priority-Based Routing | learn.microsoft.com/…/priority-routing | `[x]` | `feature-priority-based-routing.md` |
| 4.15 | Overflow Management | learn.microsoft.com/…/manage-overflow | `[x]` | `feature-overflow-management.md` |
| 4.16 | Route-to-Queue Rules | learn.microsoft.com/…/configure-route-to-queue-rules | `[x]` | `feature-route-to-queue-rules.md` |
| 4.17 | Record Routing (Cases, Activities) | [learn.microsoft.com/…/set-up-record-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/set-up-record-routing) | `[x]` | `feature-record-routing.md` |
| 4.18 | Routing Diagnostics | [learn.microsoft.com/…/unified-routing-diagnostics](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/unified-routing-diagnostics) | `[x]` | `feature-routing-diagnostics.md` |
| 4.19 | Routing Best Practices & Optimization | [learn.microsoft.com/…/unified-routing-best-practices](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/unified-routing-best-practices) | `[x]` | `feature-routing-best-practices.md` |

**Routing extras (in KB, not on original list):**
- `feature-queue-availability-api.md`

---

## 03 · AGENT EXPERIENCE (`03-agent-experience/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 5.1 | Agent Desktop — Copilot Service Workspace Overview | learn.microsoft.com/…/csw-overview | `[x]` | `feature-csw-overview.md` |
| 5.2 | Customer Summary / 360 View | learn.microsoft.com/…/oc-customer-summary | `[x]` | `feature-customer-summary.md` |
| 5.3 | Active Conversation Screen | learn.microsoft.com/…/oc-conversation-screen | `[x]` | `feature-active-conversation-screen.md` |
| 5.4 | Communication Panel (Dialpad / Chat Interface) | learn.microsoft.com/…/communication-panel | `[x]` | `feature-communication-panel.md` |
| 5.5 | Session & Tab Management | learn.microsoft.com/…/session-tabs | `[–]` | Covered in `09-administration/feature-session-templates.md` |
| 5.6 | Multi-Session Handling | learn.microsoft.com/…/multisession | `[x]` | `feature-multisession-handling.md` |
| 5.7 | Presence & Status Management (Agent) | learn.microsoft.com/…/set-presence-status | `[–]` | Covered in `09-administration/feature-presence-and-custom-presence.md` |
| 5.8 | Notifications (Toast & In-App) | learn.microsoft.com/…/notifications | `[–]` | Covered in `09-administration/feature-notification-templates.md` |
| 5.9 | Internal Notes & Tags | learn.microsoft.com/…/oc-take-notes | `[x]` | `feature-internal-notes.md` |
| 5.10 | Wrap-Up (After Contact Work) | learn.microsoft.com/…/wrapup-notes | `[x]` | `feature-wrap-up-acw.md` |
| 5.11 | Quick Replies (Predefined Messages) | learn.microsoft.com/…/create-quick-replies | `[x]` | `feature-quick-replies.md` |
| 5.12 | Knowledge Base Search & Article Surfacing | learn.microsoft.com/…/search-knowledge-articles | `[x]` | `feature-knowledge-management.md` |
| 5.13 | Email Template Management | learn.microsoft.com/…/email-templates | `[x]` | `feature-email-templates.md` |
| 5.14 | Consult with Expert (Teams Integration) | learn.microsoft.com/…/teams-expert-consult | `[–]` | Covered in `10-integration-and-extensibility/feature-teams-voice-consult.md` |
| 5.15 | Internal Chat (Agent-to-Agent) | learn.microsoft.com/…/agent-internal-chat | `[x]` | `feature-internal-chat.md` |
| 5.16 | Case Management (Create, Link, Resolve) | learn.microsoft.com/…/case-management | `[x]` | `feature-case-management.md` |
| 5.17 | Timeline & Activity Feed | learn.microsoft.com/…/customer-timeline | `[x]` | `feature-timeline-activity-feed.md` |
| 5.18 | Customer Profile & History | learn.microsoft.com/…/customer-profile | `[x]` | `feature-customer-profile-history.md` |
| 5.19 | Screen Sharing (Co-Browse) | learn.microsoft.com/…/cobrowse | `[–]` | Covered in `01-channels/digital-messaging/feature-cobrowse-screen-share.md` |
| 5.20 | Accessibility (Screen Reader, Keyboard Nav) | learn.microsoft.com/…/accessibility | `[x]` | `feature-accessibility.md` |
| 5.21 | Conversation Diagnostics | learn.microsoft.com/…/conversation-diagnostics | `[x]` | `feature-conversation-diagnostics.md` |
| 5.22 | Customer-Facing Custom Chat Widget Branding | learn.microsoft.com/…/brand-widget | `[–]` | Covered in `01-channels/digital-messaging/feature-enhanced-chat-widget.md` |

**Agent experience extras (in KB, not on original list):**
- `feature-agent-scripts.md`
- `feature-cancel-voice-consult.md`
- `feature-macros.md`
- `feature-real-time-translation.md`
- `feature-smart-assist.md`
- `feature-transfer-consult.md`

---

## 04 · SUPERVISOR EXPERIENCE (`04-supervisor-experience/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 6.1 | Omnichannel Ongoing Conversations Dashboard | learn.microsoft.com/…/ongoing-conversations-dashboard | `[x]` | `feature-ongoing-conversations-dashboard.md` |
| 6.2 | Real-Time Monitoring (Agents, Queues, Conversations) | [learn.microsoft.com/…/monitor-conversations](https://learn.microsoft.com/en-us/dynamics365/customer-service/use/monitor-conversations) | `[x]` | `feature-realtime-analytics.md` |
| 6.3 | Supervisor Assign / Transfer Conversation | learn.microsoft.com/…/assign-conversations | `[x]` | `feature-supervisor-conversation-controls.md` |
| 6.4 | Supervisor Monitor (Listen / Whisper / Barge) | learn.microsoft.com/…/supervisor-monitor | `[x]` | `feature-supervisor-controls.md` |
| 6.5 | Intraday Insights Dashboard | learn.microsoft.com/…/intraday-insights-dashboard | `[x]` | `feature-intraday-insights.md` |
| 6.6 | Agent Status & Capacity View | learn.microsoft.com/…/agent-status | `[x]` | `feature-agent-status-capacity-view.md` |
| 6.7 | Queue Health Metrics (Real-Time) | learn.microsoft.com/…/queue-health | `[x]` | `feature-queue-health-metrics.md` |
| 6.8 | Sentiment-Triggered Alerts | learn.microsoft.com/…/sentiment-driven-alerts | `[x]` | `feature-sentiment-alerts.md` |
| 6.9 | Service Operations Agent (AI) | [microsoft.com/…/ai-agents](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/04/27/dynamics-365-contact-center-ai-agents/) | `[–]` | Covered in `09-administration/feature-service-operations-agent.md` |
| 6.10 | Supervisor Insights — Extensibility (Custom Metrics) | learn.microsoft.com/…/customize-supervisor-dashboard | `[x]` | `feature-supervisor-dashboard-extensibility.md` |
| 6.11 | Availability Forecast vs. Actual (WFM Integration) | learn.microsoft.com/…/wfm-supervisor | `[–]` | Covered in WFM docs |

---

## 05 · COPILOT & AI ASSISTANCE (`05-copilot-and-ai/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 7.1 | Copilot — Overview & Configuration | [learn.microsoft.com/…/configure-copilot-features](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-copilot-features) | `[x]` | `feature-copilot-overview-and-configuration.md` + `feature-configure-copilot.md` |
| 7.2 | Ask a Question (Copilot Knowledge Search) | learn.microsoft.com/…/use-copilot-features | `[–]` | Covered in `feature-copilot-help-pane.md` |
| 7.3 | Conversation Summary (Live) | learn.microsoft.com/…/copilot-conversation-summary | `[x]` | `feature-copilot-summaries.md` |
| 7.4 | Case Summary (Post-Conversation) | learn.microsoft.com/…/copilot-case-summary | `[–]` | Covered in `feature-copilot-summaries.md` |
| 7.5 | Write an Email (Copilot Draft) | learn.microsoft.com/…/use-copilot-email | `[x]` | `feature-copilot-email-drafting.md` |
| 7.6 | Chat Message Suggestions | learn.microsoft.com/…/copilot-chat-suggestions | `[x]` | `feature-copilot-draft-chat-response.md` |
| 7.7 | Real-Time Sentiment Analysis | learn.microsoft.com/…/enable-sentiment-analysis | `[x]` | `feature-realtime-sentiment.md` |
| 7.8 | Sentiment Tracking & History | learn.microsoft.com/…/sentiment-analytics | `[–]` | Covered in `08-analytics-and-reporting/feature-sentiment-analytics.md` |
| 7.9 | Live Transcription (Voice & Chat) | learn.microsoft.com/…/configure-transcription | `[–]` | Covered in `01-channels/voice/feature-voice-recording-transcription.md` |
| 7.10 | Real-Time Translation (Agent + Customer) | learn.microsoft.com/…/enable-real-time-translation | `[–]` | Covered in `03-agent-experience/feature-real-time-translation.md` |
| 7.11 | AI-Suggested Similar Cases | learn.microsoft.com/…/suggest-cases | `[x]` | `feature-ai-suggested-similar-cases.md` |
| 7.12 | AI-Suggested Knowledge Articles | learn.microsoft.com/…/suggest-knowledge | `[–]` | Covered in `feature-copilot-knowledge-sources.md` + `feature-copilot-help-pane.md` |
| 7.13 | Intelligent Skill Finder (ML Routing) | learn.microsoft.com/…/intelligent-skill-finder | `[–]` | Covered in `02-routing/feature-intelligent-skill-finder.md` |
| 7.14 | Copilot Audit & Governance | learn.microsoft.com/…/copilot-analytics | `[–]` | Covered in `08-analytics-and-reporting/feature-copilot-analytics.md` |
| 7.15 | Responsible AI Controls | learn.microsoft.com/…/responsible-ai-overview | `[x]` | `feature-responsible-ai.md` |
| 7.16 | Quality Assurance Agent (AI Auto-Scoring) | [microsoft.com/…/ai-agents](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/04/27/dynamics-365-contact-center-ai-agents/) | `[–]` | Covered in `06-ai-agents/feature-quality-evaluation-agent.md` |
| 7.17 | Generative AI Topics Discovery | learn.microsoft.com/…/topics-analytics | `[–]` | Covered in `08-analytics-and-reporting/feature-topics-analytics.md` |

**Copilot & AI extras (in KB, not on original list):**
- `feature-copilot-help-pane.md`
- `feature-copilot-knowledge-sources.md`
- `feature-copilot-plugins.md`
- `feature-copilot-summary-format.md`
- `feature-copilot-verbatim-responses.md`

---

## 06 · AI AGENTS (AUTONOMOUS) (`06-ai-agents/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 8.1 | Customer Assist Agent — Overview | [microsoft.com/…/ai-agents](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/04/27/dynamics-365-contact-center-ai-agents/) | `[x]` | `feature-customer-intent-agent.md` |
| 8.2 | Customer Assist Agent — Voice (Real-Time Low-Latency) | learn.microsoft.com/…/customer-assist-voice | `[x]` | `feature-customer-assist-voice.md` (planned Jun 2026) |
| 8.3 | Customer Assist Agent — Digital Channels | learn.microsoft.com/…/customer-assist-digital | `[–]` | Covered in `01-channels/self-service/feature-customer-assist-agent.md` |
| 8.4 | Quality Assurance Agent | learn.microsoft.com/…/quality-assurance-agent | `[x]` | `feature-quality-evaluation-agent.md` |
| 8.5 | Service Operations Agent | learn.microsoft.com/…/service-operations-agent | `[–]` | Covered in `09-administration/feature-service-operations-agent.md` |
| 8.6 | Agent Orchestration & Copilot Control Plane | learn.microsoft.com/…/agent-orchestration | `[x]` | `feature-agent-orchestration.md` |
| 8.7 | Human-in-the-Loop Oversight & Escalation | learn.microsoft.com/…/human-in-the-loop | `[x]` | `feature-human-in-the-loop.md` |
| 8.8 | Agentic Actions (CRM Read/Write) | learn.microsoft.com/…/agentic-actions | `[x]` | `feature-agentic-actions.md` |

**AI agents extras (in KB, not on original list):**
- `feature-agent-hub.md`
- `feature-agent-insights-dashboard.md`
- `feature-azure-ai-agent.md`
- `feature-copilot-agent-integration.md`
- `feature-service-agent-m365.md`

---

## 07 · WORKFORCE ENGAGEMENT MANAGEMENT (`07-workforce-engagement/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 9.1 | WFM — Overview & Licensing | [learn.microsoft.com/…/workforce-engagement-management](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/service/dynamics365-contact-center/workforce-engagement-management) | `[x]` | `feature-wfm-setup.md` |
| 9.2 | Forecasting — Long-Term (6-Month, Daily) | [learn.microsoft.com/…/wfm-forecast-scenarios](https://learn.microsoft.com/en-us/dynamics365/contact-center/use/wfm-forecast-scenarios) | `[x]` | `feature-wfm-forecasting-capacity.md` |
| 9.3 | Forecasting — Short-Term (6-Week, 15-Min Intervals) | learn.microsoft.com/…/wfm-forecast-scenarios | `[–]` | Covered in `feature-wfm-forecasting-capacity.md` |
| 9.4 | Forecasting — External Data Import | learn.microsoft.com/…/import-forecast-data | `[x]` | `feature-wfm-external-data-import.md` |
| 9.5 | Channel & Queue Slice Forecasting | learn.microsoft.com/…/wfm-forecast-channels | `[–]` | Covered in `feature-conversation-forecasting.md` |
| 9.6 | Schedule Generation & Management | learn.microsoft.com/…/wfm-schedule-management | `[x]` | `feature-wfm-schedule-management.md` |
| 9.7 | Schedule Adherence & Tracking | learn.microsoft.com/…/wfm-adherence | `[x]` | `feature-wfm-schedule-adherence.md` |
| 9.8 | Agent Self-Service Scheduling (Shift Swaps, Time Off) | learn.microsoft.com/…/agent-self-service | `[–]` | Covered in `feature-wfm-schedule-management.md` |
| 9.9 | Intraday Management (Real-Time Adherence) | learn.microsoft.com/…/wfm-intraday | `[x]` | `feature-wfm-intraday.md` |
| 9.10 | Quality Management — Conversation Scoring | learn.microsoft.com/…/wfm-quality-management | `[x]` | `feature-wfm-quality-management.md` |
| 9.11 | Quality Management — Auto-Scoring (AI) | learn.microsoft.com/…/wfm-auto-scoring | `[–]` | Covered in `06-ai-agents/feature-quality-evaluation-agent.md` |
| 9.12 | Agent Performance Feedback & Coaching | learn.microsoft.com/…/wfm-agent-feedback | `[x]` | `feature-wfm-agent-coaching.md` |

**WFM extras (in KB, not on original list):**
- `feature-conversation-forecasting.md` (AI forecasting report — distinct from WFM forecasting)
- `feature-wfm-shift-based-routing.md`

---

## 08 · ANALYTICS & REPORTING (`08-analytics-and-reporting/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 10.1 | Omnichannel Historical Analytics — Overview | learn.microsoft.com/…/omnichannel-analytics-insights | `[x]` | `feature-omnichannel-historical-analytics.md` |
| 10.2 | Summary Dashboard | learn.microsoft.com/…/summary-dashboard | `[–]` | Covered in `feature-omnichannel-historical-analytics.md` |
| 10.3 | Conversation Intelligence Dashboard | learn.microsoft.com/…/conversation-intelligence | `[x]` | `feature-conversation-intelligence-dashboard.md` |
| 10.4 | Queue Report | learn.microsoft.com/…/queue-report | `[–]` | Covered in `feature-omnichannel-historical-analytics.md` |
| 10.5 | Agent Report | learn.microsoft.com/…/agent-report | `[–]` | Covered in `feature-omnichannel-historical-analytics.md` |
| 10.6 | Bot / Self-Service Analytics | learn.microsoft.com/…/bot-dashboard | `[x]` | `feature-bot-analytics.md` |
| 10.7 | Voice Analytics Dashboard | learn.microsoft.com/…/voice-analytics | `[x]` | `feature-voice-analytics.md` |
| 10.8 | Knowledge Article Analytics | learn.microsoft.com/…/knowledge-article-analytics | `[x]` | `feature-knowledge-analytics.md` |
| 10.9 | Case Analytics | learn.microsoft.com/…/case-analytics | `[x]` | `feature-cs-historical-analytics.md` |
| 10.10 | Copilot Analytics (Adoption & Usage) | learn.microsoft.com/…/copilot-analytics | `[x]` | `feature-copilot-analytics.md` |
| 10.11 | Customer Sentiment Analytics | learn.microsoft.com/…/sentiment-analytics | `[x]` | `feature-sentiment-analytics.md` |
| 10.12 | Topics Analytics (AI-Clustered) | learn.microsoft.com/…/topics-analytics | `[x]` | `feature-topics-analytics.md` |
| 10.13 | Real-Time Analytics (Supervisor) | learn.microsoft.com/…/realtime-analytics | `[–]` | Covered in `04-supervisor-experience/feature-realtime-analytics.md` |
| 10.14 | Custom Dashboards & Extensibility | learn.microsoft.com/…/customize-reports | `[x]` | `feature-custom-dashboards.md` |
| 10.15 | Data Export to Azure Data Lake / Synapse | learn.microsoft.com/…/export-data-lake | `[x]` | `feature-data-lake-export.md` |
| 10.16 | Power BI Embedded Analytics | learn.microsoft.com/…/powerbi-embedded | `[x]` | `feature-powerbi-embedded.md` |
| 10.17 | SLA Management & KPI Tracking | learn.microsoft.com/…/sla-kpi | `[x]` | `feature-sla-tracking.md` |

**Analytics extras (in KB, not on original list):**
- `feature-segment-level-metrics.md`

---

## 09 · ADMINISTRATION (`09-administration/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 11.1 | Copilot Service Admin Center — Overview | learn.microsoft.com/…/cc-admin-center | `[x]` | `feature-copilot-service-admin-center.md` |
| 11.2 | System Requirements & Supported Browsers | learn.microsoft.com/…/system-requirements-contact-center | `[x]` | `feature-system-requirements.md` |
| 11.3 | Provisioning & Environment Setup | learn.microsoft.com/…/provision-channels | `[x]` | `feature-provisioning-unified-routing.md` |
| 11.4 | Licensing & Subscription Management | learn.microsoft.com/…/licensing | `[x]` | `feature-licensing.md` |
| 11.5 | User & Role Management | learn.microsoft.com/…/user-roles | `[x]` | `feature-user-management.md` |
| 11.6 | Capacity Profiles Administration | learn.microsoft.com/…/capacity-profiles | `[–]` | Covered in `feature-capacity-profiles.md` |
| 11.7 | Operating Hours Configuration | learn.microsoft.com/…/set-up-operating-hours | `[x]` | `feature-operating-hours.md` |
| 11.8 | Holiday Configuration | learn.microsoft.com/…/set-up-holiday-schedule | `[x]` | `feature-holiday-schedule.md` |
| 11.9 | Locale & Language Settings | learn.microsoft.com/…/language-settings | `[x]` | `feature-locale-language-settings.md` |
| 11.10 | Email Configuration (Exchange / EWS) | learn.microsoft.com/…/configure-email | `[x]` | `feature-email-exchange-configuration.md` |
| 11.11 | Notifications Templates | learn.microsoft.com/…/notification-templates | `[x]` | `feature-notification-templates.md` |
| 11.12 | Session Templates | learn.microsoft.com/…/session-templates | `[x]` | `feature-session-templates.md` |
| 11.13 | Application Tab Templates | learn.microsoft.com/…/application-tab-templates | `[x]` | `feature-application-tab-templates.md` |
| 11.14 | Geo-Redundancy & Failover | learn.microsoft.com/…/geo-redundancy | `[x]` | `feature-geo-redundancy.md` |
| 11.15 | Data Retention & Purge Policies | learn.microsoft.com/…/data-retention | `[x]` | `feature-data-retention.md` |

**Administration extras (in KB, not on original list):**
- `feature-capacity-profiles.md` (also listed in 02-routing)
- `feature-experience-profiles.md`
- `feature-presence-and-custom-presence.md`
- `feature-record-identification.md`
- `feature-role-persona-mapping.md`
- `feature-service-operations-agent.md`

---

## 10 · INTEGRATION & EXTENSIBILITY (`10-integration-and-extensibility/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 12.1 | CRM Connector Framework (Non-Dynamics CRMs) | learn.microsoft.com/…/crm-connectors | `[x]` | `feature-embedded-third-party-crm.md` |
| 12.2 | Salesforce CRM Integration | learn.microsoft.com/…/salesforce-connector | `[x]` | `feature-salesforce-connector.md` |
| 12.3 | ServiceNow CRM Integration | learn.microsoft.com/…/servicenow-connector | `[–]` | Covered in `feature-embedded-third-party-crm.md` |
| 12.4 | Microsoft Teams Collaboration (Consult/Escalate) | learn.microsoft.com/…/teams-collaboration | `[x]` | `feature-teams-voice-consult.md` + `feature-teams-phone-integration.md` |
| 12.5 | Power Automate — Custom Workflows | learn.microsoft.com/…/power-automate-workflows | `[x]` | `feature-power-automate-workflows.md` |
| 12.6 | Power Apps — Custom Apps & Embedded Experiences | learn.microsoft.com/…/power-apps-integration | `[x]` | `feature-power-apps-integration.md` |
| 12.7 | Channel Integration Framework (CIF) v1 | learn.microsoft.com/…/channel-integration-framework | `[–]` | Noted as deprecated in `feature-cif-v2.md` |
| 12.8 | Channel Integration Framework (CIF) v2 | learn.microsoft.com/…/cif-v2-overview | `[x]` | `feature-cif-v2.md` |
| 12.9 | Copilot Studio — Deep Integration | learn.microsoft.com/…/configure-bot-virtual-agent | `[–]` | Covered in `feature-bot-escalation.md` + `feature-customer-assist-agent.md` |
| 12.10 | Azure Event Grid — Real-Time Events | learn.microsoft.com/…/event-grid-integration | `[x]` | `feature-azure-event-grid.md` |
| 12.11 | APIs — Omnichannel REST API | learn.microsoft.com/…/omnichannel-api | `[x]` | `feature-omnichannel-rest-api.md` |
| 12.12 | JavaScript SDK (Client-Side Widget Extensibility) | learn.microsoft.com/…/omnichannel-javascript-api | `[x]` | `feature-omnichannel-javascript-sdk.md` |
| 12.13 | Custom Messaging Channel (Direct Line API) | learn.microsoft.com/…/configure-custom-channel | `[–]` | Covered in `01-channels/digital-messaging/feature-custom-messaging-channel.md` |
| 12.14 | CTI (Computer Telephony Integration) — Third-Party | learn.microsoft.com/…/cti-integration | `[–]` | Covered in `feature-cif-v2.md` |
| 12.15 | Azure AI Services Integration (Speech, Language) | learn.microsoft.com/…/azure-ai-services | `[x]` | `feature-azure-ai-services.md` |
| 12.16 | Customer Voice (Survey Post-Interaction) | learn.microsoft.com/…/customer-voice-survey | `[x]` | `feature-surveys.md` |

**Integration extras (in KB, not on original list):**
- `feature-config-data-migration.md`
- `feature-outbound-messaging.md`

---

## 11 · SECURITY & COMPLIANCE (`11-security-and-compliance/`)

| # | Feature | Doc Reference | Status | KB File |
|---|---------|---------------|--------|---------|
| 13.1 | Role-Based Access Control (RBAC) | learn.microsoft.com/…/security-roles | `[x]` | `feature-rbac-security-roles.md` |
| 13.2 | Agent Authentication & SSO | learn.microsoft.com/…/agent-sso | `[x]` | `feature-agent-sso.md` |
| 13.3 | Customer Identity Verification | learn.microsoft.com/…/customer-identity-verification | `[x]` | `feature-chat-authentication.md` |
| 13.4 | Data Encryption (At Rest & In Transit) | learn.microsoft.com/…/data-encryption | `[x]` | `feature-data-encryption.md` |
| 13.5 | PCI-DSS Compliance (Payment Card Masking) | learn.microsoft.com/…/pci-compliance | `[x]` | `feature-pci-dss-compliance.md` |
| 13.6 | Transcript & Recording Data Residency | learn.microsoft.com/…/data-residency | `[x]` | `feature-data-residency.md` |
| 13.7 | GDPR & Data Subject Request Support | learn.microsoft.com/…/gdpr | `[x]` | `feature-gdpr.md` |
| 13.8 | Audit Log | learn.microsoft.com/…/audit-log | `[x]` | `feature-audit-logging.md` |
| 13.9 | Data Loss Prevention (DLP) Policies | learn.microsoft.com/…/dlp-policies | `[x]` | `feature-dlp-policies.md` |
| 13.10 | Network Security & IP Allow-Listing | learn.microsoft.com/…/network-requirements | `[–]` | Covered in `09-administration/feature-system-requirements.md` |
| 13.11 | Microsoft Trust Center / Compliance Manager | learn.microsoft.com/…/trust-center | `[x]` | `feature-trust-center.md` |

**Security extras (in KB, not on original list):**
- `feature-blocked-numbers.md`
- `feature-data-masking.md`
- `feature-enhanced-authentication.md`
- `feature-screen-recording.md`

---

## Summary: Audit Totals (Reconciled 2026-05-02)

| Category | Total Items | `[x]` Done | `[–]` Covered Elsewhere | `[ ]` Gap |
|----------|------------|-----------|------------------------|-----------|
| 01-A Voice Channel | 24 | 16 | 7 | 0 |
| 01-B Digital Messaging | 22 | 17 | 5 | 0 |
| 01-C Self-Service / Bots | 8 | 6 | 2 | 0 |
| 02 Unified Routing | 19 | 14 | 5 | 0 |
| 03 Agent Experience | 22 | 15 | 7 | 0 |
| 04 Supervisor Experience | 11 | 8 | 3 | 0 |
| 05 Copilot & AI Assistance | 17 | 8 | 9 | 0 |
| 06 AI Agents (Autonomous) | 8 | 6 | 3 | 0 |
| 07 Workforce Engagement | 12 | 8 | 4 | 0 |
| 08 Analytics & Reporting | 17 | 13 | 5 | 0 |
| 09 Administration | 15 | 13 | 1 | 0 |
| 10 Integration & Extensibility | 16 | 11 | 5 | 0 |
| 11 Security & Compliance | 11 | 10 | 1 | 0 |
| **TOTAL** | **202** | **145** | **57** | **0** |

**145 items fully documented · 57 covered adequately within broader docs · 0 genuine gaps**

> All gaps filled as of 2026-05-02.

---

## Gap Summary — COMPLETE

All 50 gaps filled as of 2026-05-02. See commit history for the docs added in each batch.

### Previously high priority (now documented)
- `03` Agent desktop workspace overview, Customer Summary / 360 view, Active Conversation screen, multi-session handling, internal notes — these are the bread-and-butter agent UX docs that are missing
- `04` Ongoing Conversations dashboard, Agent Status & Capacity view — core supervisor views
- `08` SLA tracking, Custom dashboards — analytics clients ask about constantly
- `09` Licensing, Email config (Exchange/EWS) — admin fundamentals

### Medium priority
- `02` Percent-based routing, Priority-based routing
- `06` Agent Orchestration, Human-in-the-loop, Agentic Actions (CRM read/write) — emerging but increasingly relevant
- `10` Power Automate workflows, REST API reference
- `11` Data Encryption, DLP Policies

### Lower priority / reference only
- `01-A` Hold/Mute/Resume controls, Conference calls
- `01-B` WeChat (no MS Learn page exists), Google Business Messages, Attachment handling
- `01-C` Azure Bot Service, Third-party bot (Direct Line), Multimodal support
- `07` External forecast data import, Agent coaching
- `08` Conversation Intelligence dashboard, Data Lake export, Power BI embedded
- `09` Geo-redundancy, Locale/Language settings
- `11` Trust Center / Compliance Manager

---

_Last updated: 2026-05-02 (all gaps filled) | Next review: on each Microsoft release wave announcement_
_Sources: [learn.microsoft.com/dynamics365/contact-center](https://learn.microsoft.com/en-us/dynamics365/contact-center/) | [Release Plan 2026 W1](https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/) | [Release Plan 2025 W2](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/) | [Release Plan 2025 W1](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/service/dynamics365-contact-center/)_
