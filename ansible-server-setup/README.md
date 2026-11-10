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

## 🔍 Deep Dive: Core Files Explained
**1. The Inventory File (hosts.ini)**

The inventory file is a plain-text configuration file where you list and organize all the target     servers (nodes) that Ansible needs to manage, configure, or deploy to.

**Why we use it & What it does:**

- **Separation of Concerns:** It separates where your automation runs from what your automation does. Your playbook defines the actions, while the inventory defines the targets.

- **Grouping:** It allows you to organize servers into logical groups (e.g., [webservers], [databases], [servers]), enabling you to run automation on specific environments (like Staging or Production) simultaneously.

- **Connection Parameters:** It stores crucial connection metadata for each host, such as IP addresses (ansible_host), SSH users (ansible_user), private key paths (ansible_ssh_private_key_file), or connection types (ansible_connection=local for local execution).
ex:

   ```Ini, TOML
   [servers]
   server1 ansible_connection=local 

**2. The Playbook File (playbook.yml)**

The playbook is the core automation script written in YAML. It acts as a blueprint or recipe that dictates the exact sequence of tasks Ansible will execute on your target servers.

**Why we use it & What it does:**

- **Declarative Automation:** Instead of writing complex bash scripts with manual error checking, playbooks let you declare the desired state of the system (e.g., "Package X must be installed," or "Directory Y must exist with permissions 0755"). Ansible figures out how to achieve that state safely.

- **Idempotency:** Ansible tasks are designed to be idempotent—meaning you can run the playbook multiple times safely. If the software is already installed or the directory already exists, Ansible skips it instead of breaking or recreating it unnecessarily.

- **Privilege Escalation (become: yes):** It handles administrative privileges securely, automatically invoking sudo when tasks require root access to modify system packages or configuration files.

## **Example Tasks in Your Playbook:**

**Package Management:** Updates the apt cache and ensures essential tools (git, curl, htop, vim, ufw) are present.

**Directory Provisioning:** Automatically provisions custom deployment paths (like /opt/app) with strict file permissions and ownership (root:root).

## 🤝 Author
* **Susanthika** - [GitHub Profile](https://github.com/susanthika21)
