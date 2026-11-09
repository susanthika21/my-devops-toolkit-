# 🐧 Linux Automation Toolkit

A collection of production-ready Bash scripting utilities designed for Linux system administration, automated backups, log management, and system health monitoring.

---

## 📂 Project Structure

```text
linux-automation-toolkit/
├── setup.sh          # System setup and initial configuration
├── backup.sh         # Automated backup script for critical directories
├── log_cleanup.sh    # Automated log rotation and cleanup utility
└── health_check.sh   # System resource monitoring with Postfix email alerts

⚙️ Included Scripts & Features
1. health_check.sh
Purpose: Monitors system health metrics (CPU utilization, available memory, disk space usage, and crucial services).

Automation: Configured with Postfix email alerts to automatically notify administrators if any resource threshold is breached or if a service fails.

2. backup.sh
Purpose: Handles automated compression and archiving of designated application data or configuration directories.

Features: Generates timestamped archives for easy version tracking and disaster recovery.

3. log_cleanup.sh
Purpose: Prevents disk space exhaustion by cleaning up stale logs or archiving older log files based on retention policies.

4. setup.sh
Purpose: Automates environment provisioning, package installations, and permission configurations for new Linux servers or local development environments.

🚀 Getting Started & Usage
Make sure the scripts have executable permissions before running them on your Linux environment:

Bash
chmod +x *.sh

Run an individual script (e.g., the health check):

Bash
./health_check.sh

*(If using `nano`, press **`Ctrl + O`**, then **`Enter`** to save, and **`Ctrl + X`** to exit the editor).*

---

### **Step 3: Push your new README to GitHub**

Now, save this change to your Git repository and push it live:

```bash
git add README.md
git commit -m "Add comprehensive README.md for linux-automation-toolkit"
git push origin main
