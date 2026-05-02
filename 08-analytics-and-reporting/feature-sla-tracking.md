# SLA Management & KPI Tracking

**Category:** Analytics & Reporting
**Applies To:** Both (Customer Service Enterprise licence for full SLA entity support)
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/define-service-level-agreements

## What it does
Service Level Agreements (SLAs) in D365 define the response time and resolution time commitments that apply to cases, and can be extended to conversation-level metrics. D365 tracks SLA compliance in real time — warning and failure timers count down on case records, and SLA KPIs (first response time, resolution time, percentage compliant) are reported in the analytics dashboards. SLA records create an auditable trail of whether service commitments were met or breached.

## Key facts
- D365 SLA entity applies to the Case (incident) entity — SLA timers are case-level metrics; conversation-level SLAs (answer time, abandon rate) are tracked in Real-Time Analytics as operational KPIs, not as formal SLA entities
- SLA types: Standard (calendar-based) and Enhanced (supports pause/resume on customer waiting status, holidays, operating hours)
- SLA KPI actions: First Response By (time to first agent contact), Resolve By (case resolution deadline)
- SLA status indicators appear on case records: In Progress (compliant), Nearing Noncompliance (warning), Noncompliance (breached)
- Operating hours and holiday schedules are applied to SLA calculations — if the SLA is 4 business hours for first response, the timer only runs during business hours
- SLA breach notifications can trigger Power Automate flows — e.g., escalate to supervisor, send email alert, create a follow-up task
- Enhanced SLAs can be paused (e.g., waiting for customer information) and resumed — timer does not run during customer-waiting status
- Queue-level response time (conversation answer time) is tracked operationally in the Real-Time and Historical Analytics dashboards as a KPI, but this is separate from the Case SLA entity

## When to use / skip
Use formal SLA configuration for any deployment where case resolution times are contractually or regulatorily committed — enterprise customer support contracts, ITIL-based service desks, regulated service commitments (financial complaints deadlines, consumer protection response times). Also use for any deployment where SLA compliance reporting is required for management review.

For contact centres that track only conversation-level speed metrics (answer time, first response rate) without formal case tracking, the operational dashboards provide those KPIs without needing the SLA entity configured.

## Configuration decisions
- Define SLA tiers based on customer segment or case priority — a gold customer gets 2-hour first response, standard gets 8-hour
- Choose Standard vs Enhanced SLA: Enhanced is recommended for most deployments as it handles operating hours correctly and supports pause/resume; Standard is simpler but less flexible
- Link operating hours and holiday schedules to the SLA — without this, a case created on Friday evening has a 24-hour first response timer that doesn't account for the weekend
- Configure warning thresholds — at what percentage of the timer elapsed should the warning state activate? 75% is common; adjust based on how much lead time agents need to avoid a breach
- Set up Power Automate escalation flows for SLA warnings and breaches — supervisor notification, case re-assignment, or customer communication as appropriate
- Add SLA KPI fields to the case form so agents can see the deadline directly on the record — making the timer visible is the primary mechanism for preventing breaches

## Gotchas
- SLA timers are case-level, not conversation-level. A customer who calls three times about the same case does not restart the SLA timer on the third call — the original case SLA timer is running continuously. Agents need to understand that the SLA timer is on the case, not reset by each contact.
- Enhanced SLA pause requires the case status to be set to a "waiting" state — the pause doesn't happen automatically when an agent is waiting for customer information; the agent must update the case status. Train agents on this; unpause-forgotten cases breach SLAs silently.
- Operating hours must be linked to the SLA, not just configured — having operating hours set up in the system doesn't automatically apply them to SLA calculations unless explicitly associated with the SLA entity.
- Multiple SLAs can apply to the same case if misconfigured. A case can accidentally match two SLA entities if the applicability conditions overlap — this creates duplicate timers and confusing case form displays. Test SLA applicability logic carefully against real case scenarios.
- SLA data in the standard Case analytics reports shows breach rates and resolution times but doesn't always surface why cases breached. For root cause analysis of SLA failures, a custom Power BI report segmented by queue, agent, case type, and time of creation is more useful.

## Consultant notes

- The "conversation-level vs case-level SLA" distinction is worth explaining explicitly in the design phase. Clients who come from queue-based systems (Avaya, Genesys) think of SLA as "% of calls answered within X seconds." That's an operational queue KPI in D365, not an SLA entity. The D365 SLA entity is for case resolution commitments, which is a different measurement entirely. Aligning vocabulary early prevents scope confusion.
- SLA breach Power Automate flows should be designed and tested before go-live, not added post-launch. The most useful flow is a supervisor notification when a case hits the warning threshold — this allows intervention before the breach. A notification that fires after breach is informative but too late to be preventive.
- Enhanced SLA pause/resume is operationally important but agents routinely forget to use it. If a case is legitimately waiting for customer action, the SLA timer should be paused — but this requires the agent to change the case status. Include this in agent training and in the case management workflow. Organisations with regulated response time requirements (FCA complaint handling, for example) have compliance exposure if SLA timers run while the case is actually waiting for the customer to respond.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds conversation-level SLA entity support or changes the Enhanced SLA pause mechanism*
