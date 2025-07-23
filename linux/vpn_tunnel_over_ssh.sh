#!/bin/bash
# Start autossh in background to create a SOCKS proxy tunnel to VPS
# -M 0: Disable monitoring (since we're using SSH's own keepalive)
# -D 1080: Create SOCKS proxy on local port 1080
# -p 19200: Connect to VPS on port 19200
# root@VPS_IP: Connect as root to your VPS IP address
# -C: Enable compression
# -N: Don't execute remote commands (just forward ports)
# >./vpn.log 2>&1: Redirect both stdout and stderr to vpn.log file
# &: Run in background
autossh -M 0 -D 1080 -p 19200 root@VPS_IP -C -N >./vpn.log 2>&1 &

# Set GNOME system proxy mode to manual (to use our SOCKS proxy)
gsettings set org.gnome.system.proxy mode 'manual'

# Configure GNOME to use our SOCKS proxy on localhost port 1080
gsettings set org.gnome.system.proxy.socks host 127.0.0.1:1080 

# Print confirmation message that VPN is activated
echo "VPN is activated..."
