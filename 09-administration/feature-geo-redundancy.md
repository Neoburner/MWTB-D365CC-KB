# Geo-Redundancy & Failover

**Category:** Administration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/geo-redundancy

## What it does
Geo-redundancy in D365 Contact Center refers to Microsoft's infrastructure-level availability mechanisms, how the platform handles regional Azure outages, ACS failures, and Power Platform service disruptions. This is distinct from contact centre business continuity planning (how the client routes calls if the system is down), which is an architecture decision the client must design. Microsoft provides the platform resilience; the client designs the operational fallback.

## Key facts
- D365 / Dataverse SLA: Microsoft guarantees 99.9% uptime for the Dataverse service; the full contact centre SLA involves multiple components (Dataverse + ACS + Copilot Studio) each with their own SLAs
- Azure Communication Services SLA: 99.9% uptime for the voice/messaging APIs
- In a regional Azure outage: Dataverse has regional failover for some configurations (paired region standby); ACS regional failover depends on the ACS resource configuration and region
- There is no automatic failover for D365 Contact Center to a different region: if the primary Azure region for the Dataverse environment has an outage, the contact centre goes offline until Microsoft restores service
- The client's responsibility for business continuity: design a fallback contact path (published PSTN number that bypasses D365, email acknowledgement, website message) for when the system is unavailable
- Data residency and geo-redundancy interact: for clients with strict data residency requirements (EU only), geo-redundancy to a non-EU region is not permitted; this constrains failover options
- Microsoft publishes service health status at status.microsoft.com: clients should monitor this during incidents rather than relying solely on internal monitoring

## When to use / skip
Every production deployment should have a documented business continuity plan that covers D365 Contact Center outage scenarios, what happens to inbound calls, how agents handle contacts, and when to activate fallback. The "use" question is less about D365 configuration and more about architectural planning and client process.

For clients with very high availability requirements (99.99%+), the D365 Contact Center platform's 99.9% SLA may not be sufficient. These clients need either a multi-platform architecture (D365 + legacy system as hot standby) or explicit acceptance that D365's SLA is within their tolerance.

## Configuration decisions
- Document the expected availability SLA for the contact centre against each component: Dataverse, ACS, Copilot Studio, Azure AI services: the effective system SLA is the product of all component SLAs
- Design and document a business continuity plan for system unavailability: what is the published fallback number, what do agents do, how is customer communication managed, when is the fallback activated?
- For organisations that require a warm standby D365 environment: this is a significant additional infrastructure cost (a second Dataverse environment, second ACS resource, active-passive configuration) and is not a standard out-of-the-box capability: it requires custom architecture and operational procedure
- Subscribe to Microsoft 365 Service Health alerts for Dynamics 365 and Power Platform: this is the fastest way to know about platform issues (faster than agent reports of "the system is down")
- Test the business continuity plan at least once before go-live: a failover procedure that's never been practised will not work under pressure

## Gotchas
- Microsoft's 99.9% uptime SLA means up to ~8.7 hours of unplanned downtime per year is within SLA. For a contact centre running 8–12 hours per day, this could be a significant service disruption. If the client has never considered this and assumes "cloud = always up," have the conversation before they're surprised by their first incident.
- ACS regional incidents can affect voice independently of Dataverse being healthy. A Dataverse-healthy, ACS-degraded state produces a contact centre where agents can log in, see their queues, but cannot handle voice calls. Design monitoring for both components separately.
- Copilot Studio is a separate service with its own availability. If Copilot Studio has an outage, AI agent (bot) handling stops, and calls route directly to human agents: typically increasing inbound queue depth significantly. Design routing rules that gracefully handle bot unavailability (e.g., a fallback queue configuration for direct human routing).
- There is no built-in "maintenance mode" for D365 Contact Center: if a configuration change causes a service degradation, there's no one-click rollback. Change management and testing in a non-production environment before applying to production is the primary mitigation.

## Consultant notes

- Business continuity planning is a client responsibility but it often falls into a gap between the IT team (who think about infrastructure) and the operations team (who think about staffing). The contact centre consultant should prompt this conversation and get both teams in the room. The output should be a documented BCP that covers: what triggers failover activation, who makes the call to activate, what the fallback process is, and how the team is notified. A BCP that exists only in someone's head is not a plan.
- The Copilot Studio outage scenario is worth specifically including in BCP planning. In a contact centre where 40% of contacts are handled by AI agents, a Copilot Studio outage doubles the inbound queue for human agents instantly. The operations plan needs to cover how to surge staff quickly in response: on-call agents, supervisor-to-agent conversion, reduced handle time targets for the duration.
- For clients with 99.99% availability requirements, be direct: D365 Contact Center's platform SLA is 99.9% and Microsoft does not currently offer a geo-replicated warm standby option as a supported out-of-the-box capability. If 99.99% is a hard requirement, either the client needs to accept the risk of the gap, design a multi-platform architecture, or revisit whether D365 Contact Center is the right platform.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds geo-redundancy options or changes the service SLA commitments for Contact Center components*
