# Terraform Docker Nginx Deployment

## Overview
This Terraform project automates the deployment of an Nginx container on a remote Docker host using SSH authentication. It creates a custom bridge network and connects the Nginx container to it with port forwarding.

## Prerequisites

1. **Remote Docker Host**:
   - A server with Docker installed (192.168.2.142 in this example)
   - SSH access enabled

2. **Local Machine**:
   - Terraform installed
   - SSH key pair (public/private)

## Setup Instructions

### 1. Configure SSH Access to Docker Host
Before running Terraform, set up passwordless SSH authentication:

```bash
# Generate SSH key pair if you don't have one
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519

# Copy public key to Docker host (replace 'iman' with your username)
ssh-copy-id -i ~/.ssh/id_ed25519.pub iman@192.168.2.142

# Verify SSH connection works
ssh -i ~/.ssh/id_ed25519 iman@192.168.2.142 docker ps
```

### 2. Configure Terraform Variables
Edit the variables in variables.tf or override them during execution:
```bash

variable "docker_host_ssh" {
  description = "SSH connection string for the Docker host (user@ip:port)"
  type        = string
  default     = "iman@192.168.2.142:22"
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key for authentication"
  type        = string
  default     = "~/.ssh/id_ed25519"
}
```

### 3.Usage
```bash

Initialize Terraform:
terraform init

Review execution plan:
terraform plan

Apply configuration:
terraform apply

Access Nginx:
After successful deployment, Nginx will be available at:

http://192.168.2.142:8080
```
