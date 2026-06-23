# Real-Time Streaming Analytics

> **Status:** Public Preview — behaviour may change.

**Category:** Analytics & Reporting
**Applies To:** Standalone (Contact Center only — not Customer Service)
**Source:** [learn.microsoft.com/.../use/realtime-streaming](https://learn.microsoft.com/en-us/dynamics365/contact-center/use/realtime-streaming)

## What it does
An event-driven supervisor analytics experience that pushes live metric updates instead of refreshing whole dashboards on a timer. Supervisors monitor queue backlog, representative presence, service level, abandon rate and conversation load as they change, and act from the same screen. It runs in a separate preview supervisor portal, not the Copilot Service workspace.

## Key facts
- This is a **production-ready preview** — usable in production but still subject to supplemental preview terms and change.
- **Contact Center only.** Not available in Omnichannel for Customer Service.
- Accessed at a **separate region-specific URL**: `portal.<region>.contactcenterai.powerplatform.com/experience/supervisor` (distinct FRE/first-release and PROD endpoints per region). It is *not* the existing real-time analytics reports inside Copilot Service workspace.
- Requires the **Omnichannel Supervisor** role to view and act.
- Five views: **Wallboard** (consolidated live metric cards), **Conversations** (ongoing/queued/closed with bulk actions), **Queues** (queue-level health by business unit), **Representatives** (per-rep activity and actions), and **Assisted Service** (drill-down trend analysis).
- **Live metrics ignore the Period filter** — only aggregated metrics respond to time filters. Channel and queue filters apply to both.
- Trend indicators update every **5 minutes** and show the change since the previous interval.
- Service level is measured against a **20-second** threshold and excludes virtual-agent-answered conversations.
- Metrics carry configurable **Normal / At risk / Critical** thresholds that drive the trend colour coding.
- Bulk conversation actions: **Assign**, **Transfer**, **Force close**. Representative actions: update queue membership, update/reset presence, modify skills and capacity profiles.

## When to use / skip
Turn it on if you have supervisors who need to react inside the interval rather than wait for a scheduled dashboard refresh — busy voice or messaging queues where seconds of backlog matter. Skip it for now if your supervisors are happy with the existing real-time reports and you'd rather not put a preview experience in front of them, or if you're embedded-only (this is standalone CC).

## Configuration decisions
- Whether to expose the preview portal to supervisors now or wait for GA — it's a parallel experience, not a replacement for the existing reports yet.
- Which region/environment URL each supervisor group uses (FRE vs PROD, and the correct geography).
- Threshold values (Normal/At risk/Critical) per metric so the colour coding and "critical/at risk" flags actually mean something for your operation.
- Whether the bulk actions and presence-reset capability fit your supervisor operating model and RBAC.

## Gotchas
- There are now **two real-time analytics experiences** and they live in different places. This streaming one is at the `contactcenterai.powerplatform.com/experience/supervisor` portal; the older reports are in Copilot Service workspace (see `feature-realtime-analytics.md`). Supervisors will land on the wrong one if you're not explicit about which URL to bookmark.
- The **URL is region- and environment-specific**. Hand a supervisor the wrong region or the FRE link for a PROD environment and they'll see nothing or the wrong data.
- The **Period filter doesn't touch live metrics**. Supervisors changing the period and expecting the live cards to move will think it's broken — it isn't.
- Standard monitoring-consent and "not for employment decisions" obligations apply, same as other agent-analytics features. If you operate in a jurisdiction that requires notifying or getting consent from reps and customers about monitoring/recording, that's on the customer to handle before switching it on.

## Consultant notes

- The biggest source of confusion on projects right now is the two-dashboards problem. Decide up front whether you're piloting the streaming experience or sticking with the existing reports, document the URL, and don't half-roll-it-out — supervisors comparing numbers across two tools that calculate slightly differently will generate noise tickets.
- It's a preview, so don't scope it as the committed real-time solution in a SOW. Pilot it with one supervisor group, confirm the regional URL and role access work, and keep the existing reports as the fallback until it goes GA.
- The threshold configuration is what makes the wallboard useful — an out-of-the-box wallboard with no tuned thresholds is just numbers. Budget time with the ops team to set Normal/At risk/Critical bands that match their SLAs, or the colour coding gets ignored.

---

*Public preview as of June 2026. Revisit when it reaches GA — the access URL, role model and feature scope may all change.*
