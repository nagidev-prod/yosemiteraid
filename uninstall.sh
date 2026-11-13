#!/bin/bash
# Removes the Yosemite theme and its boot line.
set -euo pipefail

rm -rf /usr/local/emhttp/plugins/yosemite.theme
if [ -f /boot/config/go ]; then
  sed -i '/# yosemite-theme$/d' /boot/config/go
fi
echo "Yosemite theme removed. Reload the web UI."
