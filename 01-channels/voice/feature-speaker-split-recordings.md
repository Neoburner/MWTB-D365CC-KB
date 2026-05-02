# Speaker-Wise Split Recordings

**Category:** Channels: Voice
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/service/dynamics365-contact-center/split-recordings-speaker-wise-closed-conversation-view

## What it does
In the closed conversation view, call recordings are split into separate audio tracks per speaker, agent and customer, and colour-coded differently so you can navigate directly to a specific speaker's segments without scrubbing through the whole recording.

## Key facts
- Available in the closed conversation view only: not during live or wrap-up
- Each speaker's audio is shown as a separate colour-coded waveform or segment indicator
- Makes quality review and coaching significantly faster: jump straight to the agent's responses or the customer's complaint without rewinding the whole call
- Applies to recordings stored in the standard voice recording pipeline; requires the recording feature to be enabled
- Requires Azure Event Grid recording integration (`feature-azure-event-grid.md`): the same dependency as standard recording and transcription

## When to use / skip
This is a quality management and compliance review feature. Use it if supervisors or QA analysts regularly review call recordings. Skip worrying about it in initial go-live, it's automatically available in the closed conversation view once recording is enabled, there's no separate configuration step.

## Configuration decisions
- Nothing specific to configure for the split view itself: it comes with the recording setup
- Ensure recording is enabled and Azure Event Grid is provisioned (see `feature-voice-recording-transcription.md`)
- If you're using Quality Management scorecards (`feature-wfm-quality-management.md`), plan how analysts will use the split view alongside the scorecard: the workflows complement each other

## Gotchas
- **Recording must be enabled and stored.** If you're not capturing recordings: or only doing real-time transcription without storage: there's nothing to split. Confirm your recording setup before expecting this to work.
- The split is speaker-level, not speaker-identified by name. You'll see "Speaker 1 / Speaker 2" (or agent/customer channel labels), not the rep's name in the waveform. The transcript has the name attribution.
- If a call involved a three-way consult, the third participant may appear as a separate speaker or may be merged: test your consult/transfer scenarios in UAT.
- Large recording files in older or low-bandwidth environments may be slow to load the split view: worth flagging in environments with many concurrent QA reviewers.

## Consultant notes

## Consultant notes

- This needs zero configuration once recording is enabled: don't over-engineer it. The only action is making sure your QA team and supervisors know the split view is there and how to use it. Include it in the supervisor onboarding materials.
- Brief the QA team that speakers are labelled by channel role (agent/customer), not by name. The transcript has name attribution; the waveform view doesn't. Analysts who expect to see "Sarah - Agent" in the waveform will be confused if you don't set expectations.
- Three-way consult scenarios (agent + customer + external) are the edge case to test in UAT. The third participant may show as a separate speaker track or may be merged depending on how the conference leg is set up. Know the behaviour before the QA team discovers it in a coaching session.


---

*Part of the broader 2025wave2 push on voice quality review tooling alongside speaker-level transcription and Quality Evaluation Agent.*
