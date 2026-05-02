# Blocked Numbers

**Category:** Security and Compliance
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../voice-channel-block-number](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-block-number)

## What it does
Block spam or nuisance calls in voice. Reps flag incoming calls; admins review and block, or numbers auto-block after a configurable threshold.

## Key facts
- **Voice channel only** — no spam management for digital messaging channels
- Two tabs: **Pending review** (flagged numbers awaiting admin decision) and **Blocked** (actively blocked)
- **Auto-block:** single global threshold — when a number hits the configured report count, it's automatically blocked without manual review
- Report history links to conversation recordings for admin verification before blocking
- Numbers can be manually added to blocked list without a prior spam report

## When to use / skip
Enable auto-block for any deployment receiving significant spam/robocall volume. Without it, every flagged number requires manual admin action and the pending review queue quickly becomes a burden.

## Configuration decisions
- **Auto-block threshold** — 2–3 reports is reasonable for most consumer environments; higher threshold (3+) recommended for B2B environments where a persistent legitimate caller might get mis-flagged

## Gotchas
- **Reps won't flag unless they know about it.** Train on this feature — it only works if reps use it. Otherwise it sits there unused.
- **B2B threshold risk.** Threshold of 1 in B2B can block a legit customer who called multiple times. Review history before blocking ambiguous cases.

## Consultant notes

- Include blocked number flagging in the rep training pack for any deployment receiving consumer voice calls. It's a low-friction feature that only delivers value if reps know how to use it — without training, it doesn't exist operationally. A single slide or step-by-step in the rep guide is enough.
- Set the auto-block threshold conservatively for B2B environments. A single frustrated customer who calls three times in a day genuinely needs help — auto-blocking at threshold 2 or 3 will catch legitimate contact attempts. Review the pending queue before committing to a threshold, and consider setting it higher (4–5) if the client's customer base tends to be persistent when they can't get through.
- This is one of the lighter operational tasks in the admin handover but worth covering explicitly. Post-go-live, someone needs to own the pending review queue — either an operations supervisor or a dedicated admin. If nobody is assigned, the pending list accumulates and the auto-block feature does all the work unchecked, which may or may not be the client's intent.

---

*Source last updated: 2026-01-18 | Check this: Blocked numbers expands to digital messaging, or external spam database integration added*
