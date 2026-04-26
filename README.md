# 🚀 Secure Infrastructure Deployment using Terraform + Vault + GitHub Actions

## 📌 Overview

This project demonstrates a **secure CI/CD pipeline** for provisioning AWS infrastructure using:

* **Terraform** for Infrastructure as Code
* **GitHub Actions** for CI/CD automation
* **HashiCorp Vault** for secure secret management

Infrastructure is deployed **only after manual approval**, ensuring safe and controlled production changes.

---

## 🏗️ Architecture

```text
Developer → GitHub Repo → GitHub Actions (CI)
                                ↓
                       GitHub Actions (CD)
                                ↓
                      🔐 HashiCorp Vault
                                ↓
                  Fetch AWS Credentials Securely
                                ↓
                       Terraform Apply
                                ↓
                             AWS EC2
```

---

## 🔧 Tech Stack

* Terraform
* AWS (EC2)
* GitHub Actions
* HashiCorp Vault

---

## 📂 Repository Structure

```text
aws-infra-terraform/
├── .github/workflows/
│   ├── terraform-pr.yml
│   └── terraform-deploy.yml
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars
└── README.md
```

---

## ⚙️ CI/CD Workflow

### ✅ CI Pipeline (Pull Request)

Triggered on PR to `main`

Steps:

* Terraform fmt check
* Terraform validate
* Terraform plan

👉 Ensures infrastructure code quality

---

### 🚀 CD Pipeline (Post Merge)

Triggered on merge to `main`

Steps:

1. Terraform init
2. Terraform validate
3. Terraform plan
4. ⏸️ Manual approval required
5. 🔐 Authenticate to Vault
6. Fetch AWS credentials
7. Terraform apply

👉 Secure deployment using Vault-managed secrets

---

## 🔐 Secret Management (Vault)

* AWS credentials are stored in **HashiCorp Vault**
* GitHub Actions authenticates with Vault
* Secrets are fetched dynamically during pipeline execution

👉 No hardcoded secrets
👉 No GitHub-stored AWS credentials

---

## 🛑 Manual Approval Gate

Deployment requires approval using GitHub Environments:

* Environment: `production`
* Requires reviewer approval
* Prevents accidental deployments

---

## 🚀 How to Use

1. Create feature branch
2. Push changes
3. Open Pull Request → CI runs
4. Merge to main → CD starts
5. Approve deployment
6. Infrastructure gets deployed

---

## ☁️ Resources Created

* AWS EC2 Instance
* Security Group 

---

## 🔮 Future Enhancements

* Add EKS cluster deployment
* Use S3 remote backend with state locking
* Implement multi-environment support
* Add monitoring/logging stack

---

## 👨‍💻 Author

Abd-del1

---

## ⭐ Key Learning

* Secure CI/CD pipelines
* Vault integration with GitHub Actions
* Terraform automation
* Manual approval workflows
