# WFM Intraday Management

**Category:** Workforce Management / Real-Time Operations
**Applies To:** Standalone / Embedded (via WFM module)
**Source:** [Intraday Management in WFM - Microsoft Learn](https://learn.microsoft.com/en-us/dynamics365/contact-center/use/wfm-intraday-management)

## What it does
Intraday Management is the real-time operational view within Workforce Management that compares actual agent staffing levels against the forecast for the current day. It enables supervisors to make same-day adjustments—bring in additional agents, reassign staff to busier queues, approve emergency time off, or extend shifts—to match staffing to incoming demand. This prevents understaffing situations before they impact service level.

## Key facts
- Compares Current Staffing (number of agents scheduled and actively available) vs. Forecast (demand prediction)
- Displays workforce gap in real time: red if understaffed, green if overstaffed, yellow if balanced
- Shows headcount by queue and skill group, not by individual agent (privacy and operational focus)
- Metrics displayed: Available agents, In-Call agents, After-Call-Work agents, Break agents, Total scheduled
- Forecast refreshes every 15–30 minutes based on inbound contact volume and average handling time
- Allows same-day actions: Request volunteers for overtime, approve unplanned break extensions, reassign idle agents to another queue
- Different from Intraday Insights (supervisor dashboard): Intraday Management is for proactive staffing adjustments; Insights is for monitoring and KPI tracking
- Requires supervisor or workforce manager role; agents cannot access
- Shift swap or add-hoc hour requests can be submitted, but require approval workflow
- Historical intraday decisions logged for audit and retrospective analysis (e.g., "How did we handle that spike on 4/28?")

## When to use / skip
**Use Intraday Management** if you operate a high-variability contact center (e.g., customer support, sales, emergency lines) where demand swings 50%+ within a single day. It's critical if your service level SLAs are tight (e.g., 80% of calls answered in 20 seconds). **Skip it** if you have steady-state volume, low-variance demand, or a small team where manual oversight is sufficient—the overhead of constant monitoring and adjustment doesn't pay off.

## Configuration decisions
- **Forecast data source**: Use Contact Center analytics, import from external forecasting tool, or manual input (e.g., "busy day, expect +20% calls")
- **Forecast refresh frequency**: Every 15 minutes (responsive) or 30 minutes (stable, lower overhead)
- **Staffing threshold alerts**: Define trigger points—alert supervisor if understaffed by 5+ agents, or overstaffed by 10+
- **Flexible staffing policy**: Can supervisors on-the-fly extend shifts? Can agents request unplanned breaks? What's the approval workflow?
- **Queue/skill group prioritization**: If short-staffed, which queue gets priority for reassignments (e.g., VIP customers first)
- **Overtime rules and rates**: Define hour caps (max 2 hours OT per day), required notice (1-hour advance notice to volunteer), and associated costs
- **Break extension limits**: How many extra 15-min breaks can an agent take in a day before escalation to manager?
- **Scheduled vs. ad-hoc adjustments**: Log both, but separately—distinguish planned staffing from emergency fixes

## Gotchas
- Forecast can be wrong: Unexpected inbound spikes (viral news, competitor outage, promotional surge) may not be predicted; supervisors must manually adjust forecast in real time
- Agent availability lag: If an agent goes on unscheduled break or gets disconnected, it may take 1–3 minutes for the system to reflect the availability change; forecast vs. actual may seem out of sync
- No predictive alerting: The system shows current gap but doesn't warn "you will be understaffed in 30 minutes if you don't act now"; requires supervisor proactivity
- Overstaffing is often ignored: Supervisors focus on understaffing alerts and may miss overstaffing—wasted labor cost (though some buffers are intentional for resilience)
- Limited downstream visibility: Intraday decisions (e.g., "extended break for agent X") are logged but not communicated back to scheduling system, so next-day schedules may ignore today's adjustments
- Skill-group reassignments may not be automatic: If you move an agent from Queue A to Queue B mid-shift, the contact center routing logic must be configured to recognize the change; manual updates needed
- Approval workflow delays: If overtime requests require a manager's sign-off and the manager is unavailable, the request hangs, defeating the purpose of "same-day" adjustment
- Break extension policy conflicts with adherence: If an agent takes extra breaks to boost staffing, their adherence score drops—reconcile these metrics with compensation/incentive programs

---

*Source last updated: 2026-04-30 | Review when: Service level SLA breaches correlate with intraday staffing gaps, forecast accuracy drops below 80%, or if staffing decisions are not being acted upon by supervisors*
