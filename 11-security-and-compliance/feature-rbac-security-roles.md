# RBAC / Security Roles

**Category:** Security
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/security-roles-privileges

## What it does
D365 Contact Center security is enforced through a three-tier role structure: Dataverse roles provide base permissions, D365 Contact Center personas (Omnichannel Agent, Supervisor, Administrator) add product-specific capabilities, and experience profiles apply UI/feature restrictions at runtime. Agents, supervisors, and admins must be assigned both a Dataverse security role and an Omnichannel persona role to function.

## Key facts
- Out-of-the-box D365 Contact Center roles: Omnichannel Agent, Omnichannel Supervisor, Omnichannel Administrator
- Additional personas available: Customer Service Representative, Customer Service Manager, Customer Service Scheduler, Customer Service Agent
- Role inheritance is additive: more permissions add up, restrictions do not override permissions
- The Channel Integration Framework role grants rights to call CIF v2 APIs; not required for native OC agents
- Security roles control table access; experience profiles control feature visibility in the UI
- Privileges are function-driven, not table-driven: agents can see conversation context but not raw Contact records unless assigned CSR role
- The Omnichannel Administrator persona does not automatically grant admin access to Dynamics; must also assign System Administrator or System Customizer role

## When to use / skip
Use when defining who does what (take conversations, monitor teams, configure queues, view analytics). Don't build custom roles from scratch — OOB personas are heavily optimized. Don't assign System Administrator to all agents — grant minimal Omnichannel persona + base role.

## Configuration decisions
- Separate Omnichannel Agent from Omnichannel Supervisor by team, not by agent count: both roles are licensed per-seat
- Combine Omnichannel roles with Dataverse roles carefully; check privilege scope (Organization, Business Unit, User) to avoid scope creep
- Use experience profiles to hide advanced UI elements (e.g., agent scripts, productivity pane) from junior agents
- If agents also work Case or Article records, assign Customer Service Representative in addition to Omnichannel Agent
- Supervisors managing reports across multiple business units may need User-level scope on the Omnichannel Supervisor role

## Gotchas
- New roles take effect after sign-out/sign-in — cached permissions persist.
- Experience profiles don't restrict API access — JavaScript SDK calls work even if UI is hidden.
- Omnichannel Agent role alone doesn't grant Account/Contact/Case visibility. Agents operate on channel/routing context only.
- No Omnichannel persona = no agent interface load, even with valid Dataverse role.
- Pre-2022 roles may lack Omnichannel privilege sets. Check they've been updated.

## Consultant notes

- The three-tier model (Dataverse role + Omnichannel persona + experience profile) is the one most likely to be misunderstood in security design workshops. Clients often assume a single role assignment covers all three layers. Walk through a concrete example: an agent needs (1) the Dataverse CSR role for case visibility, (2) the Omnichannel Agent persona to load the workspace, and (3) an experience profile to control which tools they see. Each layer is configured in a different place and by a different mechanism.
- The "Omnichannel Agent alone doesn't grant Contact/Case visibility" limitation catches deployments that need reps to work cases as well as conversations. If the client's reps will be looking up customer records, creating cases, or logging outcomes in Dataverse entities during conversations, they'll also need the Customer Service Representative role. Clarify whether this is in scope during the role design session — adding it post-go-live requires a security change and UAT verification.
- Experience profiles control UI feature visibility but not API access. If the client has custom tabs built on the JavaScript SDK, those custom tabs can call the API regardless of what's hidden in the experience profile. This is a security design consideration if there are any features the client wants to restrict at a functional level rather than just visually — those restrictions need to be enforced at the API/Dataverse permission layer, not the experience profile layer.

---

*Source last updated: 2026-04-30 | Check this: Major security vulnerability released or role inheritance rules change*
