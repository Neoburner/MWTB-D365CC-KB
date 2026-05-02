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
Use the companion app for embedded Contact Centre deployments (Salesforce, ServiceNow, custom CRM) that need voice. Skip it for Standalone Contact Centre or chat-only/email-only deployments.

## Configuration decisions
- **Deployment**: Manual, SCCM, or Intune. Intune is simplest for cloud-first orgs.
- **Updates**: Auto-update or pin to a version and test before rollout.
- **Firewall**: Whitelist Contact Centre domain and media relay servers.
- **Proxy**: Route through corporate proxy if needed (usually auto-detected).
- **QoS**: If you have QoS, tag audio streams from the companion app for priority.
- **Logging**: Enable verbose logging for troubleshooting. Plan to clean up the logs.
- **Uninstall policy**: Can agents remove it, or lock it down with MDM?
- **Multi-device**: If agents work from different machines, install on each.
- **Pilot testing**: Test new versions with a small group before org-wide rollout.

## Gotchas
- **Audio drivers break audio.** Some driver updates cause dropout. Keep a list of known-good driver versions.
- **Antivirus blocks it.** Overly aggressive endpoint protection quarantines the companion app. Whitelist it in your security policy.
- **Packet loss kills quality.** Loses >3% and audio tanks. Satellite or congested WiFi = problems.
- **Windows updates force restarts.** Aggressive update policies restart during shift and disconnect the app. Coordinate update schedules with ops.
- **Agents kill the background process.** They disable it to "free up resources" or while troubleshooting. Educate them or lock it down with MDM.
- **Multiple network adapters confuse the app.** It may bind to the wrong adapter. Requires manual setup.
- **Silent install needs admin.** SCCM/Intune deployments require admin privileges. Some orgs don't allow it; agents have to be involved.
- **Version mismatches break codec negotiation.** Two agents with different app versions try to transfer a call and it fails. Sync updates across teams.
- **Uninstall leaves junk in the registry.** Full cleanup requires manual registry work. Reinstalls may be incomplete.
- **No VDI version exists.** For Citrix or VMware Horizon, the app has to be in the VDI image, not the client machine. Contact Microsoft for guidance.

## Consultant notes

## Consultant notes

- Ask about VDI and Citrix in discovery, not in UAT. This is the most common late-breaking blocker for embedded voice deployments. If agents use Citrix or VMware Horizon, the companion app architecture changes entirely: the app goes in the VDI image, not the client machine, and there are audio driver and network path implications that need scoping separately.
- Admin privilege for install is a showstopper in locked-down enterprise environments. Confirm whether Intune or SCCM is available before scoping the rollout approach. Some clients can't do self-service install and need IT to visit every desk: account for that in the go-live timeline.
- Audio quality issues post-go-live almost always trace back to the local network, not the app. Run ACS network diagnostics from actual agent workstations (not the server room) before go-live. Satellite, congested Wi-Fi, and corporate proxy configurations are the usual culprits and they only show up when you test from the right seat.


---

*Source last updated: 2026-04-30 | Worth revisiting if agents report audio issues, Contact Centre breaks compatibility with the app, or if macOS/Linux support ships*
