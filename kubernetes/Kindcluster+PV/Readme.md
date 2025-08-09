# Kubernetes Local Development Cluster with Nginx

![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?logo=kubernetes&logoColor=white)
![Nginx](https://img.shields.io/badge/NGINX-009639?logo=nginx&logoColor=white)

This repository contains configurations for setting up a local Kubernetes cluster with Kind, complete with persistent storage and Nginx deployment.

## 🛠️ Cluster Architecture

- **1 Control Plane** node
- **3 Worker** nodes with:
  - Host port mappings (8080, 9080, 7080 → 30000)
  - Shared host directory mounted at `/srv`
- Persistent Volume using hostPath
- Nginx deployment with 3 replicas
- NodePort service exposed on port 30000

## 📋 File Structure
.
├── kind-config.yaml # Kind cluster configuration

├── persistent-volume.yaml # PV configuration

├── persistent-volume-claim.yaml # PVC configuration

├── nginx-deployment.yaml # Nginx deployment

└── nginx-service.yaml # Service configuration


## 🚀 Quick Start

1. Create Kind Cluster
kind create cluster --config kind-config.yaml

2. Set up Persistent Volume
# Create host directory
sudo mkdir -p /srv/website
sudo chmod 777 /srv/website

# Apply PV and PVC
kubectl apply -f persistent-volume.yaml
kubectl apply -f persistent-volume-claim.yaml

3. Deploy Nginx
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml

4. Access Nginx
   
# Get worker node IP
kubectl get nodes -o wide

# Access via any worker port
curl http://localhost:8080
curl http://localhost:9080
curl http://localhost:7080
🔧 Configuration Details
Kind Cluster (kind-config.yaml)
1 control-plane node

3 worker nodes with:

Port mappings (host:container)

/srv directory mounted from host

Bidirectional file propagation

Persistent Volume (persistent-volume.yaml)
1Gi storage at /srv/website

ReadWriteMany access mode

Retain reclaim policy

Nginx Deployment (nginx-deployment.yaml)
3 replicas

Mounts PVC at /usr/share/nginx/html

Uses latest Nginx image

Service (nginx-service.yaml)
NodePort type

Exposed on port 30000

Maps to container port 80


🧹 Cleanup

kind delete cluster
sudo rm -rf /srv/website

💡 Customization Tips
Change host ports in kind-config.yaml

Adjust storage size in PV/PVC files

Modify Nginx image version

Add more worker nodes as needed
