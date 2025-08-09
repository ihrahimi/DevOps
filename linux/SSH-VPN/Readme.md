# SOCKS Proxy VPN Setup Script

This bash script automates the creation of a SOCKS proxy tunnel to a VPS and configures GNOME desktop environment to use it as a system-wide proxy.

## Features

- Establishes a persistent SSH tunnel using `autossh`
- Creates a SOCKS5 proxy on local port 1080
- Automatically configures GNOME network settings to use the proxy
- Runs in background with logging to `vpn.log`
- Includes compression for better performance

## Prerequisites

- Linux system with GNOME desktop environment
- `autossh` installed (`sudo apt install autossh` on Debian/Ubuntu)
- SSH access to a VPS with root privileges
- Port 19200 open on the VPS (or your custom SSH port)

## Installation

1. Clone this repository or save the script as `setup_vpn.sh`
2. Make the script executable:
   ```bash
   chmod +x setup_vpn.sh
