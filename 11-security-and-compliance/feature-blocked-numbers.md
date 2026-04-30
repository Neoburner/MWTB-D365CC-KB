# Blocked Numbers

**Category:** Security and Compliance
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../voice-channel-block-number](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/voice-channel-block-number)

## What it does
Prevents spam or nuisance phone calls from reaching reps in the voice channel. Reps and supervisors can flag incoming calls as spam; admins review and block via Pending review queue, or numbers auto-block after a configurable report threshold.

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
- **Reps won't use spam flagging unless they know it exists.** Include this in rep training — it drives value only if reps and supervisors flag calls. Without awareness, the feature sits unused.
- **B2B threshold risk.** A threshold of 1 in a B2B environment risks blocking a legitimate customer who called multiple times and was flagged by reps who didn't recognise the number. Review report history before blocking in any ambiguous case.

---

*Source last updated: 2026-01-18 | Review when: Blocked numbers expands to digital messaging, or external spam database integration added*
