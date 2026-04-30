# WFM Schedule Adherence & Tracking

**Category:** Workforce Management / Compliance
**Applies To:** Standalone / Embedded (via WFM module)
**Source:** [Real-Time Adherence in WFM - Microsoft Learn](https://learn.microsoft.com/en-us/dynamics365/contact-center/use/wfm-realtime-adherence)

## What it does
WFM Schedule Adherence compares an agent's current Dynamics 365 presence status and activity (Available, In Call, On Break, etc.) against their published schedule in real time. Supervisors see which agents are following their schedule, which are out of adherence, and by how much. The system tracks both intraday adherence and calculates an adherence score for reporting and performance reviews.

## Key facts
- Real-time comparison of scheduled vs. actual agent status every 1–5 minutes (depending on sync frequency)
- Adherence metrics: On-time arrivals, off-shift absences, break adherence (length and timing), absence without notice
- Adherence score formula: (Time Adherent / Total Scheduled Time) × 100; typically 95%+ is acceptable
- Non-adherence reasons can be tagged (lunch, technical issue, approved training, etc.) for context
- Visible in Intraday Management dashboard and real-time supervisor workspaces
- Adherence data feeds into agent performance scorecards and compliance reports
- Absence reason codes (Sick, Personal, Emergency, Training) auto-logged for audit and HR integration
- No real-time alert for minor deviations; supervisors must monitor dashboard or configure custom alerts
- Historical adherence data retained for 12+ months (default) for trend analysis and coaching
- Does not track "time off" requests or vacation days separately (those are handled by scheduling logic)

## When to use / skip
**Use adherence tracking** when you have regulatory compliance requirements (e.g., financial services, healthcare) or SLA commitments that depend on staff availability. It's also essential if you're running a service level-driven operation where 15 agents in a queue can mean the difference between a met or missed SLA. **Skip it** if your contact center is small, low-volume, or has flexible shift patterns where on-time arrivals and break adherence are not critical to operations.

## Configuration decisions
- **Adherence threshold**: Set the percentage (e.g., 95%, 90%) that defines compliance vs. out-of-adherence
- **Absence reason codes**: Define the categories supervisors can tag (Sick, Personal, Emergency, Approved Training, etc.)
- **Adherence calculation method**: Include or exclude scheduled breaks, lunch, wrap-up time
- **Real-time sync frequency**: 1-minute, 5-minute, or 15-minute checks (faster = higher system load)
- **Non-adherence alert rules**: Trigger alerts when an agent drifts >5 min off schedule, or only >15 min
- **Supervisor escalation policy**: At what adherence threshold does the system flag for management review?
- **Data retention and archival**: Default is 12 months; adjust based on compliance and storage needs
- **Absence approval workflow**: Require supervisor pre-approval for unpaid absences, or log retroactively?
- **Shift start/end tolerance**: Allow a 5–10 min grace period for clock-in/clock-out or enforce strict times

## Gotchas
- Presence sync lag: Agent status changes in Teams, Slack, or phone system may take 1–5 minutes to reflect in Contact Center; adherence calculations based on last-known status, not real-time truth
- Scheduled breaks not enforced: If an agent doesn't take their scheduled break, WFM logs it as out-of-adherence, but doesn't force compliance
- Absence reason backdating: Supervisors can tag reasons after the fact (e.g., agent calls in sick 2 hours into shift), which can distort historical adherence data
- System override needed for exceptions: Legitimate absences (fire alarm, facility closure, emergency training) require manual supervisor intervention to adjust adherence; no automatic detection
- Adherence calculation does not account for customer wait time: An agent who stays past shift-end to finish a call is marked out-of-adherence, even if it improves customer experience
- Report lag: Adherence reports in the Analytics dashboard refresh on 15–30 min delay; real-time dashboard is more current but with less drill-down detail
- Partial-day schedules cause confusion: If an agent has a 10 AM–6 PM shift but clocks in at 9:50 AM and is marked "Available" before 10 AM, the system may show adherence as poor until 10 AM
- No machine learning for scheduling adjustments: Adherence data is tracked but not automatically used to suggest better shift times; supervisors must manually review trends

---

*Source last updated: 2026-04-30 | Review when: Agent adherence rate drops below organizational target, Intraday Adherence is flagged for compliance audit, or if absence codes need expansion*
