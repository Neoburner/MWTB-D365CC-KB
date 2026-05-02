# Conference Calls

**Category:** Voice Channel
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/conference-calls-agent

## What it does
Conference calling allows an agent to bring a third participant into an active voice conversation, typically a subject matter expert, a supervisor, or a specialist from another team. The agent, the customer, and the third participant are all on the same call simultaneously. Unlike a consult transfer where the original agent exits, a conference keeps all three parties connected.

## Key facts
- Conference is initiated from the communication panel during a live voice call using the "Conference" or "Add participant" button
- The agent dials the third party (internal queue, agent, or external PSTN number) while the customer is placed on hold during the connection
- Once the third party accepts, the conference merges: all three parties can hear each other
- The original agent can leave the conference (dropping to a two-party call between customer and third party) or all parties can remain
- Conference is distinct from consult transfer: consult = agent talks to third party privately first, then chooses to transfer; conference = all parties join simultaneously after the connection
- ACS supports multi-party calling; conference calls are billed per participant minute in ACS usage
- Call recording during a conference captures all parties if recording is enabled
- Available for both inbound and outbound voice conversations
- Requires the third-party number or agent to be reachable via ACS or Direct Routing: PSTN conference to external numbers requires PSTN credits

## When to use / skip
Conference is useful for specialist involvement scenarios: a billing specialist joining a service call, a supervisor joining a complaint call, or a language interpreter joining for a customer who needs assistance in a different language. Less useful than a warm transfer when the original agent genuinely doesn't need to stay on the call, in that case, warm transfer is cleaner and releases the agent's capacity.

Don't set up conference as a default for all escalations. It ties up two agents on one conversation and inflates handle time. Use it specifically when the customer benefit of having both agents present outweighs the capacity cost.

## Configuration decisions
- Confirm that PSTN conference calling is available in your ACS region and that PSTN credits are allocated: conference to external numbers costs separately from inbound/outbound call credits
- Decide whether agents should be allowed to conference to any number or only to internal D365 queues and agents: an unrestricted dialpad in conference creates a risk of agents calling personal numbers or premium rate lines
- Define in training which scenarios justify a conference vs a warm transfer vs a blind transfer: operational clarity prevents agents from defaulting to conference for every escalation
- If the deployment uses call recording, confirm whether conference recordings capture all parties or only the primary call leg

## Gotchas
- The customer is placed on hold while the agent connects the third party. The hold experience during conference setup (music or silence) follows the same ACS hold music configuration as a standard hold. If hold music isn't configured, the customer hears silence while the agent dials the third party.
- Leaving the conference (if the original agent exits) does not necessarily end the call: the customer and third party remain connected. Agents need to understand that exiting a conference is not the same as ending the call. The call only ends when all parties disconnect or the last remaining agent ends it.
- Conference with an external PSTN number will consume PSTN minutes for both the inbound call and the outbound conference leg simultaneously. Track this in ACS usage costs if call volume is high.
- If the third party doesn't answer, the agent needs to resume the customer from hold manually. Train agents not to leave the customer on hold indefinitely while attempting conference connections.
- Conference call availability depends on the voice channel and ACS region. Confirm in your specific ACS region that multi-party calling is supported before scoping conference capabilities.
- Screen recording (if enabled) during a conference call captures the agent's screen, not the conference audio of all parties: the screen recording is agent-side only.

## Consultant notes

- Conference calling is one of those features clients list as a requirement in discovery but rarely specify the actual use cases for. Probe further: who are they conferencing with? Internal specialists? Supervisors? External interpreters? The answer determines whether the design needs PSTN conference (external number) or just internal agent-to-agent conference (no PSTN cost). These are different configurations and different cost implications.
- The capacity impact of conference calls is worth flagging in the design. While an agent is in a conference call, their capacity is consumed on that one conversation for the full duration: including the time when the specialist is doing most of the talking. If the contact centre has capacity-sensitive SLAs, model the impact of frequent conference use on queue depth.
- Interpreter conference scenarios (calling an external interpretation service) are a specific case that comes up in public sector and healthcare deployments. The external interpretation service is typically a PSTN number. Make sure PSTN conference to external numbers is tested in UAT: the connection timing and hold behaviour can be different from internal conference, and interpretation quality depends on audio clarity across the three-way call.

---

*Source last updated: 2026-04-30 | Revisit if ACS changes multi-party calling support or Microsoft adds conference recording controls*
