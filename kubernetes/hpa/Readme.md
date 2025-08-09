# Kubernetes Nginx Deployment with Autoscaling

![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?logo=kubernetes&logoColor=white)
![Nginx](https://img.shields.io/badge/NGINX-009639?logo=nginx&logoColor=white)

This repository contains Kubernetes manifests for deploying Nginx with horizontal autoscaling capabilities.

## 📋 Files Overview

1. **Deployment** (`nginx-deployment.yaml`) - Deploys Nginx pods
2. **HorizontalPodAutoscaler** (`nginx-hpa.yaml`) - Configures autoscaling
3. **Service** (`nginx-service.yaml`) - Exposes the deployment

## 🚀 Quick Start
# Kubernetes Nginx Deployment
## Configuration Files

### 1. nginx-deployment.yaml
- Deploys 2 replicas of Nginx
- Sets resource requests and limits:
  - CPU: 100m request / 200m limit
  - Memory: 128Mi request / 256Mi limit
- Exposes container port 80

### 2. nginx-hpa.yaml
- Configures Horizontal Pod Autoscaler (HPA)
- Scales between 1-10 pods based on:
  - CPU utilization > 50%
  - Memory utilization > 70%

### 3. nginx-service.yaml
- Creates a NodePort service
- Exposes Nginx on port 30000
- Maps to container port 80

## Deployment Instructions

1. Apply all configurations:
kubectl apply -f .

2.Verify deployment:
kubectl get deployment,svc,hpa,pods

3.Access Nginx:
http://<node-ip>:30000

🔧 Customization Options
Adjust replicas count in deployment.yaml
Modify resource limits as needed
Change autoscaling thresholds in hpa.yaml
Update nodePort (must be between 30000-32767)
