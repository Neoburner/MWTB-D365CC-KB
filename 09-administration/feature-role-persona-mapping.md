# Role Persona Mapping

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../role-persona-mapping](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/role-persona-mapping)

## What it does
Maps security roles to the three Contact Center personas, Admin, Supervisor, Agent. Determines what each role can see and do in the workspace. OOB Omnichannel roles are pre-mapped. Primary value is enabling **custom security roles** to get the correct persona experience without using OOB roles.

## Key facts
- Three personas: **Admin** (routing config), **Supervisor** (monitoring, reassignment, insights), **Agent** (handle work items)
- OOB default mappings: Omnichannel Administrator → Admin, Omnichannel Supervisor → Supervisor, Omnichannel Agent → Agent
- **Roles must be directly assigned to users**: team/group-based role inheritance does not work for persona mapping
- Mapping a role to a persona does NOT automatically grant application access or form access: these require separate steps in Dynamics 365 (app module role grant + entity form security role)
- When creating custom roles: **copy from an existing Omnichannel role**, not from scratch: blank-slate custom roles reliably miss required minimum privileges
- Multiple roles can be mapped to one persona; role rank determines which wins if a user has multiple mappings

## When to use / skip
Most standard deployments don't need custom persona mapping, OOB roles work. Custom mapping is needed when the client requires bespoke security scopes (e.g. chat-only agents, BPO contractors, restricted supervisors).

## Configuration decisions
- **Which OOB role to copy from** when creating custom roles: copy the role closest to the intended permissions, then restrict; document which base role was copied
- **Direct assignment vs. team-based access**: the direct assignment requirement must be built into the IT onboarding process; teams-based access alone won't work

## Gotchas
- **Three-step grant process is commonly incomplete.** Clients create and map the custom role, then users can't log in because app access and form access weren't granted. Build all three steps into every custom role implementation checklist.
- **Direct assignment requirement creates IT friction.** Enterprise clients managing access through Azure AD groups or D365 teams need a parallel direct-assignment process for Omnichannel roles. Raise this during security design, not at go-live.

## Consultant notes

- Custom roles need to be built by copying from an existing Omnichannel role, not from scratch. This is genuinely worth restating every time a client asks to create a bespoke role: blank-slate security roles in D365 reliably miss the minimum privilege set that Omnichannel requires to function, producing login failures and missing features that are tedious to diagnose attribute by attribute. Start from the OOB role closest to the requirement and restrict from there.
- The three-step grant process (custom role created → persona mapped → app access + form access granted) is the one that gets missed most frequently when the work is split across consultants or between the project team and the client's IT team. Put all three steps in a single checklist and assign them to a single person. If step three lands with someone who didn't do steps one and two, it routinely gets missed because they assume it was handled earlier.
- For standard deployments where the client has no unusual security requirements, OOB roles are almost always sufficient. Custom mapping adds ongoing maintenance overhead: every time a new feature is released, the custom role may need updating to include the new privilege. Scope custom roles only when there is a specific, documented requirement that OOB roles can't meet.

---

*Source last updated: 2025-04-15 | Check this: Team-based role assignment supported for persona mapping, or new personas added*
