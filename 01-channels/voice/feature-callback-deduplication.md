# Callback Deduplication (Duplicate Callback Requests)

**Category:** Voice
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/handle-duplicate-callback-requests-overflowing-queues

## What it does
Prevents the same caller from registering multiple callback requests when queues are overflowing. Admins configure deduplication logic and the caller experience when a duplicate is detected — including playing a custom message or ending the call.

## Key facts
- GA'd April 2026; configured via admin, requires explicit setup
- Found in **Copilot Service admin center → Overflow settings** (both in-queue and pre-queue overflow)
- Deduplication key is configurable: caller phone number, channel phone number, queue ID — or combinations of these
- When a duplicate is detected, two options: end the call, or play a custom message in a loop (e.g. current wait time)
- Admin can also specify which number to initiate the callback from

## When to use / skip
Use this for any high-volume deployment where overflow callbacks are common. Without it, an anxious caller calling back repeatedly to "make sure they're in queue" creates duplicate work items, inflates queue depth, and wastes rep capacity.

Skip configuration only if your callback volumes are so low that duplicates have never caused an issue — which is rare on voice-heavy implementations.

## Configuration decisions
- Deduplication key composition: caller number alone is simplest; add channel number and queue ID if you need finer granularity (e.g. same caller in two different queues should get two callbacks)
- Caller experience on duplicate: ending the call is cleaner operationally; a custom loop message is better for customer experience but requires scripting the message text
- Callback origination number: which number the callback comes from — make sure it's one the customer will recognise and answer

## Gotchas
- The deduplication window isn't documented with a precise TTL — test in UAT to confirm how long a "duplicate" is recognised after the initial callback request. If a caller requests a callback, hangs up, and calls again 2 hours later, you'd expect a new callback, not a duplicate block.
- If you use queue ID in the key, transferring a work item between queues could affect deduplication behaviour — the caller could end up with a valid second callback from the destination queue.
- The "play custom message in loop" option requires a recorded audio file or text-to-speech content. Don't configure this in a hurry — the message should include an accurate wait time estimate, which requires real-time data to be useful.

## Consultant notes

## Consultant notes

- Configure this for any voice deployment where callback overflow is in scope — it's a quick admin center setting with a disproportionate operational benefit. Duplicate callbacks create artificial queue depth and waste rep capacity; the fix takes 10 minutes.
- The deduplication TTL gap in the docs is a genuine concern. Test the edge case in UAT: caller requests callback, calls back 2 hours later — does D365 treat it as a duplicate or a new request? Know the answer before ops asks it at go-live.
- If you're configuring the "play custom message in loop" option, book the audio production into your project plan early. It needs a script, a recording, and a review cycle — it's never a same-day task, and clients almost always underestimate how long it takes to get a branded recording approved.


---

*Revisit after wave 2 to see if deduplication extends to non-voice callback channels.*
