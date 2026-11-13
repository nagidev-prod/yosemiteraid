#!/bin/bash
# Installs the Yosemite theme into the running Unraid web UI.
# Usage: bash install.sh [--no-boot]
#   --no-boot   do not add the reinstall line to /boot/config/go
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO/src/yosemite.theme"
PLUGINS="/usr/local/emhttp/plugins"
DEST="$PLUGINS/yosemite.theme"
GO="/boot/config/go"
MARK="# yosemite-theme"

if [ ! -d "$PLUGINS/dynamix" ]; then
  echo "This does not look like an Unraid server ($PLUGINS/dynamix is missing)." >&2
  exit 1
fi

rm -rf "$DEST"
mkdir -p "$DEST/sheets"
cp "$SRC/YosemiteTheme.page" "$DEST/"
cp "$SRC/sheets/YosemiteTheme.css" "$DEST/sheets/"
chmod 755 "$DEST" "$DEST/sheets"
chmod 644 "$DEST/YosemiteTheme.page" "$DEST/sheets/YosemiteTheme.css"
echo "Yosemite theme installed to $DEST. Reload the web UI."

# The web UI lives in RAM, so the theme has to be copied in again on every boot.
if [ "${1:-}" != "--no-boot" ] && [ -f "$GO" ]; then
  case "$REPO" in
    /boot/*)
      if ! grep -qF "$MARK" "$GO"; then
        printf '\nbash %q/install.sh --no-boot >/dev/null 2>&1 %s\n' "$REPO" "$MARK" >> "$GO"
        echo "Added a line to $GO so the theme comes back after a reboot."
      fi
      ;;
    *)
      echo "Note: $REPO is not on the flash drive, so the theme will be gone after a reboot."
      echo "Clone the repo somewhere under /boot/config to make it stick."
      ;;
  esac
fi
