# WFM Schedule Adherence & Tracking

**Category:** Workforce Management / Compliance
**Applies To:** Standalone / Embedded (via WFM module)
**Source:** [Real-Time Adherence in WFM - Microsoft Learn](https://learn.microsoft.com/en-us/dynamics365/contact-center/use/wfm-realtime-adherence)

## What it does
WFM Schedule Adherence compares agent presence status and activity (Available, In Call, On Break, etc.) against their published schedule in real time. Supervisors see who's following schedule, who's drifting, and by how much. Tracks intraday adherence and calculates a score for reporting and reviews.

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
Use adherence tracking if you have compliance rules (financial, healthcare) or tight SLA targets that depend on staff being there. Essential for operations where 15 agents in queue vs 14 means missing SLA. Skip if the contact centre is small, low-volume, or flexible-shift and on-time attendance doesn't matter much.

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
- **Presence sync lag:** Agent status from Teams, Slack, or phone can take 1-5 minutes to reflect. Adherence calculations use last-known status, not live state.
- **Scheduled breaks are logged, not enforced:** If an agent skips their break, it shows as out-of-adherence, but the system won't force them to take it.
- **Reason codes can be backdated:** Supervisors tag reasons after the fact (agent calls in sick 2 hours into shift). This skews historical data.
- **Exceptions need manual override:** Fire alarm, facility closure, emergency training — all need supervisor intervention. No auto-detection.
- **Adherence doesn't factor in customer impact:** Agent stays past shift-end to finish a call, marked out-of-adherence, even though it's the right move.
- **Reports lag real-time:** Analytics dashboard is 15-30 min behind. Real-time view is current but less detail.
- **Partial-day schedules trip people up:** Agent with 10 AM-6 PM shift clocks in at 9:50 AM. System shows poor adherence until 10 AM.
- **No ML for scheduling suggestions:** Adherence data is tracked, not used to auto-suggest better shifts. Manual review only.

---

*Source last updated: 2026-04-30 | Check this if: Adherence rates drop, compliance audit flags it, or absence codes need updating*
