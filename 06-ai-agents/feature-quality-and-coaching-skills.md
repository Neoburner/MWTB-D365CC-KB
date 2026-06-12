# Quality and Coaching Skills

**Category:** AI Agents
**Applies To:** Standalone (Contact Center only)
**Source:** [learn.microsoft.com/.../configure-quality-coach](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-quality-coach)

## What it does
AI-driven quality scoring plus real-time coaching for live conversations. You build evaluation plans from reusable quality indicators and guardrails, and the system either scores conversations on close or evaluates them continuously and fires coaching nudges to the representative mid-conversation. It's the same engine that sits behind the Quality Assurance Agent (QAA), now with a real-time coaching layer and a centralised quality library on top. See [[feature-quality-evaluation-agent]].

## Key facts
- Two evaluation frequencies per plan: **In real-time** (continuous scoring + live nudges) and **On conversation close** (scored once, results after the conversation ends). It's set per plan, not per tenant.
- The quality library has two object types: **quality indicators** (scored — empathy, greeting etiquette, etc., each with one or more questions) and **guardrails** (pass/fail behaviour rules — e.g. no financial advice, vulnerable-customer handling — evaluated for violations, not scored).
- Indicators and guardrails are reusable across plans. Build the library once, reference it everywhere.
- Guardrails carry a Low/Medium/High priority and can optionally generate a suggested next response when a violation is detected.
- Runs on Microsoft Copilot credits (pay-as-you-go) — this is consumption-billed, not bundled.
- Requires the Omnichannel Administrator role to configure.
- Surfaces in Copilot Service workspace as **Closed QAA conversations** and **Ongoing QAA conversations** views, with a Score column and a side pane showing the quality trendline, AI summary, and per-indicator detail.
- Representatives see coaching nudges inline in the conversation, and the full nudge history in the **Consult** pane.

## When to use / skip
If you're running a messaging operation where conversation quality and compliance matter and you want to move off manual QA sampling, this is the tool — and the real-time mode is the reason to pick it over plain post-call scoring. Skip the real-time frequency if your contact reasons are low-risk and you only need retrospective scoring; on-close evaluation is cheaper on credits and avoids nudging representatives mid-flow. Skip the whole thing if you've no appetite for the Copilot credit spend, because at conversation volume the consumption adds up.

## Configuration decisions
- Real-time vs on-close per plan — decide by queue risk, not blanket across the tenant.
- Which conversations each plan covers (conditions on queue / workstream). Scope real-time evaluation tightly to high-value queues to control credit burn.
- Score ranges (Critical / Warning / Normal) for each scored indicator, and what each range triggers: supervisor notification, representative nudge, or both.
- Whether guardrails generate a suggested next response or just flag the violation.
- Which built-in indicators to copy-and-edit versus author from scratch.

## Gotchas
- It bills on Copilot credits and the real-time mode evaluates continuously — point it at every queue and the spend will surprise you. Scope with conditions from day one.
- The views are labelled "QAA conversations" in the workspace even though the admin surface is called "Quality and Coaching". Same engine, two names — don't let that confuse a tenant walkthrough.
- Microsoft attaches the standard employee-monitoring caveat to this feature: it's not for employment decisions, and you're on the hook for notifying end users (and representatives) that conversations may be monitored and recorded, and getting consent where the law requires it. Get that signed off before go-live, not after.
- Nudges fire inline during a live conversation. If your indicators are noisy or the score ranges are set too tight, representatives get pestered mid-call — tune conservatively and widen out once you trust the scoring.

## Consultant notes

- Clients conflate this with the Quality Evaluation Agent in scoping and assume one licence/config covers both. They share an engine but this adds the real-time nudge layer and the quality library as first-class objects — scope the build accordingly, and budget for the library work because well-written indicators and guardrails are where the value is and where the effort goes.
- The credit consumption is the thing that bites post-go-live. Real-time evaluation on a busy messaging queue is a meaningful pay-as-you-go line item. Model it against expected conversation volume before you switch real-time on tenant-wide, and stage the rollout queue by queue.
- The employee-monitoring and consent obligations are a legal/works-council dependency, not a technical one — in some EU jurisdictions real-time agent monitoring needs employee-representative consultation. Flag this to the client's legal and HR early; it can hold up go-live independently of the build.
- Start in on-close mode to calibrate indicators against real conversations, then flip high-value queues to real-time once the scoring is trustworthy. Going straight to real-time with untuned indicators gives representatives a bad first impression of the nudges.

---

*Freshly shipped (MS Learn docs dated June 2026) — confirm public preview vs GA status in your target tenant, and revisit after the next release wave for billing and configuration changes.*
