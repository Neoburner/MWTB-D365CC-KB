# Locale & Language Settings

**Category:** Administration
**Applies To:** Both
**Source:** https://learn.microsoft.com/en-us/dynamics365/customer-service/implement/language-settings

## What it does
Locale and language settings in D365 Contact Center control how dates, times, numbers, and currencies are displayed, and which languages are available in the agent interface. These settings apply at both the organisation level (environment defaults) and the user level (each agent's personal language preference). For multilingual contact centres, language settings also interact with real-time translation, knowledge article language variants, and bot language configurations.

## Key facts
- The Dataverse environment has a base language set at provisioning time — this is the primary language for system labels and cannot be changed after provisioning without significant migration effort
- Additional languages (display language packs) can be installed from the Power Platform admin centre for the environment — agents can then select their preferred interface language
- User-level language preference is set in the user's personal options in D365 — each agent can work in their preferred language if the language pack is installed
- Locale settings (date format, time format, number format, currency) are also user-level preferences — a UK agent sees DD/MM/YYYY; a US agent sees MM/DD/YYYY in the same environment
- Time zone settings are critical for contact centres with distributed teams — agent activity timestamps and schedule adherence reflect the agent's configured time zone
- Knowledge articles can be authored in multiple languages — each article can have language variants for different agent locales
- The chat widget language (customer-facing) is configured at the chat channel level, separately from the agent interface language
- Real-time translation (agent-side) is a separate feature from interface language — an agent can have a French interface and still translate Spanish customer messages

## When to use / skip
Language and locale configuration is relevant for any deployment with agents in multiple countries, multilingual agent teams, or customer-facing channels in multiple languages. For single-language, single-region deployments, the defaults are usually sufficient.

The critical decision is the base language at environment provisioning — this cannot be changed cheaply later.

## Configuration decisions
- Set the base language before provisioning the environment — for EU deployments with multilingual requirements, English is the most common base language (most Microsoft system labels and documentation are in English), with additional languages installed as language packs
- Install language packs for all required agent interface languages in the Power Platform admin centre — packs must be installed before users can select them as their interface language
- Train agents to set their personal locale and time zone preferences in their user settings — this is a one-time setup task per agent that's easy to overlook in go-live checklists
- For multilingual knowledge bases, plan the knowledge article authoring workflow — who creates the source article and who creates language variants? Translation can be manual or machine-assisted
- Ensure operating hours and WFM schedules use the correct time zones for each agent location — time zone errors in schedules cause adherence calculation issues

## Gotchas
- The base language is set at Dataverse provisioning and changing it requires a Microsoft support engagement and significant downtime risk. Decide the base language in discovery, not in build. For most organisations, English is the right base language even if the primary agent language is not English — the system labels and Microsoft's documentation are predominantly in English.
- Language packs installed later don't retroactively translate existing customisations — custom field labels, custom form section names, and custom app navigation items that were entered in the base language stay in the base language. Only Microsoft's out-of-the-box system labels are translated by the language pack.
- User time zone settings affect how the agent sees timestamps everywhere in CSW — conversation history, case timelines, analytics reports. An agent with the wrong time zone set will see timestamps that are hours off, which causes confusion about when conversations happened. Include time zone verification in the agent setup checklist.
- Chat widget language is independent of agent interface language. A customer typing in French to an English-configured widget won't get a French interface unless the widget is explicitly configured for French. Multilingual chat channel configuration is a separate design task.
- Number formatting (comma vs period as decimal separator) affects any custom forms or reports that display numeric values. Test custom forms in each locale that will be used — a field that displays correctly for US locale may show unexpected formatting for European locales.

## Consultant notes

- Language and locale is one of those setup tasks that gets left to the end and then causes problems. Agents who set up their preferences correctly work in the right locale; agents who never set them work with environment defaults that may not match their region. Include language/locale/time zone setup as a mandatory step in the agent onboarding checklist, not an optional personalisation.
- For multilingual deployments, the knowledge base language strategy needs to be agreed in design. "We need knowledge articles in five languages" is a content management and governance requirement, not just a D365 configuration task. Who owns each language variant? What's the update process when the source article changes? Who validates the machine-translated content? These are process questions that determine whether a multilingual knowledge base is sustainable or collapses under maintenance debt.
- The time zone issue in distributed WFM deployments is worth calling out specifically: WFM schedule generation uses the environment's default time zone unless individual agent time zones are configured. For a contact centre with agents in London, Dublin, and Warsaw, ensuring each agent has the correct time zone set is a non-negotiable go-live prerequisite — otherwise schedule adherence data is wrong from day one.

---

*Source last updated: 2026-04-30 | Revisit if Microsoft adds base language migration tooling or expands machine translation support for knowledge articles*
