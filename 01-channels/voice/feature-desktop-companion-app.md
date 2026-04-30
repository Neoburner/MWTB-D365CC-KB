# Desktop Companion App (Embedded Voice)

**Category:** Voice / Infrastructure
**Applies To:** Embedded (Salesforce, ServiceNow, custom third-party CRM)
**Source:** [Configure Desktop Companion App - Microsoft Learn](https://learn.microsoft.com/en-us/dynamics365/contact-center/administer/configure-desktop-companion-app)

## What it does
The Desktop Companion App is a Windows-based application that agents install locally on their computers to enable voice calling in D365 Contact Center embedded deployments. In embedded scenarios (Contact Center embedded in Salesforce, ServiceNow, or other third-party CRM), the browser-based Contact Center widget cannot directly access the system microphone and speaker for audio. The companion app bridges this gap by handling the audio stream, packet delivery, and codec negotiation between the web widget and the PSTN or IP phone network.

## Key facts
- Required for embedded Contact Center deployments that support voice (Salesforce, ServiceNow, custom CRM portals)
- Not required for Standalone Contact Center (desktop browser communicates directly with audio subsystem)
- Windows-only: No macOS or Linux version currently available
- Installed per-user; each agent on their machine must run the companion app
- Runs as a system service (background process); minimal visible UI after startup
- Requires local administrator privileges to install (MDM/Intune required for enterprise scale)
- Supported Windows versions: Windows 10 (build 19041+), Windows 11
- Minimum hardware: 2 GB RAM, 100 MB disk space, 100 Mbps network connection recommended
- Automatic update mechanism: New versions push via Microsoft Update or Intune; agents cannot decline updates
- No backward compatibility: A newer Contact Center version may require a newer companion app version; version mismatch disables voice
- Firewall exceptions auto-configured during install; requires outbound HTTPS (443) and UDP (5004–5017) for RTP audio streams
- Companion app logs troubleshooting data to local C:\ProgramData\Microsoft\Contact Center logs directory

## When to use / skip
**Use the Desktop Companion App** if you're deploying Contact Center embedded in Salesforce (via Lightning Web Components), ServiceNow (via ServiceNow Store app), or a custom CRM portal, and agents need voice capability. **Skip it** if you're using Standalone Contact Center (agents access via dedicated web app or dedicated Dynamics 365 tab) or if you don't need voice (chat/email-only deployments don't require the app).

## Configuration decisions
- **Deployment method**: Manual install (agents download and run installer), SCCM (System Center Configuration Manager), or Intune (modern MDM for cloud-first orgs)
- **Auto-update policy**: Allow automatic updates (simplest) or pin to a specific version and test updates before rolling out
- **Firewall configuration**: Whitelist Contact Center domain and media relay servers in corporate firewalls
- **Proxy support**: If your network uses a proxy, configure the companion app to route through it (usually auto-detected but may need manual setup)
- **Network bandwidth reservation**: If QoS is implemented, tag audio streams from the companion app to ensure priority
- **Logging and diagnostics**: Enable verbose logging for troubleshooting (increases local log size; plan cleanup strategy)
- **Uninstall policy**: Can agents uninstall the app, or should it be locked down via MDM?
- **Multiple machine support**: If agents work from multiple devices (office, home, laptop), install the companion app on each
- **Upgrade testing**: Test new companion app versions in a pilot group before organization-wide rollout

## Gotchas
- Incompatible driver versions: Some audio driver updates can cause audio dropout with the companion app; maintain a validated list of compatible drivers
- Antivirus false positives: Aggressive antivirus/endpoint protection may quarantine or block the companion app; whitelist the executable and service in your security policy
- Network packet loss sensitivity: The companion app is sensitive to packet loss >3%; high-jitter networks (satellite, congested WiFi) cause audio quality issues
- Windows update conflicts: Aggressive Windows update policies may force restarts during shift, disconnecting the companion app; coordinate update schedules with contact center operations
- Agent behavior: Agents may kill the background process to "free up resources" or disable it if troubleshooting; educate agents and consider MDM lock-down
- Dual-SIM/multi-network confusion: If a machine has multiple network adapters, the companion app may bind to the wrong one; requires manual configuration
- Silent installation limitations: If deploying via SCCM/Intune, the installer must run with admin privileges; some orgs restrict this, requiring agent involvement at install time
- Version skew: If one agent has a newer companion app than another and they transfer a call, codec negotiation may fail; synchronize update rollouts across teams
- Uninstall leaves registry entries: Removing the app doesn't fully clean up Windows registry; reinstalls may be incomplete
- No companion app for remote/VDI scenarios: If agents work in a Citrix, VMware Horizon, or similar virtual desktop, the companion app must be installed in the VDI image, not on the client; contact Microsoft for VDI-specific guidance

---

*Source last updated: 2026-04-30 | Review when: Agents report audio quality issues, Contact Center updates introduce breaking changes to companion app, or if you're expanding to non-Windows platforms (currently unsupported)*
