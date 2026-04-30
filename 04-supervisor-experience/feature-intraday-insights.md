# Intraday Insights Dashboard

**Category:** Supervisor Experience
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/intraday-insights-dashboard

## What it does
Intraday Insights is a real-time operational dashboard designed for supervisors to monitor queue health, agent performance, and customer satisfaction metrics *on the same day*, without waiting for end-of-day reports. It displays current queue volume, average handle time, agent availability, service level agreement (SLA) breach rates, customer satisfaction (CSAT) scores, and conversation status breakdowns. Data refreshes every few minutes, providing near-real-time visibility into contact center operations.

## Key facts
- Data refreshes every 5–10 minutes (not true real-time, but close enough for tactical decisions)
- KPIs included: queue length, average queue wait, average handle time (AHT), agent availability state distribution, SLA breach count/percentage, CSAT score, conversation completion rate
- Supports filtering by queue, agent group, channel, or time period (today, last 4 hours, last hour) to drill down on bottlenecks
- Agent-level and queue-level views; supervisors can pivot between team and individual performance
- Differs from Real-Time Analytics (enterprise reporting tool) in scope and refresh rate; Intraday is operational, Real-Time Analytics is strategic
- Accessible from the supervisor dashboard; no additional licensing required beyond Contact Center license
- Supports exporting snapshots for shift handoff or escalation documentation

## When to use / skip
Use Intraday Insights during live operations to identify staffing gaps, detect SLA breaches in real time, monitor customer satisfaction trends, and make intraday staffing adjustments. Supervisors should check it multiple times per shift (at least at shift start, mid-shift, and end). Skip it if your contact center is very small (<20 agents) or has minimal intraday fluctuation; the operational value diminishes with stable staffing. Do not use it for compliance reporting or executive presentations (use Real-Time Analytics or formal reports instead).

## Configuration decisions
- **Dashboard refresh frequency:** Accept default 5–10 minutes or adjust based on operational tempo (faster refresh = more server load)
- **KPI thresholds and alerts:** Configure threshold values for SLA warning (e.g., 80% breach rate triggers alert), CSAT warning (e.g., <4.0 score), queue depth alert (e.g., >10 waiting)
- **Visible metrics by role:** Decide what supervisors see (full dashboard) vs. team leads (their team only) vs. quality analysts (CSAT/SLA only)
- **Queue/channel grouping:** Pre-define queue hierarchies so supervisors can toggle between aggregated and granular views without custom queries
- **Intraday staffing model:** Document expected load patterns by hour (peak hours, lunch coverage) to inform supervisor decision-making
- **Alert routing:** Configure if/how low CSAT or SLA breach alerts notify supervisors (dashboard notification, email, SMS)

## Gotchas
- Intraday Insights is *operational snapshot*, not causal analysis; a spike in queue length may be due to staffing, system outage, or demand surge—diagnostics are still needed
- The refresh lag (5–10 minutes) means decisions based on "current" data are already stale by 5–10 minutes; supervisors must account for pipeline delay
- CSAT data in Intraday reflects only surveys *completed* during the reporting window; incomplete surveys are excluded, skewing the score upward
- SLA breach rates may appear to improve late in the shift due to shorter target windows (e.g., if SLA target is 24 hours and it's 11pm, fewer conversations will breach today)
- High queue lengths don't always mean understaffing; root cause could be longer AHT, system delays, or complexity shifts
- Metrics are aggregated; a supervisor seeing "80% service level" across a queue may not spot that one agent is handling all complex calls while others idle on simple calls

---

*Source last updated: 2026-04-30 | Review when: Staffing model changes, SLA or CSAT baseline updates, or supervisor feedback on metric relevance*
