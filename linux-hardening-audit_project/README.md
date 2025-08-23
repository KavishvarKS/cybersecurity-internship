# 🛡️ Linux Hardening Audit Tool

A step-by-step security auditing tool for Linux systems.  
This project is structured in **phases** to show progress over time.

---

## 📌 Phase 1: Core Setup & Data Collection (✅ Done)

- Collects system info (OS, kernel, uptime, hostname, users)
- Checks firewall rules and lists open ports
- Parses SSH config (`/etc/ssh/sshd_config`) → flags root/password login
- Verifies permissions of `/etc/passwd` and `/etc/shadow`
- Lists active & enabled services
- Runs rootkit/malware scans (if `chkrootkit` or `rkhunter` installed)

👉 Run with:

```bash
chmod +x audit.sh
./audit.sh
