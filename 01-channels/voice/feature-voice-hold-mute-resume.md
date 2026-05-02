# Hold, Mute & Resume Controls

**Category:** Voice Channel
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/use/hold-customer-call

## What it does
Hold, mute, and resume are the basic call control actions available to agents during a live voice conversation. Hold pauses the interaction and plays hold music (if configured) to the customer while the agent is off the call. Mute silences the agent's microphone without pausing the call, the customer cannot hear the agent but the call stays live. Resume brings the agent back into the conversation after a hold. These controls are in the communication panel within the Active Conversation screen.

## Key facts
- Hold and mute buttons appear in the voice communication panel for all live inbound and outbound calls
- **Hold:** suspends the conversation: customer hears hold music (configured in ACS) or silence if no music is set; agent cannot hear customer; call recording pauses (depending on ACS configuration)
- **Mute:** silences the agent's microphone only; call remains live; customer cannot hear agent; recording continues
- **Resume:** ends a hold, reconnecting agent to the customer; the customer returns from hold music to the live call
- Keyboard shortcut for mute: Ctrl+Alt+M; hold: Ctrl+Alt+H
- Hold duration is not time-limited by default: agents can hold a customer indefinitely; operations teams should define a policy for maximum hold time
- ACS call recording behaviour during hold varies by configuration: verify whether your ACS setup pauses recording on hold or continues capturing silence
- Multiple holds in a single call are allowed; hold time accumulates and is reported separately from talk time in conversation analytics

## When to use / skip
Hold is standard practice for any call where the agent needs to consult an internal resource, check a system, or escalate without the customer hearing the conversation. Mute is for momentary interruptions (typing, speaking to a colleague briefly). These are table-stakes voice features, every voice deployment uses them.

The config decision is around hold music. If you leave it unconfigured, customers hear silence on hold, which most interpret as a dropped call.

## Configuration decisions
- Configure hold music in ACS: upload a branded audio file or a professional royalty-free music file; silence is the default and should not be the go-live state
- Define an operational maximum hold time and include it in agent training and QA scorecards: D365 will not enforce a maximum, but reporting can surface it
- Check ACS recording configuration: if compliance requires that recording continues through hold, verify this explicitly rather than assuming
- Decide if hold time should be included in AHT calculations: configure analytics accordingly so hold time is visible as a separate metric

## Gotchas
- Hold music must be configured in ACS, not in D365 admin centre. The hold music setting lives in the ACS resource, not in the contact centre configuration. It's easy to miss during setup because it's not in the same admin surface as everything else.
- Mute and hold are often confused by agents in training. Make the distinction explicit: hold = customer hears music/silence, you can't hear them; mute = call is still live, customer just can't hear you.
- ACS recording during hold is not automatically suppressed. If you pause recording for PCI compliance (e.g., during DTMF payment entry), the hold mechanism is separate: don't conflate the two.
- Hold does not prevent the conversation timer from running. AHT will include hold time unless analytics are configured to separate talk time from hold time.
- Agents sometimes mute then forget they're muted and wonder why the customer isn't responding. There's no persistent indicator in the communication panel beyond the button state. Train agents to check the mute button state when customers seem unresponsive.

## Consultant notes

- Hold music is consistently the most overlooked ACS configuration item in go-live checklists. The reason it gets missed is that it's not in the D365 admin centre: it's in the Azure portal in the ACS resource. Whoever owns the ACS setup needs a checklist item for it explicitly. Find out early whether the client has a branded on-hold audio file or needs to source one; getting marketing approval for hold music takes longer than the configuration.
- Maximum hold time policy belongs in the agent training and QA framework, not in the system. D365 will not cut off a hold after 5 minutes. If the ops team has a service commitment (e.g., notify the customer if hold exceeds 2 minutes), that's a manual process or a Copilot Studio IVR flow that checks hold duration: not a native D365 setting.
- If the deployment includes call recording for quality or compliance, check hold behaviour during the UAT call recording review, not just in isolation. Listen to a recorded call that included a hold and confirm what the customer heard and what the recording captured. Don't rely on configuration assumptions.

---

*Source last updated: 2026-04-30 | Revisit if ACS adds configurable hold time limits or D365 adds hold time enforcement*
