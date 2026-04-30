# Manage Copilot Features (Admin Configuration)

**Category:** Copilot and AI
**Applies To:** Standalone + embedded (feature availability varies)
**Source:** [learn.microsoft.com/.../configure-copilot-features](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-copilot-features)

## What it does
Top-level admin controls: opt in/out, manage regional data movement, enable features by rep population via experience profiles, configure agents, and assign role permissions.

## Key facts
- **Opt-in required** before any Copilot feature is available; opting out erases all training data with no recovery — do not opt out casually
- **GA in North America only**; all other regions are Preview (affects enterprise production readiness decisions)
- Regions with in-region Azure OpenAI (US, AU, IN, UK, GCC): no cross-region data movement needed; all other regions must enable data movement in Power Platform admin center
- **Custom security roles require explicit Copilot privileges** — default CSR role has all privileges; custom roles don't inherit them
- Admin Management agent is **Preview** — not recommended for production without evaluation
- Data sharing for Copilot features: when enabled, Microsoft may review customer data to improve Copilot; data is not used to train Azure OpenAI foundation models
- Copilot interaction transcripts stored in `msdyn_copilottranscriptdata` (optional, downloadable via API)

## When to use / skip
Required first step. Every Copilot capability flows through this configuration.

## Configuration decisions
- Cross-region data movement — confirm with the client whether their Power Platform admin center has this enabled or needs to be enabled for non-NA regions
- Experience profiles — use to granularly control which Copilot features are available to which rep populations (e.g. case summary only for senior agents)
- Data sharing consent — discuss with the client before enabling; it has data governance implications

## Gotchas
- **Custom roles are a blocker.** If the client uses custom security roles, Copilot won't work until explicit privileges are added. Audit roles early.
- **Opt-out is irreversible.** Training data deletes immediately. Never use opt-out as a troubleshooting step.

---

*Source last updated: check Microsoft Learn | Check this after Copilot GA expands to additional regions*
