# Linux User Management and SSH Key Setup

This project provides a step-by-step guide and reusable scripts for managing Linux user accounts, configuring SSH key authentication, and assigning root privileges securely.  
It is particularly useful when administering AWS EC2 instances running Amazon Linux or similar distributions.

## Features
Create new Linux users  
Generate and add SSH public keys for secure login  
Grant root privileges via `sudo`  
Lock or remove user passwords  
Remove old SSH keys  
Enforce SSH key-only authentication  

## Use Case
You need to:
- Onboard a new admin (e.g., `chris`) on an EC2 instance.
- Securely enable SSH key login.
- Disable password login for compliance.
- Grant (or revoke) root privileges as needed.

## Scripts

| Script Name                 | Description                                  |
|-----------------------------|----------------------------------------------|
| `create_user_with_ssh.sh`   | Creates a user and configures their SSH key |
| `grant_sudo.sh`             | Adds user to the `wheel` group or sudoers   |
| `remove_password.sh`        | Locks or removes user password             |
| `remove_ssh_key.sh`         | Removes a specific SSH public key          |

## Example Usage

### Create a New User & Set SSH Key
```bash
sudo ./scripts/create_user_with_ssh.sh ~/.ssh/id_rsa.pub
```

### Grant Root (Sudo) Privileges
```bash
sudo ./scripts/grant_sudo.sh
```

### Lock or Remove Password
```bash
sudo ./scripts/remove_password.sh
```

### Remove an Old SSH Key
```bash
sudo ./scripts/remove_ssh_key.sh "ssh-rsa AAAAB3Nza... user@host"
```

## Best Practices
- Never place private keys in `.ssh/authorized_keys`.
- Use `chmod 700 ~/.ssh` and `chmod 600 ~/.ssh/authorized_keys` to secure permissions.
- Disable password authentication by editing `/etc/ssh/sshd_config`:
  ```ini
  PasswordAuthentication no
  ```
  Then restart SSH:
  ```bash
  sudo systemctl restart sshd
  ```

## 🛡 Security Notes
Use strong SSH keys (4096-bit RSA or Ed25519).  
Regularly rotate SSH keys and remove old ones.  
Audit `sudoers` access with `visudo`.

## License
MIT License
