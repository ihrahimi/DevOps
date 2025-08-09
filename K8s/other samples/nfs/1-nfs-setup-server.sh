# Install NFS server package
sudo apt-get update
sudo apt-get install -y nfs-kernel-server

# Create a directory to share
sudo mkdir -p /srv/nfs_share
sudo chown -R nobody:nogroup /srv/nfs_share
sudo chmod 777 /mnt/sev_share

# Configure NFS exports
echo "/srv/nfs_share *(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports

# Apply the exports
sudo exportfs -a

# Start and enable NFS server
sudo systemctl restart nfs-kernel-server
sudo systemctl enable nfs-kernel-server

# If you have a firewall, allow NFS traffic
sudo ufw allow from any to any port nfs
