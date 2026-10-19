# NPC Capstone: Malware Analysis Sandbox Using VirtualBox

## Scope and status

This repository documents a Kali Linux VirtualBox lab: network-isolation checks, harmless system observation, SHA-256 recording, snapshot restoration, a local TCP text test, and a lookup of an existing VirusTotal EICAR report.

**Important limitation:** A genuine reverse-shell/bind-shell experiment, malware execution, and Wireshark capture of malware behavior were not completed. The local TCP text test is not a shell. The VirusTotal lookup was for the harmless EICAR test file and is not evidence of malware execution in this VM.

## Lab configuration

- VM: `kali-linux-2026.2-virtualbox-amd64`
- Baseline snapshot: `Clean-Baseline`
- Network adapters 1–4: disabled in final settings check
- Shared Folders: empty
- Checks used: `ip -br address`, `ip route`
- Script SHA-256 recorded during the practical: `81cf4d1341fee6d511ba925155dd3e85d028c1a53ee8a26ab83221690c173d8c`

The included script is a copy of the harmless observation script. Recalculate its hash after download before asserting that it exactly matches the practical copy.

## Observations

- `lo`: `127.0.0.1/8`, `::1/128`
- `docker0`: `DOWN`, `172.17.0.1/16`
- No default route was shown.
- The script output showed user/hostname `kali`, PID `4353`, and parent PID `2993`.
- After restoring `Clean-Baseline`, the interface/route checks showed the same isolated configuration.
- A later `sudo ss -lntp` showed `containerd` (PID 728) listening on `127.0.0.1:44263`. This was not the Netcat test listener and was left untouched.

## Local TCP test

Netcat exchanged the text `NPC Capstone local communication test` over `127.0.0.1:4444`. This verifies local loopback TCP text communication only; it does not execute commands or demonstrate a reverse shell/bind shell.

## VirusTotal EICAR report

The existing report identified a 68-byte EICAR antivirus test file. EICAR is harmless and is used to test antivirus detection.

- MD5: `44d88612fea8a8f36de82e1278abb02f`
- SHA-1: `3395856ce81f2b7382dee72602f798b642f14140`
- SHA-256: `275a021bbfbf6489e54d4718999f7db9d1663fc695ec2fe2a2c4538aabf651fd0f`
- First submission shown: `2006-05-22 12:42:02 UTC`
- First seen in the wild shown: `2012-06-14 17:16:14 UTC`
- Last submission shown: `2026-10-19 08:50:30 UTC`
- Last analysis shown: `2026-10-19 08:47:46 UTC`

The page showed many engines labeling it as an EICAR test file; some engines showed undetected or unable to process. VirusTotal relations are historical report associations and do not prove that this VM contacted those domains/IPs or created related files.

## Evidence screenshots

Add genuine screenshots you saved to `screenshots/`, such as:

1. `01-network-isolation-check.png`
2. `02-sandbox-process-observation.png`
3. `03-script-sha256-hash.png`
4. `04-script-source-code.png`
5. `05-snapshot-restoration-verification.png`
6. `06-virustotal-detection.png`
7. `07-virustotal-details.png`
8. `08-virustotal-relations.png`
9. `09-local-tcp-test.png`
10. `10-virtualbox-network-settings.png`

Screenshots are not included automatically; add your actual captures.

## Conclusion and remaining work

Completed work covers isolation checks, system/process observation, script hash recording, snapshot recovery, local TCP text communication, and review of an existing EICAR report. A genuine reverse-shell/bind-shell demonstration, malware execution, and Wireshark dynamic analysis remain incomplete.
