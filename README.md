# Fedora Setup Script

A simple script to automate post-installation setup for **Fedora Server** or **minimal Fedora Workstation**.

---

## ⚙️ Step 0: Prepare Fedora

Before using the script, update your system and install required tools:

```bash
sudo dnf update -y
sudo dnf install -y curl git

---

## 🛠️ What This Script Does

This script configures a clean Fedora system with:

- ✅ RPM Fusion (Free & Non-Free) repositories
- ✅ Optimized DNF config (parallel downloads, fastest mirror)
- ✅ Multimedia codecs (FFmpeg, Intel media driver)
- ✅ Developer essentials: `curl`, `git`
- ✅ ❓ **Optional Hyprland desktop installation** (choose from 2 community options)

---

## 🙏 Credits

Special thanks to:

- **[@JaKooLit](https://github.com/JaKooLit)** for the full Hyprland installer and pre-configured dotfiles
- **[@shell-ninja](https://github.com/shell-ninja)** for the modular Hyprconf Hyprland installer with gum UI

Their work is included as optional components in this script.
