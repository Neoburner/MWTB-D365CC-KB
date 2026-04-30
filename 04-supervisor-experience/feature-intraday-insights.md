# Intraday Insights Dashboard

**Category:** Supervisor Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/intraday-insights-dashboard

## What it does
Real-time operational dashboard for supervisors to monitor queue health, agent performance, and customer satisfaction on the same day without waiting for end-of-day reports. Displays queue volume, average handle time, agent availability, SLA breach rates, CSAT scores, and conversation status. Data refreshes every few minutes.

## Key facts
- Data refreshes every 5–10 minutes (not true real-time, but close enough for tactical decisions)
- KPIs included: queue length, average queue wait, average handle time (AHT), agent availability state distribution, SLA breach count/percentage, CSAT score, conversation completion rate
- Supports filtering by queue, agent group, channel, or time period (today, last 4 hours, last hour) to drill down on bottlenecks
- Agent-level and queue-level views; supervisors can pivot between team and individual performance
- Differs from Real-Time Analytics (enterprise reporting tool) in scope and refresh rate; Intraday is operational, Real-Time Analytics is strategic
- Accessible from the supervisor dashboard; no additional licensing required beyond Contact Center license
- Supports exporting snapshots for shift handoff or escalation documentation

## When to use / skip
Use during live operations to spot staffing gaps, detect SLA breaches, monitor CSAT trends, and make intraday adjustments. Check it several times per shift (start, mid-shift, end). Skip if you've got a small team (<20 agents) or stable demand with minimal intraday swings. Don't use it for compliance reporting or exec presentations — use Real-Time Analytics for that.

## Configuration decisions
- **Dashboard refresh frequency:** Accept default 5–10 minutes or adjust based on operational tempo (faster refresh = more server load)
- **KPI thresholds and alerts:** Configure threshold values for SLA warning (e.g., 80% breach rate triggers alert), CSAT warning (e.g., <4.0 score), queue depth alert (e.g., >10 waiting)
- **Visible metrics by role:** Decide what supervisors see (full dashboard) vs. team leads (their team only) vs. quality analysts (CSAT/SLA only)
- **Queue/channel grouping:** Pre-define queue hierarchies so supervisors can toggle between aggregated and granular views without custom queries
- **Intraday staffing model:** Document expected load patterns by hour (peak hours, lunch coverage) to inform supervisor decision-making
- **Alert routing:** Configure if/how low CSAT or SLA breach alerts notify supervisors (dashboard notification, email, SMS)

## Gotchas
- **It's a snapshot, not analysis.** A spike in queue length could be staffing, outage, or demand — you still need to diagnose.
- **Data is 5–10 minutes stale.** Decisions based on "current" numbers are already behind by the refresh lag.
- **CSAT skew.** Only completed surveys count; incomplete ones are excluded, which pushes the score up artificially.
- **SLA rates improve late shift.** If the SLA target is 24 hours and it's 11pm, fewer conversations can breach today anyway.
- **Queue depth ≠ understaffing.** Could be longer AHT, system delays, or complexity shifts.
- **Aggregation hides imbalance.** An "80% service level" across a queue might hide one agent handling all the complex calls while others sit idle on simple ones.

---

*Source last updated: 2026-04-30 | Worth revisiting when staffing model changes, SLA or CSAT baselines are updated, or supervisors give feedback on metric usefulness*
