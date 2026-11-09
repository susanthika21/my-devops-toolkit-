#!/usr/bin/env bash
# Description: Initial server setup, package updates, and security hardening

set -euo pipefail

echo "=========================================="
echo "Starting Server Setup & Configuration..."
echo "=========================================="

# 1. Update and upgrade system packages
echo "[+] Updating system package repositories..."
sudo apt-get update -y && sudo apt-get upgrade -y

# 2. Install essential utilities
echo "[+] Installing essential tools (curl, git, htop, ufw, fail2ban)..."
sudo apt-get install -y curl wget git htop ufw fail2ban unzip

# 3. Configure UFW Firewall
echo "[+] Configuring UFW firewall rules..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw --force enable

# 4. Enable and start Fail2ban
echo "[+] Enabling Fail2ban service..."
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "=========================================="
echo "Server setup completed successfully!"
echo "=========================================="
