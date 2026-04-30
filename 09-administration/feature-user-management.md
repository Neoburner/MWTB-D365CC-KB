# User Management

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../users-user-profiles](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/users-user-profiles)

## What it does
Configures reps so unified routing can assign work to them. Every rep must be a **Bookable Resource** — the underlying record routing uses for availability, skills, capacity, and queue membership. Two management surfaces: **Enhanced User Management** (modern, bulk-capable) and the classic Omnichannel tab (per-user).

## Key facts
- **Every rep must be configured as a Bookable Resource** — without it, unified routing never assigns them work; this is the most commonly missed setup step
- Enhanced User Management supports **bulk update of up to 200 users** at once (5 attributes per save step)
- Bulk-updatable attributes: Skills, Queues, Capacity profiles, Swarming designation
- Classic Omnichannel tab: sets unit-based capacity and default presence per user
- **Do not mix unit-based and profile-based capacity** in the same environment
- Unit-based capacity must be a multiple of the workstream's capacity unit value
- **Default presence** defaults to Available if not configured — ensure this is intentional
- Security roles must be assigned **directly to the user** — team/group-based inheritance doesn't satisfy persona mapping
- Bookable Resource work hour configuration requires **Universal Resource Scheduling** (Field Service, Project Service, or Service Scheduling licence)
- Skill deactivation (not removal) excludes a rep from skill-matched routing temporarily without deleting the skill from their profile

## When to use / skip
Required for every deployment — all reps need user management setup before routing can assign them work. Enhanced User Management is the right tool for any team with more than ~10 reps.

## Configuration decisions
- **Bookable Resource creation process** — must be built into the rep onboarding runbook, not treated as a one-time setup
- **Capacity approach** — choose one: unit-based or profile-based; don't mix
- **Default presence** — Available for standard reps; Busy for supervisors who self-manage availability

## Gotchas
- **Bookable Resource is separate from a D365 user account.** Creating a user doesn't automatically create a Bookable Resource. Every rep needs one explicitly created. Build it into onboarding — discovering at go-live that 30 reps aren't receiving work is a real scenario.
- **Direct assignment for security roles.** Teams/groups-based assignment doesn't work for persona mapping. Enterprise clients with group-based provisioning need a parallel direct-assignment process. Surface this during security design.
- **Queue membership for record routing.** Don't add reps directly to queues used for record routing — those queues use a different assignment mechanism. Adding them the wrong way causes unexpected behaviour.

---

*Source last updated: 2026-04-15 | Check this: Enhanced User Management adds new bulk capabilities, or Bookable Resource requirement changes*
