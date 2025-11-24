                        ┌────────────────────────┐
                        │        DEVELOPER       │
                        │   Writes Code in VSCode│
                        └─────────────┬──────────┘
                                      │  (git push)
                                      ▼
                        ┌────────────────────────┐
                        │        GitHub Repo      │
                        │   Source + Terraform    │
                        │   + Docker + YAML + CI  │
                        └─────────────┬──────────┘
                                      │  (Pipeline Trigger)
                                      ▼
                    ┌────────────────────────────────────┐
                    │         Azure DevOps CI Pipeline    │
                    │  - npm install                      │
                    │  - Docker build                     │
                    │  - Docker push → ACR                │
                    └─────────────────────┬───────────────┘
                                          │
                                          ▼
                        ┌────────────────────────┐
                        │   Azure Container       │
                        │      Registry (ACR)     │
                        │ Stores App Images       │
                        └─────────────┬──────────┘
                                      │  (CD Pulls Image)
                                      ▼
                    ┌────────────────────────────────────┐
                    │         Azure DevOps CD Pipeline    │
                    │  - Fetch latest image from ACR      │
                    │  - kubectl apply → AKS              │
                    └─────────────────────┬───────────────┘
                                          │
                                          ▼
                        ┌────────────────────────┐
                        │ Azure Kubernetes Service│
                        │    (AKS Cluster)        │
                        │  Deployment + Service   │
                        └─────────────┬──────────┘
                                      │   (External IP)
                                      ▼
                        ┌────────────────────────┐
                        │      END USER          │
                        │ Access App via Browser │
                        └────────────────────────┘
