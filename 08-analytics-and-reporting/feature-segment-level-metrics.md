# Segment-Level Metrics Across Queues

**Category:** Analytics and Reporting
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/track-segmentlevel-metrics-across-queues

## What it does
Tracks performance metrics — wait time, service level, and abandonment — at each individual queue entry within a single customer interaction, rather than at the overall conversation level. When a call transfers from queue A to queue B, you get separate metrics for each leg.

## Key facts
- GA: May 2026; no public preview
- Enabled for admins, makers, and analysts automatically — no per-user toggle
- Metrics tracked per segment: wait time, service level adherence, abandonment
- Captures post-transfer customer wait time — something conversation-level metrics mask entirely
- Surfaces agent rejection events, timeouts, and misrouted transfers at the queue level
- Works across all channels that pass through queues (voice, digital messaging)

## When to use / skip
Use this if you're seeing SLA numbers that look fine at the conversation level but customers are complaining about post-transfer wait times — this will show you which queue is the problem. Also the right thing to reach for when you're troubleshooting routing issues (rejections, timeouts) and the current reporting gives you no granularity below session level. Skip it as a concern if your contact centre is single-queue or transfers are rare.

## Configuration decisions
- No configuration required — the feature enables automatically on GA
- Existing historical dashboards will retrospectively reflect segment-level calculations; verify with stakeholders that the metric shift doesn't trigger false SLA breach alerts
- Check whether any custom Power BI or Data Export reports join on conversation-level metrics — they'll need to account for the new segment-level grain

## Gotchas
- This changes how existing metrics are calculated, not just adds new ones. Conversation-level wait time and SLA numbers will shift when this goes GA — flag this with your ops team before May or you'll get questions about why the numbers moved.
- "Abandonment" is now measured per queue entry, so a customer who hangs up while waiting in queue B (after transferring from queue A) counts as an abandonment in queue B, not at the conversation level. Makes attribution cleaner but will change your abandonment rate figures.
- No retroactive data for segments before GA — historical segment-level reporting starts from when the feature lands.

---

*Review after GA to confirm metric calculation changes in existing dashboards and validate SLA reporting against pre-GA baselines.*
