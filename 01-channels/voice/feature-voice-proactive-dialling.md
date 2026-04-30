# Predictive / Progressive Dialling (Proactive Voice Engagements)

**Category:** Voice Features / Outbound Calling
**Applies To:** Standalone / Embedded
**Source:** https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/proactive-outbound-calling

## What it does
Proactive dialling modes automate outbound calls to customers from a list. Predictive mode dials multiple numbers simultaneously ahead of agent availability, expecting some calls to fail (busy, voicemail, disconnected); Progressive mode waits for an agent to be available before dialling a single number. Both modes are triggered via Power Automate workflows and manage SIP outcome codes to determine next actions (voicemail detection, network failures, etc.).

## Key facts
- Predictive dialling is more efficient but requires skilled workforce (higher stress due to unexpected live connections)
- Progressive dialling is gentler (single call per agent, no surprises) but less efficient; agents spend more time idle
- Dialling is triggered by a Power Automate workflow; the workflow passes a list of phone numbers and agent assignments
- Both modes use SIP outcome codes to classify results: 200 OK (connected), 486 Busy, 487 No Answer, 5xx (network failure)
- Outcome codes determine follow-up logic (e.g., 487 = retry in 5 min; 486 = mark as busy and move to next number)
- Predictive mode dials at a 3:1 to 5:1 ratio (3–5 calls per agent) to account for failures
- Progressive mode dials 1:1 (one call per agent); if call fails, the agent becomes available and is assigned a new number
- Call recording is enabled by default for proactive calls; disable via workstream settings if recording is not required
- Dropped calls (caller hangs up before agent answers) are tracked; high drop rates indicate poor predictive ratio tuning

## When to use / skip
Use Predictive dialling for high-volume outbound campaigns (collections, surveys, appointment reminders) where efficiency justifies higher agent stress. Use Progressive dialling for consultative outbound (sales, customer support callbacks, proactive outreach) where quality matters more than volume. Skip both if inbound calling meets your needs or if your business model doesn't support outbound.

## Configuration decisions
- **Dialling mode:** Choose Predictive (efficiency, high stress) or Progressive (quality, lower agent adoption)
- **Predictive ratio:** If using Predictive, set dialling ratio (3:1 common for well-qualified lists; 5:1 for low-quality lists with high failure rates)
- **Outcome handling:** Define Power Automate logic for each SIP outcome (voicemail detection, retry timing, escalation rules)
- **Agent assignment:** Pre-assign agents to a batch of numbers (balanced round-robin) or assign dynamically based on availability
- **Answer detection:** Enable voicemail detection (ACS can distinguish live voice from voicemail greeting); costs extra per call
- **Call recording consent:** Ensure customers have consented to recording; configure disclaimer message if required
- **Do-Not-Call (DNC) compliance:** Integrate with DNC registry (US FTC list, GDPR consent logs) before dialling; violations = fines
- **Retry strategy:** Define max retries, retry intervals (e.g., retry 3 times over 24 hours for no-answer)

## Gotchas
- Voicemail detection is imperfect; some voicemail systems fool detection and connect to agent (agent hears "please leave a message")
- SIP outcome codes vary by carrier; some carriers return generic 5xx for all failures, making retry logic less precise
- Dropped calls in Predictive mode (caller hangs up during agent greeting) waste dialling attempts; high drop rates kill efficiency
- Power Automate workflow failures (e.g., contact list is empty) cause silent dialling stops; no alerting to admins
- DNC compliance is strict: if a customer is on the DNC list, any outbound call is a violation (US: $500–$1500 per call fine)
- Predictive dialling can create compliance issues if the dials-per-agent ratio is misconfigured and calls drop excessively
- Contact lists with invalid numbers (disconnected, wrong format) degrade efficiency; validate and deduplicate before dialling
- Outcome classification depends on carrier SIP responses; some carriers don't send voicemail detection codes, requiring workarounds

---

*Source last updated: 2026-04-30 | Review when: Outbound calling automation features expand or Copilot Agent integration launches*
