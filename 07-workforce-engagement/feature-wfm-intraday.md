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
Use Intraday Management if you run high-variability operations (support, sales, emergency) where demand swings 50%+ in a day, especially with tight SLAs (80% answered in 20 seconds). Skip if you have steady-state volume, low variance, or a small team where manual oversight is enough.

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
- **Forecasts get blindsided:** Viral news, competitor outage, promo surge — supervisors need to manually adjust in real time.
- **Agent availability lag:** Agent goes on unplanned break or drops, system takes 1-3 minutes to update. Forecast vs actual can look out of sync.
- **No forward-looking alerts:** System shows the current gap, not "you'll be short in 30 minutes." Requires supervisor to stay ahead.
- **Overstaffing gets ignored:** Supervisors chase understaffing and miss overstaffing — wasted pay (though some buffer is intentional).
- **No downstream sync:** Intraday changes (extended break for agent X) don't feed back to next-day schedules. Manual adjustments only.
- **Skill reassignments may need manual config:** Move an agent from Queue A to Queue B mid-shift — routing engine needs to recognize it.
- **Approval bottlenecks:** Manager unavailable to sign off on OT? Request hangs, defeating the purpose.
- **Adherence vs break extension trade-off:** Extra breaks boost staffing but tank adherence scores. Reconcile with compensation.

## Consultant notes

- Intraday Management is where WFM value becomes visible to supervisors — it's the thing they'll actually open every morning. Spend time in the handover walking the supervisor through a live session rather than handing over a config guide. The gap indicators and same-day actions are intuitive once you've seen them, but the relationship between this view and the forecast isn't obvious from documentation alone.
- The lack of forward-looking alerts is the main operational gap to discuss with the client. The view tells you what the situation is now, not what's coming. For high-variability environments, supervisors need to develop a habit of checking 30–60 minutes ahead against the forecast, rather than reacting when the gap is already red.
- Agree the overtime approval workflow before go-live. If the approval chain is the team leader, and the team leader is also managing a live queue, you'll get approval bottlenecks at the exact moment you can least afford them. Some clients will want to grant supervisors direct OT approval authority without escalation — document the decision and the rationale.

---

*Source last updated: 2026-04-30 | Check this if: SLA breaches track with staffing gaps, forecast accuracy falls below 80%, or supervisors aren't acting on recommendations*
