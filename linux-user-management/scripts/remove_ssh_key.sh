#!/bin/bash
set -e
USER=chris
KEY_TO_REMOVE=$1

if [ -z "$KEY_TO_REMOVE" ]; then
  echo "Usage: sudo $0 <partial_or_full_key_string>"
  exit 1
fi

AUTHORIZED_KEYS="/home/$USER/.ssh/authorized_keys"

if [ ! -f "$AUTHORIZED_KEYS" ]; then
  echo "❌ No authorized_keys file found for $USER."
  exit 1
fi

cp "$AUTHORIZED_KEYS" "$AUTHORIZED_KEYS.bak"
grep -v "$KEY_TO_REMOVE" "$AUTHORIZED_KEYS.bak" > "$AUTHORIZED_KEYS"
chown $USER:$USER "$AUTHORIZED_KEYS"
chmod 600 "$AUTHORIZED_KEYS"
echo "✅ Key removed for $USER. Backup saved as authorized_keys.bak"
