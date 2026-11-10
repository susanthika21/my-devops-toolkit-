# Automated Server Setup using Ansible 🚀

An Infrastructure as Code (IaC) project demonstrating how to automate baseline server configuration, package management, and directory provisioning on Linux using Ansible.

## 📋 Project Overview

This project automates the manual effort required to set up a fresh Linux server. Instead of manually logging in and running installation commands, an Ansible playbook is used to declare the desired system state,ensuring system packages are updated, essential utilities are installed, and deployment directories are securely provisioned.

## 🛠️ Tech Stack & Tools

- **Configuration Management & IaC:** Ansible (installed via `pipx`)
- **Target OS:** Linux (Ubuntu/Debian)
- **Version Control:** Git & GitHub
- **Execution Environment:** Linux Terminal / WSL

## ⚙️ Prerequisites

Before running this playbook, make sure you have the following installed on your control node:
- Python 3 & `pipx`
- Ansible (`core 2.21+`)
- SSH client (for remote server connections)

## 🚀 Getting Started & Execution

- 1. **Clone the repository:**
   ```bash
   git clone [https://github.com/susanthika21/my-devops-toolkit-.git](https://github.com/susanthika21/my-devops-toolkit-.git)
   cd my-devops-toolkit-/ansible-server-setup
   
- 2. **Configure your Inventory (hosts.ini):**
   
    Update your inventory file to target either your local machine or a remote server IP address:

   ```Ini, TOML
    [servers] 
    server1 ansible_connection=local
     #Or for a remote server:
     #server1 ansible_host=YOUR_SERVER_IP ansible_user=ubuntu ansible_ssh_p
 
- 3. **Run the Ansible Playbook:**
   
    Execute the automation playbook with elevated privileges (sudo):

   ```bash
   ansible-playbook -i hosts.ini playbook.yml --ask-become-pass

---
## 🔄 What the Playbook Automates
- **System Update:** Updates and refreshes the apt package cache.

- **Utility Tool Installation:** Automatically installs essential developer and administrative tools (git, curl, wget, htop, vim, ufw).

- **Directory Provisioning:** Creates a secure custom deployment directory at /opt/app with proper ownership (root:root) and file permissions (0755).

## 🤝 Author
Susanthika - (GitHub Profile) [https://github.com/susanthika21]
