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
Predictive dialling is for high-volume campaigns (collections, surveys, appointment reminders) where efficiency is worth agent stress. Progressive is for consultative outbound (sales, support callbacks, proactive reach) where quality beats volume. Skip both if inbound calling handles your load or if you're not doing outbound at all.

## Configuration decisions
- **Predictive vs Progressive**: Predictive: efficiency but higher stress. Progressive: quality but lower agent adoption.
- **Predictive ratio**: Use 3:1 for decent-quality lists; 5:1 if your list is dodgy (high failure rate).
- **Outcome handling**: Wire up Power Automate logic for each SIP outcome: voicemail, retry timing, escalation.
- **Agent assignment**: Batch assign (balanced round-robin) or dynamic based on availability. Your choice.
- **Voicemail detection**: ACS can distinguish live voice from greeting. Costs extra per call.
- **Recording consent**: Make sure customers have signed off; add a disclaimer message if needed.
- **Do-Not-Call (DNC) compliance**: Integrate with the DNC registry (US FTC, GDPR consent logs) before you start dialling. Violations carry fines.
- **Retry strategy**: Set max retries and intervals (e.g., retry 3 times over 24 hours for no-answer).

## Gotchas
- **Voicemail detection fails sometimes.** Some systems fool it and connect to the agent anyway. Agent hears "please leave a message" mid-greeting.
- **SIP codes vary wildly by carrier.** Some carriers return generic 5xx for everything, making retry logic imprecise.
- **Dropped calls in Predictive mode kill efficiency.** Caller hangs up during the agent greeting, wasting a dial attempt. High drop rates destroy your gains.
- **Power Automate failures are silent.** Empty contact list, workflow error: dialling just stops. No alerting to admins.
- **DNC violations are expensive.** One call to a DNC-listed number = $500–$1500 fine in the US. Strict compliance is non-negotiable.
- **Bad predictive ratios cause compliance issues.** Misconfigure dials-per-agent and excessive call drops follow.
- **Junk in the contact list tanks efficiency.** Disconnected numbers, wrong format: validate and deduplicate before you start.
- **Carrier SIP codes matter.** Some carriers don't send voicemail detection codes. You'll need workarounds.

## Consultant notes

- DNC compliance gets treated as a client responsibility but invariably lands on the implementation team when something goes wrong. Agree in the SOW who's responsible for DNC list validation and document it clearly. One call to the wrong number is an expensive lesson.
- Predictive mode sells well in discovery ("maximum agent efficiency") but clients often underestimate the workforce impact. Agents handling high volumes of unexpected live connections burn out faster. Worth raising in the requirements phase, not post-go-live.
- Power Automate failures are the silent killer for outbound campaigns: no alerts, dialling just stops. Build in some form of monitoring or alerting on the workflow before handing over to the client.

---

*Source last updated: 2026-04-30 | Worth revisiting if outbound automation expands or Copilot Agents integrate with dialling*
