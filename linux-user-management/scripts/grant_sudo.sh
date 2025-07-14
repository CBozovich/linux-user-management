#!/bin/bash
set -e
USER=chris

if id "$USER" &>/dev/null; then
  usermod -aG wheel "$USER"
  echo "✅ User $USER added to 'wheel' group (sudo access)."
else
  echo "❌ User $USER does not exist."
  exit 1
fi
