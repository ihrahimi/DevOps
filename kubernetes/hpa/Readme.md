# Kubernetes Nginx Deployment with Autoscaling

![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?logo=kubernetes&logoColor=white)
![Nginx](https://img.shields.io/badge/NGINX-009639?logo=nginx&logoColor=white)

This repository contains Kubernetes manifests for deploying Nginx with horizontal autoscaling capabilities.

## 📋 Files Overview

1. **Deployment** (`nginx-deployment.yaml`) - Deploys Nginx pods
2. **HorizontalPodAutoscaler** (`nginx-hpa.yaml`) - Configures autoscaling
3. **Service** (`nginx-service.yaml`) - Exposes the deployment

## 🚀 Quick Start

```bash
# Apply all configurations
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-hpa.yaml
kubectl apply -f nginx-service.yaml

📝 Configuration Details
1. Nginx Deployment
Image: nginx:latest

Replicas: 2 initially

Resource Limits:

CPU: 100m request, 200m limit

Memory: 128Mi request, 256Mi limit

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  replicas: 2
  template:
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        resources:
          requests:
            cpu: "100m"
            memory: "128Mi"
          limits:
            cpu: "200m"
            memory: "256Mi"

2. Autoscaling (HPA)
Scale Range: 1-10 pods

Scaling Triggers:

CPU > 50% utilization

Memory > 70% utilization

apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
spec:
  minReplicas: 1
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        averageUtilization: 50

3. NodePort Service
Type: NodePort

Port: 80 (container) → 30000 (node)

Access: http://<node-ip>:30000

apiVersion: v1
kind: Service
spec:
  type: NodePort
  ports:
  - port: 80
    nodePort: 30000

🛠️ Management Commands
# Check deployment status
kubectl get deployments

# View autoscaling status
kubectl get hpa

# Access service
kubectl get services

# Monitor pods
kubectl get pods -w

# Delete resources
kubectl delete -f .

📊 Architecture
<img width="791" height="2236" alt="deepseek_mermaid_20250809_9aa077" src="https://github.com/user-attachments/assets/689e12aa-1878-4d16-87cf-6088f3d28f01" />

🔧 Customization
Change nodePort (must be 30000-32767)

Adjust resource requests/limits

Modify autoscaling thresholds

Update Nginx image version

📚 References
[Kubernetes Documentation
](https://kubernetes.io/docs/home/)
[Nginx Docker Image
](https://hub.docker.com/_/nginx)
[HPA Best Practices](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
