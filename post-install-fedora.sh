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

echo "📦 Installing appstream data and media drivers..."
sudo dnf install -y rpmfusion-\*-appstream-data
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing
sudo dnf install -y intel-media-driver

echo "✅ Post-install setup complete!"
