
# Task 4 – Firewall Setup and Testing (Linux UFW)

## Objective
Configure and test basic firewall rules on Linux using **UFW (Uncomplicated Firewall)** to allow and block traffic on specific ports.  
Demonstrate rules for **Telnet (port 23)** and **SSH (port 22)** with before/after testing.

---

## Tools Used
- **Kali Linux**
- **UFW** – Uncomplicated Firewall
- **Telnet Client/Server** (`telnet`, `telnetd`)
- **OpenSSH Server**

---

## Steps Performed

### 1. Enable UFW
```bash
sudo ufw enable
sudo ufw status numbered
````

*UFW was inactive initially; enabling started the firewall on system startup.*

---

### 2. Block Telnet (port 23)

```bash
sudo ufw deny 23/tcp
sudo ufw status numbered
telnet localhost 23
```

*Result: Connection refused – Telnet blocked.*

---

### 3. Allow Telnet (port 23)

```bash
sudo ufw delete deny 23/tcp
sudo ufw allow 23/tcp
sudo ufw status numbered
telnet localhost 23
```

*Result: Telnet connected successfully to localhost and prompted for login.*

---

### 4. Allow SSH (port 22) and Block Telnet

```bash
sudo ufw allow 22/tcp
sudo ufw deny 23/tcp
sudo ufw status numbered
ssh localhost
```

*Result: SSH connected successfully; Telnet refused.*

---

### 5. Block SSH (port 22) and Allow Telnet

```bash
sudo ufw allow 23/tcp
sudo ufw deny 22/tcp
sudo ufw status numbered
ssh localhost
```

*Result: SSH connection refused; Telnet connected.*

---

### 6. Final Cleanup

```bash
sudo ufw disable
sudo ufw status
```

*Result: Firewall status inactive.*

---

## Outcome

* Learned how to enable/disable UFW.
* Created rules to **allow** and **deny** specific ports.
* Verified behavior using Telnet and SSH connections.
* Gained understanding of inbound rules and traffic filtering.
