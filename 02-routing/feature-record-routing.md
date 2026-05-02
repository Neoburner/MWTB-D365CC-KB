# Record Routing

**Category:** Routing
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../set-up-record-routing](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/set-up-record-routing)

## What it does
Extends unified routing to Dataverse records — cases, email activities, phone calls, faxes, letters, and appointments. Routes records to queues and assigns reps using the same engine as conversation routing, with a few key behavioural differences.

## Key facts
- Supported record types: Cases, Email, Phone Call, Fax, Letter, Appointment; custom record types can be enabled
- Assignment cycles for record queues: **5-minute periodic timer** plus event triggers (not purely event-driven like conversation routing)
- **Capacity is not released automatically** for records/activities — must deactivate the queue item or clear the Worked By field
- **Intake rules** determine which workstream handles an incoming record (required for record routing; sets workstream selection before classification)
- Rep must have **Dataverse security permissions** to the routed record type — missing permissions silently stop assignment and close the work item
- Notifications for record routing **only appear in Copilot Service workspace** — not in Customer Service Hub
- Work distribution mode: Push or Pick (unlike voice, which is Push only)
- Enabling unified routing in a production org runs a solution import — do this during **off-peak hours**

## When to use / skip
Use for any deployment where cases or email activities need intelligent routing (not just FIFO). Almost always in scope for Customer Service implementations.

## Configuration decisions
- Intake rules design — which workstream handles which record types and sub-types; multiple workstreams can exist for the same record type
- Push vs Pick — Pick mode is appropriate for back-office agents who manage their own queue; Push is the default for contact centre-style workflows
- Whether the 5-minute assignment cycle is acceptable for urgent records — if not, consider a Power Automate trigger for immediate assignment on priority cases

## Gotchas
- **Capacity doesn't release automatically for records.** Train reps and supervisors explicitly. "Closing a case" doesn't release capacity unless done correctly (resolve/cancel and clear queue item).
- **5-minute assignment cycle surprises clients.** Clients used to real-time conversation routing expect cases to be assigned instantly. For P1 escalations, discuss whether 5 minutes is acceptable.
- **Rep security permissions must be audited before go-live.** A custom Omnichannel role without Case Read access silently fails and closes the work item with no useful error.
- **Enable unified routing in dev/staging first.** The solution import can impact SQL load. Never enable in production without testing staging first.

## Consultant notes

- Security permissions audit before go-live is one I'd block the go-live on if it hasn't been done. Silent work item failure with no useful error message is a genuinely bad production issue to diagnose. Confirm Case Read (and any other routed record type) is in the agent security role before UAT starts.
- The 5-minute assignment cycle needs to be raised in requirements, not at go-live. If the client has P1 escalation SLAs measured in minutes, the cycle time is a problem that needs a Power Automate trigger workaround — and that's a design conversation, not a config one.
- Enable unified routing on staging first and run the solution import during off-peak hours. It's the kind of step that's easy to rush at the end of a project and regret if SQL load spikes on a shared production environment.

---

*Source last updated: 2025-09-16 | Review when: New record types supported or assignment cycle timing changes*
