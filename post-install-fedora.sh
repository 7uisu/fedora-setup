#!/bin/bash

echo "📦 Updating DNF configuration..."
sudo tee /etc/dnf/dnf.conf > /dev/null <<EOF
[main]
max_parallel_downloads=10
fastestmirror=True
EOF

echo "🔄 Updating system..."
sudo dnf update -y

echo "🔗 Adding RPM Fusion Free and Non-Free repos..."
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "📦 Installing appstream data, additional codec and media drivers..."
sudo dnf install -y rpmfusion-\*-appstream-data
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing
sudo dnf update -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf install -y intel-media-driver

echo "📦 📦 Installing DVD support libraries... (I know, who uses it, but you never know)"
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y libdvdcss

echo "✅ Base Fedora setup complete!"
echo ""

# 🔧 Optional Hyprland installation options
echo "🚀 Choose a Hyprland installer:"
echo "[1] JaKooLit's Fedora Hyprland (auto-install + curated dotfiles)"
echo "[2] shell-ninja's Hyprconf (modular installer with gum UI)"
echo "[0] Skip Hyprland installation"

read -p "Enter your choice (1/2/0): " hypr_choice

case "$hypr_choice" in
  1)
    echo "📥 Installing Hyprland via JaKooLit's script..."
    sh <(curl -L https://raw.githubusercontent.com/JaKooLit/Fedora-Hyprland/main/auto-install.sh)
    ;;
  2)
    echo "📥 Installing Hyprland via shell-ninja's hyprconf-install..."
    bash <(curl -s https://raw.githubusercontent.com/shell-ninja/hyprconf-install/main/direct_run.sh)
    ;;
  *)
    echo "❌ Skipped Hyprland installation."
    ;;
esac