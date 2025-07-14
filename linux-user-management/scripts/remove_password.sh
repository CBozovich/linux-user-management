#!/bin/bash
set -e
USER=chris

if id "$USER" &>/dev/null; then
  passwd -l "$USER"
  echo "✅ Password for $USER has been locked (SSH key login only)."
else
  echo "❌ User $USER does not exist."
  exit 1
fi
