# Ansible Playbook: TMUX Installation

This playbook installs TMUX on target servers (supports both Debian and RedHat-based systems) and configures passwordless sudo access.

## Features
- Installs TMUX on Linux servers
- Supports both Debian (apt) and RedHat (yum) based systems
- Includes instructions for SSH key setup
- Configures passwordless sudo for specified users

## Prerequisites

1. **Control Machine Requirements**:
   - Ansible installed (version 2.9+ recommended)
   - Python 3.x
   - SSH client

2. **Target Server Requirements**:
   - SSH access
   - User with sudo privileges

## Setup Instructions

### 1. Configure SSH Key Authentication
Before running the playbook, copy your Ansible control node's public key to all target servers:

```bash
# Generate SSH key pair if you don't have one
ssh-keygen -t ed25519 -f ~/.ssh/ansible_key
```
### Copy public key to target servers
```bash
ssh-copy-id user@target-server
```
### 2. Configure Passwordless Sudo
On each target server, run:
bash
# Create sudoers file for your user
add this line in sudoers file in last line
your_username ALL=(ALL) NOPASSWD:ALL

### 3. Inventory File Setup
Create an inventory.ini file:
```bash
[all]
server1 ansible_host=192.168.2.142

[all:vars]
ansible_user=your_remote_username
ansible_ssh_private_key_file=~/.ssh/ansible_key
ansible_become=true
```

### 4.Running the Playbook
Basic execution:
```bash
ansible-playbook -i inventory.ini install_tmux.yml
```
