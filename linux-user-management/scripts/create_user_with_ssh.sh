#!/bin/bash
set -e
USER=chris
PUBKEY_FILE=$1

if [ -z "$PUBKEY_FILE" ]; then
  echo "Usage: sudo $0 <path_to_public_key.pub>"
  exit 1
fi

if id "$USER" &>/dev/null; then
  echo "User $USER already exists."
else
  adduser "$USER"
  echo "✅ User $USER created."
fi

mkdir -p /home/$USER/.ssh
cat "$PUBKEY_FILE" >> /home/$USER/.ssh/authorized_keys
chmod 700 /home/$USER/.ssh
chmod 600 /home/$USER/.ssh/authorized_keys
chown -R $USER:$USER /home/$USER/.ssh
echo "✅ SSH key added for $USER."
