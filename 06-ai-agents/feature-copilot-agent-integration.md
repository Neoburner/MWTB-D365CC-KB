# Copilot Studio Agent Integration

**Category:** AI Agents
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../configure-bot-copilot-studio](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-bot-copilot-studio)

## What it does
Connects a Copilot Studio agent to D365 Contact Center workstreams so it can handle conversations autonomously before escalating to a human rep. Supports chat, voice, and social channels.

## Key facts
- **One agent per workstream** — you cannot assign multiple agents to a single workstream
- **Push mode only** — agent assignment is automatic; pick mode is not supported for bot workstreams
- **Classic Copilot Studio agents are not supported in enhanced voice workstreams** — must use modern (generative) agents for voice
- **30-minute inactivity auto-close** — if the customer goes silent and the bot doesn't escalate, the conversation closes automatically after 30 minutes
- On escalation, the bot passes the full conversation transcript and any context variables to the receiving rep's session
- **Voice end-of-conversation:** use the `CloseOmnichannelConversation` context variable in the Copilot Studio topic to signal D365 to end the call cleanly; without it, the voice session may not terminate correctly
- Agent must be published in Copilot Studio before it can be selected in the workstream configuration

## When to use / skip
Use on any workstream where you want automated triage, deflection, or self-service before handoff. Skip exclusively human workstreams — bots just add routing complexity.

## Configuration decisions
- Which context variables to pass from the bot on escalation — define these in the Copilot Studio topic and map them to D365 context keys; determines what data the rep sees on handoff
- Whether to use modern vs classic agent — voice requires modern; for chat, classic works but modern is the forward path
- Inactivity behaviour — the 30-minute auto-close is fixed; design bot topics to prompt the customer before that threshold if needed

## Gotchas
- **Classic agents blocked on enhanced voice.** If you can't see a bot in the voice workstream picker, it's probably classic — migrate or rebuild it as modern.
- **Publish first.** Unpublished agents don't appear in the agent picker. Publish in Copilot Studio first.
- **Missing `CloseOmnichannelConversation` on voice = hung calls.** For voice, every exit path must set this variable. Otherwise calls hang without closing properly.

---

*Source last updated: check Microsoft Learn | Check this after multi-agent per workstream support is added or inactivity timeout becomes configurable*
