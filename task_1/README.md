Based on the files you uploaded (`scan_results.txt`, `scan.xml`, and `scan.html`), here are the **correct, file-based answers** to each step in your task:

---

### ✅ **1. Install Nmap from official website**

Nmap was already available in Kali Linux and installed via terminal:

```bash
sudo apt install nmap
```

---

### ✅ **2. Find your local IP range**

Using:

```bash
ifconfig
```

You found:

* IP: `192.168.190.14`
* Subnet: `/24`

So, the local IP range was:

```text
192.168.190.0/24
```

---

### ✅ **3. Run: nmap -sS 192.168.1.0/24 to perform TCP SYN scan**

In your case (adapted to your range), you ran:

```bash
nmap -sS 192.168.190.0/24 -oN scan_results.txt -oX scan.xml
xsltproc scan.xml -o scan.html
```

This scanned 256 IPs on your subnet using a TCP SYN scan and saved the results in 3 formats.

---

### ✅ **4. Note down IP addresses and open ports found**

From your `scan_results.txt`:

| IP Address      | Open Port(s) | Service      |
| --------------- | ------------ | ------------ |
| 192.168.190.14  | 80/tcp       | HTTP         |
| 192.168.190.217 | 53/tcp       | DNS          |
| 192.168.190.145 | None         | All filtered |

📌 Total live hosts found: **3**
📌 Total open ports: **2** (one on each device)

---

### ✅ **5. Optionally analyze packet capture with Wireshark**

You did **not include a packet capture file**, so this step was **optional and skipped**.

Wireshark could have been used to observe:

* TCP SYN and SYN-ACK packets
* IP responses during the scan

---

### ✅ **6. Research common services running on those ports**

| Port | Protocol | Common Service | Description                                                                       |
| ---- | -------- | -------------- | --------------------------------------------------------------------------------- |
| 80   | TCP      | HTTP           | Used by web servers. Could expose admin panels or web apps.                       |
| 53   | TCP      | DNS            | Used for name resolution. Can be abused for data tunneling or reflection attacks. |

---

### ✅ **7. Identify potential security risks from open ports**

* **Port 80 (HTTP)**

  * Could expose web admin interfaces.
  * If unpatched, could allow XSS, SQLi, etc.

* **Port 53 (DNS)**

  * Can be used for **DNS tunneling** to exfiltrate data.
  * Could be part of **amplification attacks** if not secured.

* **192.168.190.145**
---

### ✅ **8. Save scan results as a text or HTML file**
* 📄 `scan_results.txt` — plain text
* 📄 `scan.xml` — raw XML output
* 📄 `scan.html` — styled and readable HTML report
