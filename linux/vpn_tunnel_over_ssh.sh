#!/bin/bash
	autossh -M 0 -D 1080 -p 19200 root@VPS_IP -C -N >./vpn.log 2>&1 &
	gsettings set org.gnome.system.proxy mode 'manual'
	gsettings set org.gnome.system.proxy.socks host 127.0.0.1:1080 
	echo "VPN is activated..."
