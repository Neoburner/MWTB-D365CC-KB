# Experience Profiles

**Category:** Administration
**Applies To:** Standalone + embedded
**Source:** [learn.microsoft.com/.../create-agent-experience-profile](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/create-agent-experience-profile)

## What it does
Defines the workspace experience for reps and supervisors, which session templates, channels, productivity tools (Copilot, knowledge search, agent scripts, etc.), and inbox features are available. Multiple profiles for different teams or roles. OOB profiles provided but cannot be modified.

## Key facts
- Requires **App Profile Manager Administrator** role to create/manage profiles
- Three OOB profiles (cannot be edited or deleted): Omnichannel default, Customer Service workspace default, Customer Service workspace + channels default
- **Three assignment methods:** Direct (explicit user assignment), Role-based (security role → profile mapping with rank for conflict resolution), Default (fallback for unassigned users)
- **Only one profile can be set as default at a time**
- When a profile is set as default, role-based assignments are **removed** from it
- **Team membership is not supported** for role-based profile assignment: must use direct security role assignment
- Productivity pane tools toggleable per profile: Copilot, Knowledge search, Agent scripts, Teams chat, Smart assist, Screen recording, and more
- Unique name format: `<prefix>_<name>`

## When to use / skip
Every deployment uses experience profiles, OOB defaults work for simple single-team deployments. Create custom profiles when different rep populations need different tool sets or Copilot access levels.

## Configuration decisions
- **Profile taxonomy**: base on distinct capability requirements, not org chart structure; avoid creating near-identical profiles per team
- **Role-based vs. direct assignment**: role-based is the only scalable approach for large deployments; direct assignment is appropriate for small/pilot groups
- **Which productivity pane tools to enable per profile**: Copilot must be toggled on per profile even if it's enabled environment-wide
- **Inbox view on or off**: some clients prefer all-work-items inbox view; others prefer the session/conversation-first approach

## Gotchas
- **Copilot not appearing for a rep?** Check their experience profile: Copilot must be toggled on in the Productivity pane settings. It's the first diagnostic step before deeper troubleshooting.
- **Setting a profile as default removes all role-based assignments from it.** If role assignments exist and you set it as default, they're gone.
- **Team membership doesn't work for profile assignment**: direct security role assignment only. Enterprise clients relying on security groups/teams need a parallel direct-assignment process.

## Consultant notes

- Experience profiles are where the "Copilot isn't showing up" support ticket usually starts. Check the profile Productivity pane settings before going anywhere else in the troubleshooting tree. It's enabled environment-wide, it's licensed, and yet it's not visible: nine times out of ten it's the profile toggle. Make it the first item in any Copilot access diagnostic.
- Design the profile taxonomy against capability requirements, not the org chart. Clients instinctively want a profile per team ("we want a Billing Team profile and a Cancellations Team profile") even when both teams need identical tools. Profiles based on distinct capability differences (chat-only agents vs. voice+chat agents, standard reps vs. supervisors) are easier to maintain and result in fewer near-identical profiles drifting out of sync post-go-live.
- The "setting as default removes role-based assignments" behaviour is the one most likely to cause an incident during profile reorganisation post-go-live. If a client decides to restructure their profiles months after go-live, this gotcha will catch someone out. Add it to the admin knowledge transfer so whoever inherits the environment knows about it.

---

*Source last updated: 2026-04-03 | Check this: New productivity pane tools added, or profile assignment logic changes*
