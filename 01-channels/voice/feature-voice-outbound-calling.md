# Voice Channel — Outbound Calling

**Category:** Channels — Voice
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../voice-channel-outbound-calling](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-outbound-calling)

## What it does
Enables representatives to make outbound calls from Copilot Service workspace. Configured via outbound capacity profiles and outbound profiles. Optionally supports personal phone numbers (dedicated per-rep) and call forwarding to PSTN when a rep is unavailable.

## Key facts
- Requires phone numbers with **Make calls** calling plan enabled — not all number types include this by default (upgrade may trigger ACS billing)
- Personal numbers: **geographic numbers only** — toll-free numbers cannot be assigned to individual reps
- Capacity profile settings for outbound: Work item limit (typically 1), Reset frequency = **Immediate**, Assignment blocking = **Yes** (blocks inbound while on outbound call)
- After adding a rep to a queue, **20-minute delay** before outbound calling is available in their workspace
- Call forwarding behaviour by presence: DND/Offline + missed → forwards to PSTN number; Available/Away/Busy + rejected → voicemail

## When to use / skip
Use when representatives need to proactively call customers. Required for any outbound calling use case — call back on cases, proactive notifications, account manager calls.

## Configuration decisions
- **Personal numbers vs outbound profile numbers** — personal numbers create a 1:1 rep-to-number relationship (B2B account management model); outbound profile numbers are shared pool (contact centre model). Most contact centres should use outbound profiles, not personal numbers.
- Separate capacity profiles for inbound and outbound — strongly recommended; mixing them causes unpredictable work assignment behaviour
- Call forwarding — useful for account managers or field reps who need missed calls to reach a mobile number

## Gotchas
- **"Make calls" upgrade has a cost implication.** Enabling outbound on a number may trigger a calling plan charge in ACS. Confirm with the Azure admin before upgrading numbers.
- **Separate inbound and outbound capacity profiles.** If a rep can receive inbound while on an outbound call (Assignment blocking = No), they can be double-assigned. Use explicit naming conventions and keep the profiles separate.
- **20-minute delay is real.** After adding a rep to a queue, they won't see outbound calling features for 20 minutes. Factor this into onboarding and testing timelines.
- **Personal number management overhead is underestimated.** If the client assigns personal numbers, they'll need to track and reassign them when staff turn over. This operational overhead is often not anticipated during scoping.

---

*Source last updated: 2026-02-20 | Review when: Outbound dialer feature reaches GA, or personal number management enhanced*
