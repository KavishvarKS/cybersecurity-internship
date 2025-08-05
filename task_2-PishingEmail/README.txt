# 🛡️ Phishing Email Analysis – Task 2 (Cybersecurity Internship)

## 📄 Task Overview
This task involves analyzing a suspicious email to identify common phishing characteristics using both visual clues and email header analysis.

---

## 🔍 Phishing Indicators Identified

1. **Spoofed Sender Address**
   - `securitya@lindkedin.com` — the domain is misspelled (`lindkedin` instead of `linkedin`).

2. **Urgency Language**
   - “Unusual LinkedIn Account Sign-In” creates fear and urges the user to act quickly.

3. **Suspicious CTA Button**
   - “Review Account” button may redirect to a credential-harvesting site.

4. **Generic Message**
   - No personalization or recipient’s name used.

5. **Grammar**
   - While the grammar is subtle, phishing often includes minor errors.

---

## ✉️ Email Header Analysis

### Key Findings from Google Header Analyzer:

- **SPF**: `fail` with IP unknown  
- **DKIM**: `fail` with domain unknown  
- **DMARC**: `fail`  
- **Mail Origin**: `mail.hacker-domain.ru`  
- **Delay**: 3 minutes (possible abnormal routing)

### Interpretation:
- All key authentication checks failed — **strong indicator of spoofing**.
- Mail came from a suspicious server (`hacker-domain.ru`) not associated with LinkedIn.

---

## 🧠 Key Concepts

- **Phishing**: A cyberattack that tricks users into providing sensitive info by impersonating trusted sources.
- **Email Spoofing**: Forging sender information to make an email look legitimate.
- **Header Analysis**: Helps detect discrepancies and spoofed sources.
- **Social Engineering**: Tactics used to manipulate users emotionally (fear, urgency, etc.)

---


This exercise built awareness around phishing email structures and showed how to use email headers to verify authenticity. It helped develop skills to detect and respond to phishing threats effectively.

