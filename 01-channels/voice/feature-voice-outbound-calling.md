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
Needed if reps have to make outbound calls — callbacks on cases, proactive notifications, account management. Essential for that use case.

## Configuration decisions
- **Personal numbers vs shared outbound numbers** — Personal numbers = one rep per number (B2B account management); shared numbers = pool model (contact centre). Most contact centres want shared. Don't default to personal unless the client is account management–heavy.
- **Separate capacity profiles for inbound and outbound** — Strongly recommended. Mix them and work assignment gets unpredictable.
- **Call forwarding to mobile** — Handy for account managers or field reps who need their personal number to ring when they miss a call.

## Gotchas
- **"Make calls" enablement costs money.** Flipping on outbound for a number triggers ACS billing. Check with your Azure admin before you upgrade.
- **Keep inbound and outbound capacity profiles separate.** If Assignment blocking = No, reps can get double-assigned (inbound + outbound at the same time). Use clear naming and keep them apart.
- **The 20-minute delay is real.** After you add a rep to a queue, they can't make calls for 20 minutes. Plan for that in onboarding and UAT.
- **Personal numbers create a support headache.** If the client goes that route, they need to manage reassignments when staff leave. This admin cost often gets missed in scoping.

## Consultant notes

- The 20-minute delay after adding a rep to a queue will bite you during UAT every time unless you document it upfront. Put it in the UAT guide and tell the client's test team before they start clicking.
- Personal numbers almost always sound more appealing to clients than they actually are in practice. The staff turnover / number reassignment admin cost gets missed in scoping. Worth talking through the operational overhead before committing to that model.
- Separate capacity profiles for inbound and outbound from day one, regardless of what the client thinks they need. Untangling mixed profiles after go-live is not a conversation anyone enjoys.

---

*Source last updated: 2026-02-20 | Worth revisiting if the outbound dialer goes GA or personal number management gets upgraded*
