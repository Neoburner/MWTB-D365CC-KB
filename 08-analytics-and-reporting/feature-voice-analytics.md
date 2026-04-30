# Voice Analytics Dashboard

**Category:** Analytics & Reporting  
**Applies To:** Both  
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/voice-channel-reports-analytics

## What it does
Voice-specific dashboard within Omnichannel Historical Analytics. Shows call metrics separately from other channels and needs its own enable toggle.

## Key facts

- Metrics include: call volume, average handle time (AHT), customer satisfaction (CSAT), abandon rate, and transfer rate
- Requires separate enablement toggle in admin settings (distinct from general analytics enable)
- Data appears with 24-hour delay in reporting
- Voice-specific insights available only through this dedicated dashboard
- Integrates with broader omnichannel analytics but isolates voice channel data

## When to use / skip
Turn this on if you run voice and need voice metrics separate from other channels. Essential if voice is primary. Skip if you're digital-only or voice is minimal.

## Configuration decisions
- Flip the Voice Analytics Dashboard toggle (separate from main analytics) in admin settings
- Verify user security roles have access to voice analytics
- Review the voice dashboard in Historical Analytics
- Document your reporting cadence and who gets reports

## Gotchas
- **Voice toggle is separate:** Enabling general analytics doesn't turn on voice reporting.
- **24-hour data lag:** Real-time voice metrics aren't available here.
- **Voice must be provisioned:** No data if voice isn't active.
- **Dashboard is read-only:** Configuration lives in voice channel settings.
- **Clean up when decommissioning:** Turn off the toggle to reduce overhead.

---

*Source last updated: 2026-04-30 | Check this if: Voice channel is provisioned or decommissioned*
