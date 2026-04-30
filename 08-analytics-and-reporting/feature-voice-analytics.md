# Voice Analytics Dashboard

**Category:** Analytics & Reporting  
**Applies To:** Both  
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/voice-channel-reports-analytics

## What it does

Dedicated dashboard within Omnichannel Historical Analytics that surfaces voice channel metrics exclusively. Displays call-specific performance data and requires a separate enable toggle distinct from the main analytics feature.

## Key facts

- Metrics include: call volume, average handle time (AHT), customer satisfaction (CSAT), abandon rate, and transfer rate
- Requires separate enablement toggle in admin settings (distinct from general analytics enable)
- Data appears with 24-hour delay in reporting
- Voice-specific insights available only through this dedicated dashboard
- Integrates with broader omnichannel analytics but isolates voice channel data

## When to use / skip

Enable Voice Analytics Dashboard when your contact center has active voice channel operations and you need to track voice-specific performance metrics separately from other channels. This is essential for organizations where voice is a primary interaction channel. Skip if your contact center is digital-only or voice is minimal; the overhead of separate reporting may not justify the insights.

## Configuration decisions

- Navigate to Analytics admin settings and locate Voice Analytics Dashboard toggle (separate from main analytics)
- Enable the toggle to activate voice-specific reporting
- Verify users have appropriate security roles to view voice analytics
- Review voice metrics dashboard in Historical Analytics workspace
- Document reporting cadence and stakeholder distribution

## Gotchas

- Voice analytics must be enabled separately; enabling general analytics alone does not activate voice reporting
- 24-hour data delay means real-time voice metrics are not available in this dashboard
- Requires voice channel to be provisioned and active; no data displays if voice is not deployed
- Voice metrics dashboard is read-only; configuration changes must be made in voice channel settings
- Disable voice analytics toggle when decommissioning voice channel to reduce analytics overhead

---

*Source last updated: 2026-04-30 | Review when: Voice channel is provisioned or decommissioned*
