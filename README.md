# Fedora Setup Script

This script automates the post-installation setup for Fedora.

# Step 0: Prepare Fedora Server
sudo dnf update -y
sudo dnf install -y curl git

THEN RUN THE SCRIPT

✅ Features:
- Enables RPM Fusion (Free & Non-Free)
- Tweaks DNF for faster downloads
- Installs media codecs and Intel media driver
- Installs developer essentials (`curl`, `git`)

## 🚀 Usage

Run this after installing Fedora:

```bash
bash <(curl -sL https://raw.githubusercontent.com/7uisu/fedora-setup/main/post-install-fedora.sh)
