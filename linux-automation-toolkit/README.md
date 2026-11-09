# 🐧 Linux Automation Toolkit 🚀

A collection of production-ready Bash scripting utilities designed for Linux system administration, automated backups, log management, and system health monitoring.

---

## 📋 Project Overview
This project provides lightweight, robust, and automated shell scripts to handle everyday server maintenance, resource tracking, and disaster recovery tasks efficiently on Linux environments.

---

## 🛠️ Tech Stack & Tools
* **Scripting Language:** Bash Shell Scripting
* **Environment:** Linux / Ubuntu
* **Automation & Alerts:** Cron Jobs & Postfix Email Notifications
* **Version Control:** Git & GitHub

---

## ⚙️ Included Scripts & Features
* **`setup.sh`:** Automates environment provisioning, package installations, and permission configurations for new Linux servers.
* **`backup.sh`:** Handles automated compression and archiving of designated application data or configuration directories with timestamped versions.
* **`log_cleanup.sh`:** Prevents disk space exhaustion by cleaning up stale logs or archiving older log files based on retention policies.
* **`health_check.sh`:** Monitors system health metrics (CPU utilization, available memory, disk space usage, and crucial services) with **Postfix** email notifications.

---

## 🚀 Getting Started & Usage

1. **Navigate to your toolkit directory:**
   ```bash
   cd linux-automation-toolkit/


2. **Make the scripts executable:**
   ```bash
   chmod +x *.sh

3.  **Run an individual script (e.g., the health check)::**
     ```bash
     ./health_check.sh
  
---

## 🔄 Toolkit Workflow & Automation

**Environment Setup:** Run setup.sh to configure initial server packages and structure

**Proactive Monitoring:** Use health_check.sh integrated with cron jobs to continuously monitor system resources and trigger Postfix alerts if thresholds fail.

**Maintenance & Recovery:** Schedule backup.sh and log_cleanup.sh to ensure consistent data snapshots and optimal disk utilization.

## **🤝 Author**

Susanthika - [GitHub Profile](https://github.com/susanthika21)
