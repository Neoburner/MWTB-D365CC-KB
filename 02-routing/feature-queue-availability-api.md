# Queue Availability API (Representative Availability APIs)

**Category:** Routing
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2026wave1/service/dynamics365-contact-center/get-queue-availability-data-representative-availability-apis

## What it does
Real-time APIs that expose queue-level representative availability and estimated wait times. Designed for use by IVR systems, bots, and digital assistants to make routing decisions or give customers accurate queue information before connecting.

## Key facts
- GA'd April 2026; enabled automatically for admins/developers: no separate toggle
- Two APIs: one for scenarios where a conversation already exists, one for pre-conversation (no existing context)
- Uses the same routing path logic as actual conversations: so the availability data reflects the real workstream/queue routing, not a generic count
- Returns: representative availability (by queue), average wait times
- Intended consumers: Copilot Studio agents, IVR flows, external orchestration systems

## When to use / skip
Use this if you're building a self-service IVR or bot that needs to tell callers how long they'll wait, or if you want to route to an alternative queue based on real-time availability. Also useful for proactive SMS flows that should only connect if agents are available.

Skip if your routing is simple and wait time estimation isn't a customer experience requirement, the API adds integration complexity that isn't justified for low-sophistication deployments.

## Configuration decisions
- Which API variant to call: conversation-context API (when you have a work item ID) vs. pre-conversation API (when routing hasn't started yet)
- What availability thresholds trigger different IVR paths (e.g. if wait > 10 mins, offer callback)
- Authentication: Dataverse API credentials required: standard OAuth 2.0 client credentials or delegated access

## Gotchas
- "Same routing path as the conversation" means the API respects your workstream, queue assignment rules, and operating hours. If you call it outside operating hours, the returned availability reflects 0 available reps: don't interpret that as the API being broken.
- Average wait time is an estimate, not a guarantee. If you surface it to customers ("your wait time is 3 minutes"), manage expectations: actual wait may vary, especially during sudden volume spikes.
- The API is new as of Apr 2026. There's no documented rate limit at launch: worth testing under load before putting it in front of a high-volume IVR.

## Consultant notes

## Consultant notes

- This is a powerful capability for IVR self-service, but it's brand new as of April 2026: no documented rate limits at launch. Test under realistic load before putting it in front of a high-volume IVR. An undocumented rate limit discovered at go-live will break your IVR's availability messaging.
- The operating hours behaviour is a simple trap: the API returns zero available reps outside business hours, not an error. If your IVR logic branches on "no available reps," make sure it handles the after-hours case gracefully rather than routing everyone to the overflow queue at 8am on Saturday.
- If you surface estimated wait times to customers in the IVR, word it carefully: "approximately X minutes" or "currently a short wait." Exact figures create unrealistic expectations. Volume spikes between the API call and the call connecting can double a wait time in 30 seconds.


---

*Worth revisiting once Copilot Studio agent integration examples are published showing this API in action.*
