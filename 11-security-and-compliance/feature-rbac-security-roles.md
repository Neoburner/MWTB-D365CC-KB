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
Use RBAC/security roles when defining who can perform specific contact center functions (take conversations, monitor teams, configure queues, view analytics). Skip attempts to build custom roles from scratch without leveraging the out-of-the-box personas; they are heavily optimized for the product's event-driven architecture. Do not assign Dataverse System Administrator to all agents—grant only the minimal Omnichannel persona and a base security role (e.g., Basic User).

## Configuration decisions
- Separate Omnichannel Agent from Omnichannel Supervisor by team, not by agent count: both roles are licensed per-seat
- Combine Omnichannel roles with Dataverse roles carefully; check privilege scope (Organization, Business Unit, User) to avoid scope creep
- Use experience profiles to hide advanced UI elements (e.g., agent scripts, productivity pane) from junior agents
- If agents also work Case or Article records, assign Customer Service Representative in addition to Omnichannel Agent
- Supervisors managing reports across multiple business units may need User-level scope on the Omnichannel Supervisor role

## Gotchas
- Newly assigned roles take effect only after agent sign-out and sign-in; cached permissions persist
- Experience profiles do not restrict API access—JavaScript SDK calls will still work even if UI is hidden
- The Omnichannel Agent role alone does NOT grant ability to see Accounts, Contacts, or Cases; agents operate on context passed by the channel/routing system
- If an agent has no assigned Omnichannel persona, they cannot load the agent interface, even with a valid Dataverse role
- Security roles created before 2022 may lack Omnichannel privilege sets; ensure role has been updated

---

*Source last updated: 2026-04-30 | Review when: Major security vulnerability released or role inheritance rules change*
