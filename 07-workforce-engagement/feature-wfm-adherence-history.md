# WFM Adherence History

**Category:** Workforce Engagement
**Applies To:** Standalone
**Source:** [learn.microsoft.com — Analyze adherence history to optimize workforce planning](https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/analyze-adherence-history-optimize-workforce-planning)

## What it does
Historical analytics dashboard for schedule adherence — shows adherence trends over time per rep and per team, with a metrics summary and activity-level breakdown. Sits alongside the real-time adherence tracking in the WFM module and gives supervisors the historical view they need for scheduling reviews and performance discussions.

## Key facts
- **Trend chart**: visualise adherence patterns for individual reps or the full team across a date range
- **Metrics dashboard**: adherence percentage, total scheduled time, time spent out of adherence
- **Activity summary view**: per-rep activity records with precise durations for granular analysis
- Location in the product: Copilot Service workspace → Workforce Management → Adherence Historical Analytics
- GA: May 2026 (2026 Wave 1) — no public preview phase
- Requires the WFM module to be installed and schedule adherence tracking to be active
- Standalone only — WFM is not available in embedded deployments

## When to use / skip
If the client is using WFM and has real-time adherence enabled, this is a natural addition — it gives supervisors the retrospective view to go with the live view. Use it if the client has any scheduled workforce reviews, QA processes, or regulatory requirements around attendance. Skip if WFM isn't in scope, or if the client doesn't have a formal schedule adherence policy (it will generate data no one acts on).

## Configuration decisions
- No specific configuration required beyond enabling WFM and schedule adherence tracking — the report is included in the WFM module
- Confirm the date range and aggregation level the client wants to use for workforce reviews before training supervisors
- Decide whether to surface this report in the supervisor dashboard or leave it in the WFM site map entry — depends on how frequently supervisors are expected to use it

## Gotchas
- The report requires historical adherence data to be meaningful. If adherence tracking was only just enabled, supervisors will be looking at sparse or empty charts for the first few weeks. Set expectations before go-live.
- Adherence percentage accuracy depends on schedules being published correctly in WFM. If the client's schedule management process is inconsistent (late publications, gaps in coverage), the adherence data will look worse than actual performance. Fix the scheduling process first.
- The activity summary view is granular enough to be used in individual performance conversations. Confirm with HR how this data will be used before rolling it out — some clients have information governance or union agreements that affect how adherence data can be referenced in formal reviews.

## Consultant notes

- Adherence history is often the feature that justifies the WFM investment to operations managers who were sceptical. The trend chart showing team adherence over a quarter is a concrete deliverable for workforce reviews. Flag this in the business case conversation if WFM adoption is in doubt.
- The gap between real-time adherence (which supervisors watch daily) and historical analytics (which are reviewed weekly or monthly) means these are used by different people for different purposes. Don't assume the supervisor who uses real-time tracking will be the same person running historical reports. Train each audience separately.
- If the client runs regular 1:1s between supervisors and agents, check whether they plan to use the activity summary view in those meetings. The data is accurate but needs context — a rep who was out of adherence for 20 minutes may have been on an escalated call. Build that nuance into the supervisor training so the report doesn't become a gotcha tool.
- The report is in the WFM site map, not the supervisor dashboard. Supervisors who don't navigate to the WFM section regularly will miss it. If it's a priority metric, surface it as a tile or link in the supervisor workspace during configuration.

---

*Check this after the 2026 Wave 2 release — WFM analytics tend to get expanded in successive waves*
