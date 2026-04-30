# Dynamics 365 Contact Center — Full Feature Batch Audit
**Documentation Roadmap | BATCH AUDIT MODE**
_Generated: 2026-04-30 | Sources: Microsoft Learn, Release Wave Plans 2024 W2 → 2026 W1_

---

> **How to use this checklist**
> Each feature entry has a status marker. Work through these systematically using RETROSPECTIVE mode — feed each item's corresponding Microsoft Docs URL to generate a structured `.md` file in the correct category folder.
>
> Status key: `[ ]` Not started · `[~]` In progress · `[x]` Complete

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

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 1.1 | Voice Channel — Overview & Architecture | [learn.microsoft.com/…/voice-channel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel) | `[ ]` |
| 1.2 | Azure Communication Services (ACS) PSTN Integration | learn.microsoft.com/…/voice-channel-acs | `[ ]` |
| 1.3 | Direct Routing (Bring Your Own Carrier) | learn.microsoft.com/…/voice-channel-bring-your-own-number | `[ ]` |
| 1.4 | Microsoft Calling Plans (Teams Phone) | learn.microsoft.com/…/voice-channel-calling-plan | `[ ]` |
| 1.5 | Inbound Call Routing & IVR via Copilot Studio | learn.microsoft.com/…/voice-channel-configure-ivr | `[ ]` |
| 1.6 | Outbound Calling (Manual Outbound) | learn.microsoft.com/…/configure-outbound-inbound-calling | `[ ]` |
| 1.7 | Predictive Dialling Mode | [microsoft.com/…/proactive-voice-engagements](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/02/03/proactive-voice-engagements-dynamics-365-contact-center/) | `[ ]` |
| 1.8 | Progressive Dialling Mode | learn.microsoft.com/…/proactive-engagement-outbound | `[ ]` |
| 1.9 | Proactive Voice Engagements (SIP Outcome Codes) | learn.microsoft.com/…/proactive-engagement | `[ ]` |
| 1.10 | Call Recording & Playback | learn.microsoft.com/…/call-recording | `[ ]` |
| 1.11 | Real-Time Call Transcription | learn.microsoft.com/…/voice-channel-transcription-recording | `[ ]` |
| 1.12 | Real-Time Translation (Voice) | learn.microsoft.com/…/real-time-translation | `[ ]` |
| 1.13 | Hold, Mute & Resume Controls | learn.microsoft.com/…/hold-customer-call | `[ ]` |
| 1.14 | Consult & Transfer (Blind / Warm) | learn.microsoft.com/…/voice-consult-transfer | `[ ]` |
| 1.15 | Conference Calls | learn.microsoft.com/…/conference-calls | `[ ]` |
| 1.16 | Call Overflow Management | learn.microsoft.com/…/manage-overflow | `[ ]` |
| 1.17 | After-Hours Routing | learn.microsoft.com/…/set-up-afterhours-call | `[ ]` |
| 1.18 | Callback (In-Queue & Scheduled) | learn.microsoft.com/…/configure-callback | `[ ]` |
| 1.19 | Voicemail | learn.microsoft.com/…/configure-voicemail | `[ ]` |
| 1.20 | Spam Call Detection | learn.microsoft.com/…/manage-spam-detection | `[ ]` |
| 1.21 | Desktop Companion App (Embedded Voice) | [microsoft.com/…/desktop-companion-app](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/02/26/desktop-companion-app-dynamics-365-contact-center-embedded/) | `[ ]` |
| 1.22 | E911 (Emergency Calling) | learn.microsoft.com/…/emergency-calling | `[ ]` |
| 1.23 | Phone Number Management & Porting | learn.microsoft.com/…/manage-phone-numbers | `[ ]` |
| 1.24 | Music on Hold Configuration | learn.microsoft.com/…/music-on-hold | `[ ]` |

---

### 01-B · Digital Messaging Channels (`01-channels/digital-messaging/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 2.1 | Live Chat — Overview & Widget Setup | learn.microsoft.com/…/set-up-chat-widget | `[ ]` |
| 2.2 | Live Chat — Pre-Chat & Post-Chat Surveys | learn.microsoft.com/…/configure-pre-chat-survey | `[ ]` |
| 2.3 | Live Chat — Proactive Chat | learn.microsoft.com/…/proactive-chat | `[ ]` |
| 2.4 | Live Chat — Persistent Chat | learn.microsoft.com/…/persistent-chat | `[ ]` |
| 2.5 | Live Chat — Co-Browse / Screen Share | learn.microsoft.com/…/cobrowse | `[ ]` |
| 2.6 | Email Channel | learn.microsoft.com/…/set-up-email | `[ ]` |
| 2.7 | SMS — TeleSign Provider | learn.microsoft.com/…/configure-sms-channel | `[ ]` |
| 2.8 | SMS — Twilio Provider | learn.microsoft.com/…/configure-sms-channel-twilio | `[ ]` |
| 2.9 | SMS — Azure Communication Services | learn.microsoft.com/…/configure-sms-channel-acs | `[ ]` |
| 2.10 | Proactive SMS Outbound (Conversational) | learn.microsoft.com/…/configure-outbound-messaging | `[ ]` |
| 2.11 | WhatsApp (via Twilio) | learn.microsoft.com/…/configure-whatsapp-channel | `[ ]` |
| 2.12 | Facebook Messenger | learn.microsoft.com/…/configure-facebook-channel | `[ ]` |
| 2.13 | Instagram Direct Messages | learn.microsoft.com/…/configure-instagram-channel | `[ ]` |
| 2.14 | LINE | learn.microsoft.com/…/configure-line-channel | `[ ]` |
| 2.15 | WeChat | learn.microsoft.com/…/configure-wechat-channel | `[ ]` |
| 2.16 | Google Business Messages | learn.microsoft.com/…/configure-google-business-messages | `[ ]` |
| 2.17 | Apple Messages for Business | learn.microsoft.com/…/configure-apple-messages-for-business | `[ ]` |
| 2.18 | Microsoft Teams (Internal / Employee Support) | learn.microsoft.com/…/configure-teams-channel | `[ ]` |
| 2.19 | Custom Messaging Channel (Direct Line / Bring Your Own) | learn.microsoft.com/…/configure-custom-channel | `[ ]` |
| 2.20 | Attachment Handling Across Channels | learn.microsoft.com/…/file-attachments | `[ ]` |
| 2.21 | Rich Text / Card Messaging Support | learn.microsoft.com/…/card-support | `[ ]` |
| 2.22 | Real-Time Message Translation (Chat) | learn.microsoft.com/…/real-time-translation | `[ ]` |

---

### 01-C · Self-Service / AI-Powered Bots (`01-channels/self-service/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 3.1 | Copilot Studio Bot Integration — Overview | learn.microsoft.com/…/configure-bot-virtual-agent | `[ ]` |
| 3.2 | Customer Assist Agent (Voice + Digital) | [microsoft.com/…/ai-agents](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/04/27/dynamics-365-contact-center-ai-agents/) | `[ ]` |
| 3.3 | IVR via Copilot Studio (Voice Self-Service) | learn.microsoft.com/…/voice-channel-configure-ivr | `[ ]` |
| 3.4 | Bot-to-Agent Escalation (Context Transfer) | learn.microsoft.com/…/bot-to-agent-handoff | `[ ]` |
| 3.5 | Azure Bot Service Integration | learn.microsoft.com/…/configure-bot-azure | `[ ]` |
| 3.6 | Third-Party Bot Integration (Direct Line) | learn.microsoft.com/…/configure-third-party-bot | `[ ]` |
| 3.7 | Multimodal Support in Customer Intent Agent | learn.microsoft.com/…/multimodal-customer-intent | `[ ]` |
| 3.8 | Agent Deflection Analytics | learn.microsoft.com/…/bot-analytics | `[ ]` |

---

## 02 · ROUTING — Unified Routing (`02-routing/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 4.1 | Unified Routing — Overview & Architecture | [learn.microsoft.com/…/overview-unified-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/overview-unified-routing) | `[ ]` |
| 4.2 | Workstreams — Setup & Configuration | learn.microsoft.com/…/create-workstreams | `[ ]` |
| 4.3 | Queues — Setup & Management | [learn.microsoft.com/…/queues-omnichannel](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/queues-omnichannel) | `[ ]` |
| 4.4 | Work Classification — Rule-Based | [learn.microsoft.com/…/configure-work-classification](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-work-classification) | `[ ]` |
| 4.5 | Work Classification — ML-Based (Intelligent Skill Finder) | learn.microsoft.com/…/intelligent-routing | `[ ]` |
| 4.6 | Skill-Based Routing | [learn.microsoft.com/…/set-up-skill-based-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/set-up-skill-based-routing) | `[ ]` |
| 4.7 | Preferred Agent Routing | learn.microsoft.com/…/set-up-routing-to-preferred-agent | `[ ]` |
| 4.8 | Percent-Based Routing | learn.microsoft.com/…/percent-based-routing | `[ ]` |
| 4.9 | Assignment Methods — Highest Capacity | learn.microsoft.com/…/assignment-methods | `[ ]` |
| 4.10 | Assignment Methods — Round Robin | learn.microsoft.com/…/assignment-methods | `[ ]` |
| 4.11 | Assignment Methods — Advanced (Custom Rules) | learn.microsoft.com/…/configure-assignment-rules | `[ ]` |
| 4.12 | Capacity Profiles | learn.microsoft.com/…/capacity-profiles | `[ ]` |
| 4.13 | Presence & Availability Management | learn.microsoft.com/…/presence-custom-presence | `[ ]` |
| 4.14 | Priority-Based Routing | learn.microsoft.com/…/priority-routing | `[ ]` |
| 4.15 | Overflow Management | learn.microsoft.com/…/manage-overflow | `[ ]` |
| 4.16 | Route-to-Queue Rules | learn.microsoft.com/…/configure-route-to-queue-rules | `[ ]` |
| 4.17 | Record Routing (Cases, Activities) | [learn.microsoft.com/…/set-up-record-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/set-up-record-routing) | `[ ]` |
| 4.18 | Routing Diagnostics | [learn.microsoft.com/…/unified-routing-diagnostics](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/unified-routing-diagnostics) | `[ ]` |
| 4.19 | Routing Best Practices & Optimization | [learn.microsoft.com/…/unified-routing-best-practices](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/unified-routing-best-practices) | `[ ]` |

---

## 03 · AGENT EXPERIENCE (`03-agent-experience/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 5.1 | Agent Desktop — Copilot Service Workspace Overview | learn.microsoft.com/…/csw-overview | `[ ]` |
| 5.2 | Customer Summary / 360 View | learn.microsoft.com/…/oc-customer-summary | `[ ]` |
| 5.3 | Active Conversation Screen | learn.microsoft.com/…/oc-conversation-screen | `[ ]` |
| 5.4 | Communication Panel (Dialpad / Chat Interface) | learn.microsoft.com/…/communication-panel | `[ ]` |
| 5.5 | Session & Tab Management | learn.microsoft.com/…/session-tabs | `[ ]` |
| 5.6 | Multi-Session Handling | learn.microsoft.com/…/multisession | `[ ]` |
| 5.7 | Presence & Status Management (Agent) | learn.microsoft.com/…/set-presence-status | `[ ]` |
| 5.8 | Notifications (Toast & In-App) | learn.microsoft.com/…/notifications | `[ ]` |
| 5.9 | Internal Notes & Tags | learn.microsoft.com/…/oc-take-notes | `[ ]` |
| 5.10 | Wrap-Up (After Contact Work) | learn.microsoft.com/…/wrapup-notes | `[ ]` |
| 5.11 | Quick Replies (Predefined Messages) | learn.microsoft.com/…/create-quick-replies | `[ ]` |
| 5.12 | Knowledge Base Search & Article Surfacing | learn.microsoft.com/…/search-knowledge-articles | `[ ]` |
| 5.13 | Email Template Management | learn.microsoft.com/…/email-templates | `[ ]` |
| 5.14 | Consult with Expert (Teams Integration) | learn.microsoft.com/…/teams-expert-consult | `[ ]` |
| 5.15 | Internal Chat (Agent-to-Agent) | learn.microsoft.com/…/agent-internal-chat | `[ ]` |
| 5.16 | Case Management (Create, Link, Resolve) | learn.microsoft.com/…/case-management | `[ ]` |
| 5.17 | Timeline & Activity Feed | learn.microsoft.com/…/customer-timeline | `[ ]` |
| 5.18 | Customer Profile & History | learn.microsoft.com/…/customer-profile | `[ ]` |
| 5.19 | Screen Sharing (Co-Browse) | learn.microsoft.com/…/cobrowse | `[ ]` |
| 5.20 | Accessibility (Screen Reader, Keyboard Nav) | learn.microsoft.com/…/accessibility | `[ ]` |
| 5.21 | Conversation Diagnostics | learn.microsoft.com/…/conversation-diagnostics | `[ ]` |
| 5.22 | Customer-Facing Custom Chat Widget Branding | learn.microsoft.com/…/brand-widget | `[ ]` |

---

## 04 · SUPERVISOR EXPERIENCE (`04-supervisor-experience/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 6.1 | Omnichannel Ongoing Conversations Dashboard | learn.microsoft.com/…/ongoing-conversations-dashboard | `[ ]` |
| 6.2 | Real-Time Monitoring (Agents, Queues, Conversations) | [learn.microsoft.com/…/monitor-conversations](https://learn.microsoft.com/en-us/dynamics365/customer-service/use/monitor-conversations) | `[ ]` |
| 6.3 | Supervisor Assign / Transfer Conversation | learn.microsoft.com/…/assign-conversations | `[ ]` |
| 6.4 | Supervisor Monitor (Listen / Whisper / Barge) | learn.microsoft.com/…/supervisor-monitor | `[ ]` |
| 6.5 | Intraday Insights Dashboard | learn.microsoft.com/…/intraday-insights-dashboard | `[ ]` |
| 6.6 | Agent Status & Capacity View | learn.microsoft.com/…/agent-status | `[ ]` |
| 6.7 | Queue Health Metrics (Real-Time) | learn.microsoft.com/…/queue-health | `[ ]` |
| 6.8 | Sentiment-Triggered Alerts | learn.microsoft.com/…/sentiment-driven-alerts | `[ ]` |
| 6.9 | Service Operations Agent (AI) | [microsoft.com/…/ai-agents](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/04/27/dynamics-365-contact-center-ai-agents/) | `[ ]` |
| 6.10 | Supervisor Insights — Extensibility (Custom Metrics) | learn.microsoft.com/…/customize-supervisor-dashboard | `[ ]` |
| 6.11 | Availability Forecast vs. Actual (WFM Integration) | learn.microsoft.com/…/wfm-supervisor | `[ ]` |

---

## 05 · COPILOT & AI ASSISTANCE (`05-copilot-and-ai/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 7.1 | Copilot — Overview & Configuration | [learn.microsoft.com/…/configure-copilot-features](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-copilot-features) | `[ ]` |
| 7.2 | Ask a Question (Copilot Knowledge Search) | learn.microsoft.com/…/use-copilot-features | `[ ]` |
| 7.3 | Conversation Summary (Live) | learn.microsoft.com/…/copilot-conversation-summary | `[ ]` |
| 7.4 | Case Summary (Post-Conversation) | learn.microsoft.com/…/copilot-case-summary | `[ ]` |
| 7.5 | Write an Email (Copilot Draft) | learn.microsoft.com/…/use-copilot-email | `[ ]` |
| 7.6 | Chat Message Suggestions | learn.microsoft.com/…/copilot-chat-suggestions | `[ ]` |
| 7.7 | Real-Time Sentiment Analysis | learn.microsoft.com/…/enable-sentiment-analysis | `[ ]` |
| 7.8 | Sentiment Tracking & History | learn.microsoft.com/…/sentiment-analytics | `[ ]` |
| 7.9 | Live Transcription (Voice & Chat) | learn.microsoft.com/…/configure-transcription | `[ ]` |
| 7.10 | Real-Time Translation (Agent + Customer) | learn.microsoft.com/…/enable-real-time-translation | `[ ]` |
| 7.11 | AI-Suggested Similar Cases | learn.microsoft.com/…/suggest-cases | `[ ]` |
| 7.12 | AI-Suggested Knowledge Articles | learn.microsoft.com/…/suggest-knowledge | `[ ]` |
| 7.13 | Intelligent Skill Finder (ML Routing) | learn.microsoft.com/…/intelligent-skill-finder | `[ ]` |
| 7.14 | Copilot Audit & Governance | learn.microsoft.com/…/copilot-analytics | `[ ]` |
| 7.15 | Responsible AI Controls | learn.microsoft.com/…/responsible-ai-overview | `[ ]` |
| 7.16 | Quality Assurance Agent (AI Auto-Scoring) | [microsoft.com/…/ai-agents](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/04/27/dynamics-365-contact-center-ai-agents/) | `[ ]` |
| 7.17 | Generative AI Topics Discovery | learn.microsoft.com/…/topics-analytics | `[ ]` |

---

## 06 · AI AGENTS (AUTONOMOUS) (`06-ai-agents/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 8.1 | Customer Assist Agent — Overview | [microsoft.com/…/ai-agents](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2026/04/27/dynamics-365-contact-center-ai-agents/) | `[ ]` |
| 8.2 | Customer Assist Agent — Voice (Real-Time Low-Latency) | learn.microsoft.com/…/customer-assist-voice | `[ ]` |
| 8.3 | Customer Assist Agent — Digital Channels | learn.microsoft.com/…/customer-assist-digital | `[ ]` |
| 8.4 | Quality Assurance Agent | learn.microsoft.com/…/quality-assurance-agent | `[ ]` |
| 8.5 | Service Operations Agent | learn.microsoft.com/…/service-operations-agent | `[ ]` |
| 8.6 | Agent Orchestration & Copilot Control Plane | learn.microsoft.com/…/agent-orchestration | `[ ]` |
| 8.7 | Human-in-the-Loop Oversight & Escalation | learn.microsoft.com/…/human-in-the-loop | `[ ]` |
| 8.8 | Agentic Actions (CRM Read/Write) | learn.microsoft.com/…/agentic-actions | `[ ]` |

---

## 07 · WORKFORCE ENGAGEMENT MANAGEMENT (`07-workforce-engagement/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 9.1 | WFM — Overview & Licensing | [learn.microsoft.com/…/workforce-engagement-management](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/service/dynamics365-contact-center/workforce-engagement-management) | `[ ]` |
| 9.2 | Forecasting — Long-Term (6-Month, Daily) | [learn.microsoft.com/…/wfm-forecast-scenarios](https://learn.microsoft.com/en-us/dynamics365/contact-center/use/wfm-forecast-scenarios) | `[ ]` |
| 9.3 | Forecasting — Short-Term (6-Week, 15-Min Intervals) | learn.microsoft.com/…/wfm-forecast-scenarios | `[ ]` |
| 9.4 | Forecasting — External Data Import | learn.microsoft.com/…/import-forecast-data | `[ ]` |
| 9.5 | Channel & Queue Slice Forecasting | learn.microsoft.com/…/wfm-forecast-channels | `[ ]` |
| 9.6 | Schedule Generation & Management | learn.microsoft.com/…/wfm-schedule-management | `[ ]` |
| 9.7 | Schedule Adherence & Tracking | learn.microsoft.com/…/wfm-adherence | `[ ]` |
| 9.8 | Agent Self-Service Scheduling (Shift Swaps, Time Off) | learn.microsoft.com/…/agent-self-service | `[ ]` |
| 9.9 | Intraday Management (Real-Time Adherence) | learn.microsoft.com/…/wfm-intraday | `[ ]` |
| 9.10 | Quality Management — Conversation Scoring | learn.microsoft.com/…/wfm-quality-management | `[ ]` |
| 9.11 | Quality Management — Auto-Scoring (AI) | learn.microsoft.com/…/wfm-auto-scoring | `[ ]` |
| 9.12 | Agent Performance Feedback & Coaching | learn.microsoft.com/…/wfm-agent-feedback | `[ ]` |

---

## 08 · ANALYTICS & REPORTING (`08-analytics-and-reporting/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 10.1 | Omnichannel Historical Analytics — Overview | learn.microsoft.com/…/omnichannel-analytics-insights | `[ ]` |
| 10.2 | Summary Dashboard | learn.microsoft.com/…/summary-dashboard | `[ ]` |
| 10.3 | Conversation Intelligence Dashboard | learn.microsoft.com/…/conversation-intelligence | `[ ]` |
| 10.4 | Queue Report | learn.microsoft.com/…/queue-report | `[ ]` |
| 10.5 | Agent Report | learn.microsoft.com/…/agent-report | `[ ]` |
| 10.6 | Bot / Self-Service Analytics | learn.microsoft.com/…/bot-dashboard | `[ ]` |
| 10.7 | Voice Analytics Dashboard | learn.microsoft.com/…/voice-analytics | `[ ]` |
| 10.8 | Knowledge Article Analytics | learn.microsoft.com/…/knowledge-article-analytics | `[ ]` |
| 10.9 | Case Analytics | learn.microsoft.com/…/case-analytics | `[ ]` |
| 10.10 | Copilot Analytics (Adoption & Usage) | learn.microsoft.com/…/copilot-analytics | `[ ]` |
| 10.11 | Customer Sentiment Analytics | learn.microsoft.com/…/sentiment-analytics | `[ ]` |
| 10.12 | Topics Analytics (AI-Clustered) | learn.microsoft.com/…/topics-analytics | `[ ]` |
| 10.13 | Real-Time Analytics (Supervisor) | learn.microsoft.com/…/realtime-analytics | `[ ]` |
| 10.14 | Custom Dashboards & Extensibility | learn.microsoft.com/…/customize-reports | `[ ]` |
| 10.15 | Data Export to Azure Data Lake / Synapse | learn.microsoft.com/…/export-data-lake | `[ ]` |
| 10.16 | Power BI Embedded Analytics | learn.microsoft.com/…/powerbi-embedded | `[ ]` |
| 10.17 | SLA Management & KPI Tracking | learn.microsoft.com/…/sla-kpi | `[ ]` |

---

## 09 · ADMINISTRATION (`09-administration/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 11.1 | Copilot Service Admin Center — Overview | learn.microsoft.com/…/cc-admin-center | `[ ]` |
| 11.2 | System Requirements & Supported Browsers | learn.microsoft.com/…/system-requirements-contact-center | `[ ]` |
| 11.3 | Provisioning & Environment Setup | learn.microsoft.com/…/provision-channels | `[ ]` |
| 11.4 | Licensing & Subscription Management | learn.microsoft.com/…/licensing | `[ ]` |
| 11.5 | User & Role Management | learn.microsoft.com/…/user-roles | `[ ]` |
| 11.6 | Capacity Profiles Administration | learn.microsoft.com/…/capacity-profiles | `[ ]` |
| 11.7 | Operating Hours Configuration | learn.microsoft.com/…/set-up-operating-hours | `[ ]` |
| 11.8 | Holiday Configuration | learn.microsoft.com/…/set-up-holiday-schedule | `[ ]` |
| 11.9 | Locale & Language Settings | learn.microsoft.com/…/language-settings | `[ ]` |
| 11.10 | Email Configuration (Exchange / EWS) | learn.microsoft.com/…/configure-email | `[ ]` |
| 11.11 | Notifications Templates | learn.microsoft.com/…/notification-templates | `[ ]` |
| 11.12 | Session Templates | learn.microsoft.com/…/session-templates | `[ ]` |
| 11.13 | Application Tab Templates | learn.microsoft.com/…/application-tab-templates | `[ ]` |
| 11.14 | Geo-Redundancy & Failover | learn.microsoft.com/…/geo-redundancy | `[ ]` |
| 11.15 | Data Retention & Purge Policies | learn.microsoft.com/…/data-retention | `[ ]` |

---

## 10 · INTEGRATION & EXTENSIBILITY (`10-integration-and-extensibility/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 12.1 | CRM Connector Framework (Non-Dynamics CRMs) | learn.microsoft.com/…/crm-connectors | `[ ]` |
| 12.2 | Salesforce CRM Integration | learn.microsoft.com/…/salesforce-connector | `[ ]` |
| 12.3 | ServiceNow CRM Integration | learn.microsoft.com/…/servicenow-connector | `[ ]` |
| 12.4 | Microsoft Teams Collaboration (Consult/Escalate) | learn.microsoft.com/…/teams-collaboration | `[ ]` |
| 12.5 | Power Automate — Custom Workflows | learn.microsoft.com/…/power-automate-workflows | `[ ]` |
| 12.6 | Power Apps — Custom Apps & Embedded Experiences | learn.microsoft.com/…/power-apps-integration | `[ ]` |
| 12.7 | Channel Integration Framework (CIF) v1 | learn.microsoft.com/…/channel-integration-framework | `[ ]` |
| 12.8 | Channel Integration Framework (CIF) v2 | learn.microsoft.com/…/cif-v2-overview | `[ ]` |
| 12.9 | Copilot Studio — Deep Integration | learn.microsoft.com/…/configure-bot-virtual-agent | `[ ]` |
| 12.10 | Azure Event Grid — Real-Time Events | learn.microsoft.com/…/event-grid-integration | `[ ]` |
| 12.11 | APIs — Omnichannel REST API | learn.microsoft.com/…/omnichannel-api | `[ ]` |
| 12.12 | JavaScript SDK (Client-Side Widget Extensibility) | learn.microsoft.com/…/omnichannel-javascript-api | `[ ]` |
| 12.13 | Custom Messaging Channel (Direct Line API) | learn.microsoft.com/…/configure-custom-channel | `[ ]` |
| 12.14 | CTI (Computer Telephony Integration) — Third-Party | learn.microsoft.com/…/cti-integration | `[ ]` |
| 12.15 | Azure AI Services Integration (Speech, Language) | learn.microsoft.com/…/azure-ai-services | `[ ]` |
| 12.16 | Customer Voice (Survey Post-Interaction) | learn.microsoft.com/…/customer-voice-survey | `[ ]` |

---

## 11 · SECURITY & COMPLIANCE (`11-security-and-compliance/`)

| # | Feature | Doc Reference | Status |
|---|---------|---------------|--------|
| 13.1 | Role-Based Access Control (RBAC) | learn.microsoft.com/…/security-roles | `[ ]` |
| 13.2 | Agent Authentication & SSO | learn.microsoft.com/…/agent-sso | `[ ]` |
| 13.3 | Customer Identity Verification | learn.microsoft.com/…/customer-identity-verification | `[ ]` |
| 13.4 | Data Encryption (At Rest & In Transit) | learn.microsoft.com/…/data-encryption | `[ ]` |
| 13.5 | PCI-DSS Compliance (Payment Card Masking) | learn.microsoft.com/…/pci-compliance | `[ ]` |
| 13.6 | Transcript & Recording Data Residency | learn.microsoft.com/…/data-residency | `[ ]` |
| 13.7 | GDPR & Data Subject Request Support | learn.microsoft.com/…/gdpr | `[ ]` |
| 13.8 | Audit Log | learn.microsoft.com/…/audit-log | `[ ]` |
| 13.9 | Data Loss Prevention (DLP) Policies | learn.microsoft.com/…/dlp-policies | `[ ]` |
| 13.10 | Network Security & IP Allow-Listing | learn.microsoft.com/…/network-requirements | `[ ]` |
| 13.11 | Microsoft Trust Center / Compliance Manager | learn.microsoft.com/…/trust-center | `[ ]` |

---

## Summary: Audit Totals

| Category | Total Features | Status |
|----------|---------------|--------|
| 01-A Voice Channel | 24 | 0/24 done |
| 01-B Digital Messaging | 22 | 0/22 done |
| 01-C Self-Service / Bots | 8 | 0/8 done |
| 02 Unified Routing | 19 | 0/19 done |
| 03 Agent Experience | 22 | 0/22 done |
| 04 Supervisor Experience | 11 | 0/11 done |
| 05 Copilot & AI Assistance | 17 | 0/17 done |
| 06 AI Agents (Autonomous) | 8 | 0/8 done |
| 07 Workforce Engagement | 12 | 0/12 done |
| 08 Analytics & Reporting | 17 | 0/17 done |
| 09 Administration | 15 | 0/15 done |
| 10 Integration & Extensibility | 16 | 0/16 done |
| 11 Security & Compliance | 11 | 0/11 done |
| **TOTAL** | **202** | **0/202 done** |

---

## Recommended Documentation Order (Priority Sequence)

For a new D365 Contact Center implementation, document in this order to build the KB from the ground up:

1. **Administration** (09) — Provisioning and setup are prerequisites for everything else
2. **Unified Routing** (02) — Core architecture decision point; affects all channels
3. **Voice Channel** (01-A) — Highest implementation complexity, most client-specific
4. **Digital Messaging** (01-B) — Rapidly expanding channel matrix
5. **Agent Experience** (03) — Daily-use features; highest training value
6. **Copilot & AI** (05) — High client interest; key differentiator
7. **AI Agents** (06) — Emerging; valuable for project scope conversations
8. **Supervisor Experience** (04) — Operational management layer
9. **Analytics & Reporting** (08) — Required for go-live sign-off
10. **Self-Service / Bots** (01-C) — Copilot Studio dependency
11. **Workforce Engagement** (07) — Often a separate workstream
12. **Integration & Extensibility** (10) — Project-specific
13. **Security & Compliance** (11) — Often client-led with IT/security team

---

_Last updated: 2026-04-30 | Next review: on each Microsoft release wave announcement_
_Sources: [learn.microsoft.com/dynamics365/contact-center](https://learn.microsoft.com/en-us/dynamics365/contact-center/) | [Release Plan 2026 W1](https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/) | [Release Plan 2025 W2](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/) | [Release Plan 2025 W1](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/service/dynamics365-contact-center/)_
