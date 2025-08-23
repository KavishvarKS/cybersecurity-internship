#!/bin/bash
# ===============================
# Linux Audit Tool - Phase 1
# Core Setup & Data Collection
# ===============================

OUTPUT="audit_phase1_report.txt"
echo "=== Linux Audit Tool - Phase 1 Report ===" > $OUTPUT
echo "Generated on: $(date)" >> $OUTPUT
echo "" >> $OUTPUT

# 1. System Info
echo "[*] Collecting system information..." >> $OUTPUT
echo "OS & Kernel:" >> $OUTPUT
cat /etc/os-release >> $OUTPUT
uname -r >> $OUTPUT
echo "Uptime: $(uptime -p)" >> $OUTPUT
echo "Hostname: $(hostname)" >> $OUTPUT
echo "Logged-in users:" >> $OUTPUT
who >> $OUTPUT
echo "" >> $OUTPUT

# 2. Firewall & Open Ports
echo "[*] Checking firewall rules & open ports..." >> $OUTPUT
sudo ufw status verbose >> $OUTPUT 2>/dev/null || echo "UFW not installed" >> $OUTPUT
sudo iptables -L -v -n >> $OUTPUT 2>/dev/null || echo "iptables not installed" >> $OUTPUT
ss -tulnp >> $OUTPUT
echo "" >> $OUTPUT

# 3. SSH Config
echo "[*] Checking SSH configuration..." >> $OUTPUT
grep -Ei 'permitrootlogin|passwordauthentication' /etc/ssh/sshd_config >> $OUTPUT
echo "" >> $OUTPUT

# 4. File Permissions
echo "[*] Checking critical file permissions..." >> $OUTPUT
ls -l /etc/passwd /etc/shadow >> $OUTPUT
stat /etc/passwd /etc/shadow >> $OUTPUT
echo "" >> $OUTPUT

# 5. Services
echo "[*] Listing active and enabled services..." >> $OUTPUT
systemctl list-units --type=service --state=running >> $OUTPUT
systemctl list-unit-files --type=service | grep enabled >> $OUTPUT
echo "" >> $OUTPUT

# 6. Rootkit / Malware Scan
echo "[*] Running rootkit/malware scans (if available)..." >> $OUTPUT
command -v chkrootkit &>/dev/null && sudo chkrootkit >> $OUTPUT || echo "chkrootkit not installed" >> $OUTPUT
command -v rkhunter &>/dev/null && sudo rkhunter --check --sk >> $OUTPUT || echo "rkhunter not installed" >> $OUTPUT
echo "" >> $OUTPUT

echo "=== Phase 1 Data Collection Completed ===" >> $OUTPUT
echo "Results saved in $OUTPUT"

