# Azure DevOps CI/CD Pipelines Lab  
A fully automated CI/CD lab showcasing **Terraform + AKS + ACR + Azure Pipelines + Kubernetes deployments**, including Makefile automation and a sample Node.js application.

This repository is designed as a complete end-to-end Azure DevOps practice environment and is part of my professional DevOps portfolio.

---

## 🚀 Tech Stack  
- **Terraform (AKS Automation)**
- **Azure Container Registry (ACR)**
- **Azure Kubernetes Service (AKS)**
- **Azure DevOps Pipelines (CI + CD)**
- **Docker**
- **Kubernetes (k8s)**
- **Node.js App**
- **Makefile Automation**

---

## 📂 Folder Structure

```
AZURE-DEVOPS-CI-CD-PIPELINES-LAB/
│
├── app/
│   ├── server.js
│   ├── package.json
│   └── Dockerfile
│
├── architecture/
│   └── devops-flow.md
│
├── Makefile
│
├── pipelines/
│   ├── azure-pipelines-ci.yaml
│   └── azure-pipelines-cd.yaml
│
├── terraform/
│   ├── aks_main.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── terraform.tfvars
│
└── README.md
```

---

## 🏗️ Architecture Overview  
See `architecture/devops-flow.md` for the complete diagram + workflow.

### 🔄 High-Level DevOps Flow
1. Developer pushes code → GitHub  
2. **CI Pipeline**  
   - Install Node packages  
   - Run unit tests  
   - Build Docker image  
   - Push image to **ACR → myacrregistry**  
3. **CD Pipeline**  
   - Pull latest image  
   - Deploy to AKS  
   - Apply Kubernetes manifests  
4. App becomes live on AKS LoadBalancer  

---

# 🌐 Application — Node.js Web App

### `server.js`
```javascript
const http = require("http");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello from Azure DevOps CI/CD on AKS!");
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});
```

### `package.json`
```json
{
  "name": "ci-cd-node-app",
  "version": "1.0.0",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  }
}
```

### `Dockerfile`
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

---

# ⚙️ Makefile — Automation Commands

```makefile
APP_NAME=nodeapp
ACR_NAME=myacrregistry
IMAGE_TAG=v1

docker-build:
	docker build -t $(ACR_NAME).azurecr.io/$(APP_NAME):$(IMAGE_TAG) ./app

docker-login:
	az acr login --name $(ACR_NAME)

docker-push:
	docker push $(ACR_NAME).azurecr.io/$(APP_NAME):$(IMAGE_TAG)

tf-init:
	cd terraform && terraform init

tf-apply:
	cd terraform && terraform apply -auto-approve

tf-destroy:
	cd terraform && terraform destroy -auto-approve
```

---

# 🌍 Terraform — AKS Deployment

### `aks_main.tf`
Creates AKS cluster with node pool, RBAC, and ACR integration.

### `provider.tf`
AzureRM provider configuration.

### `variables.tf`
Contains parameters for region, cluster name, node count, VM size, etc.

### `terraform.tfvars`
```
resource_group_name = "devops-lab-rg"
cluster_name        = "devops-aks-cluster"
location            = "eastus"
dns_prefix          = "devopsdemo"
```

---

# ▶️ Run Terraform

```
make tf-init
make tf-apply
```

This will:
✔ Create Resource Group  
✔ Create AKS Cluster  
✔ Integrate AKS ↔ ACR  
✔ Output kubeconfig  

---

# 🔧 Azure DevOps — CI Pipeline (azure-pipelines-ci.yaml)

- Install Node dependencies  
- Run tests  
- Docker build  
- Docker push → ACR (`myacrregistry`)  
- Triggered on every push to main  

---

# 🚀 Azure DevOps — CD Pipeline (azure-pipelines-cd.yaml)

- Pull latest Docker image  
- Replace image tag in k8s manifest  
- Deploy to AKS using kubectl  
- Apply deployment + service manifests  

---

# 🌟 End-to-End Deployment Flow

1. `git push`  
2. **CI pipeline** builds + pushes Docker image  
3. **CD pipeline** deploys latest image to AKS  
4. App becomes available at:

### 👉 http://<AKS_LoadBalancer_IP>:3000

---

# ✅ Conclusion  
This lab demonstrates a **complete, production-style Azure DevOps CI/CD system** using Terraform, AKS, ACR, Docker, and Kubernetes — fully automated and cloud-ready.


## ✨ Author
**Ram Rocky – Azure DevOps Engineer | Kubernetes | CI/CD | Terraform**