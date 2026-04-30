# Role Persona Mapping

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../role-persona-mapping](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/role-persona-mapping)

## What it does
Maps security roles to the three Contact Center personas — Admin, Supervisor, Agent. Determines what each role can see and do in the workspace. OOB Omnichannel roles are pre-mapped. Primary value is enabling **custom security roles** to get the correct persona experience without using OOB roles.

## Key facts
- Three personas: **Admin** (routing config), **Supervisor** (monitoring, reassignment, insights), **Agent** (handle work items)
- OOB default mappings: Omnichannel Administrator → Admin, Omnichannel Supervisor → Supervisor, Omnichannel Agent → Agent
- **Roles must be directly assigned to users** — team/group-based role inheritance does not work for persona mapping
- Mapping a role to a persona does NOT automatically grant application access or form access — these require separate steps in Dynamics 365 (app module role grant + entity form security role)
- When creating custom roles: **copy from an existing Omnichannel role**, not from scratch — blank-slate custom roles reliably miss required minimum privileges
- Multiple roles can be mapped to one persona; role rank determines which wins if a user has multiple mappings

## When to use / skip
Most standard deployments don't need custom persona mapping — OOB roles work. Custom mapping is needed when the client requires bespoke security scopes (e.g. chat-only agents, BPO contractors, restricted supervisors).

## Configuration decisions
- **Which OOB role to copy from** when creating custom roles — copy the role closest to the intended permissions, then restrict; document which base role was copied
- **Direct assignment vs. team-based access** — the direct assignment requirement must be built into the IT onboarding process; teams-based access alone won't work

## Gotchas
- **Three-step grant process is commonly incomplete.** Clients create and map the custom role, then users can't log in because app access and form access weren't granted. Build all three steps into every custom role implementation checklist.
- **Direct assignment requirement creates IT friction.** Enterprise clients managing access through Azure AD groups or D365 teams need a parallel direct-assignment process for Omnichannel roles. Raise this during security design, not at go-live.

---

*Source last updated: 2025-04-15 | Check this: Team-based role assignment supported for persona mapping, or new personas added*
