# Azure DevOps CI/CD Lab – AKS + Terraform + NodeJS

This repository is a practical, end-to-end Azure DevOps project demonstrating:

- Infrastructure provisioning using **Terraform**
- Containerization using **Docker**
- CI/CD pipelines using **Azure DevOps Pipelines**
- Application deployment to **Azure Kubernetes Service (AKS)**

A complete DevOps flow from **code → build → deploy → AKS**.

---

## 📁 Repository Structure

```
azure-devops-cicd-lab/
 ├── app/
 │   ├── server.js
 │   ├── package.json
 │   └── node-app.yaml
 ├── pipelines/
 │   ├── nodeapp-ci.yaml
 │   └── nodeapp-cd.yaml
 ├── terraform/
 │   ├── provider.tf
 │   ├── aks_main.tf
 │   ├── variables.tf
 │   └── terraform.tfvars
 └── README.md
```

---

## 🚀 What This Project Demonstrates

### **1. CI Pipeline (Build + Docker Image Push)**  
- Installs Node dependencies  
- Runs tests (placeholder)  
- Builds Docker image  
- Pushes image to **Azure Container Registry (ACR)**

File: `pipelines/nodeapp-ci.yaml`

---

### **2. CD Pipeline (Deploy to AKS)**  
- Fetches latest image from ACR  
- Applies Kubernetes manifest (`node-app.yaml`)  
- Deploys the app via `kubectl apply`  
- Exposure via LoadBalancer service

File: `pipelines/nodeapp-cd.yaml`

---

### **3. Terraform AKS Infrastructure**

Terraform automates:
- Azure Resource Group creation  
- Azure Kubernetes Service (AKS) cluster  
- Node pool configuration  
- Networking settings  

Files under `/terraform`

---

### **4. NodeJS Sample Application**

A simple HTTP server used to test CI/CD:

```
http://<public-ip> → "Hello from NodeJS App deployed on AKS using Terraform + Azure DevOps"
```

Files under `/app`

---

## 🛠️ Prerequisites

- Azure Subscription  
- Azure DevOps Organization  
- Azure Container Registry (ACR)  
- AKS permissions (Owner/Contributor)  
- Terraform installed  
- Docker installed  

---

## 🌐 Deployment Flow (High-Level)

1️⃣ Developer pushes code to GitHub  
2️⃣ CI pipeline builds and pushes Docker image → ACR  
3️⃣ CD pipeline deploys to AKS  
4️⃣ User accesses app via LoadBalancer external IP  

---

## 📦 Docker Build Commands (Local)

```
docker build -t nodeapp:v1 .
docker run -p 3000:3000 nodeapp:v1
```

---

## 🧪 Test the Application Locally

```
npm install
npm start
```

---

## 🤝 Contribution

Feel free to fork and experiment with:
- Helm  
- Kustomize  
- Istio  
- Multi-stage Docker builds  
- Azure Key Vault integration

---

## 📜 License
MIT License – Free to use, modify, experiment.

---

## ✨ Author
**Sairam Potula – Azure DevOps Engineer | Kubernetes | CI/CD | Terraform**

