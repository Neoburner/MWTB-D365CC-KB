# Omnichannel Historical Analytics

**Category:** Analytics and Reporting
**Applies To:** Standalone only
**Source:** [learn.microsoft.com/.../oc-historical-analytics-reports](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/oc-historical-analytics-reports)

## What it does
Conversation-level analytics across all channels: Summary, Conversation, Queue, Agent, Voice, Voicemail, Bot, and (standalone-only) Proactive Outbound and Bot-Intent dashboards. AI-discovered topic clustering groups conversations automatically. Each add-on dashboard requires a separate enable checkbox.

## Key facts
- **Standalone only** — not available in Contact Center embedded
- **Base toggle must be on before any add-on reports appear**
- Metrics are available **24 hours after first enable** — not immediately
- Add-on reports (Voice, Voicemail, Bot, Advanced Bot, Proactive Outbound, Intent) each have separate checkboxes
- **Bot analytics add-on required** to separate bot-handled from human-handled conversations; without it, the Bot dashboard shows all agents aggregated
- **Advanced bot analytics:** up to 15 custom Copilot Studio variables for structured reporting (line of business, product, etc.) — requires variables to be configured in Copilot Studio first
- Default access: System Administrator, Omnichannel Administrator, Omnichannel Supervisor, CSR Manager
- Custom role access requires Read privilege on specific Dataverse entities per dashboard (see table below)
- **Report bookmark permissions** (`Report Bookmark` entity Create/Read/Write/Delete) must be granted separately if supervisors need to save filtered views
- Proactive Outbound and Bot-Intent dashboards: Contact Center standalone only

**Entity reference for custom role access:**

| Dashboard | Entity |
|-----------|--------|
| Omnichannel historical | `msdyn_dataanalyticsreport_oc` |
| Real-time analytics | `msdyn_dataanalyticsreport_oc_rt` |
| Record routing real-time | `msdyn_dataanalyticsreport_ur_recordrouting_rt` |
| CS historical | `msdyn_dataanalyticsreport_csrmanager` |
| Copilot analytics | `msdyn_dataanalyticsreport_copilot` |
| Knowledge analytics | `msdyn_dataanalyticsreport_ksinsights` |

## When to use / skip
Enable on every standalone deployment. This is the primary analytics surface for conversation/channel performance. Pairs with CS historical analytics (case performance). Enable all relevant add-ons based on channels in scope.

## Configuration decisions
- **Bot analytics add-on** — enable for any deployment with a Copilot agent; required for meaningful bot containment measurement
- **Advanced bot analytics custom variables** — if the client needs to slice bot performance by product/region/segment, scope this as a Copilot Studio development task; 15-variable limit
- **Which users need analytics access** — security role configuration required for non-default roles; don't forget bookmark entity permissions

## Gotchas
- **24-hour delay is commonly unexpected.** Enable during UAT, not at go-live, or the first day of production data won't exist.
- **Base toggle required before add-ons appear.** Enable it first, then configure add-ons.
- **Report bookmark permissions are easy to forget.** Supervisors who save filtered dashboard views need explicit Create/Read/Write/Delete on the Report Bookmark entity — this is not included in the standard Read access grant.
- **Bot analytics without the add-on gives a misleading picture.** The Bot dashboard without the add-on aggregates bot + human agents together. Always enable the bot add-on for any Copilot agent deployment.

---

*Source last updated: 2026-01-23 | Review when: New historical analytics dashboards added, or Proactive Outbound/Bot-Intent expand to Customer Service*
