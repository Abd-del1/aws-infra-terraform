# 🚀 Secure Infrastructure Deployment using Terraform + Jenkins + Vault

## 📌 Overview

This project demonstrates a **secure CI/CD pipeline** for provisioning AWS infrastructure using:

* **Terraform** for Infrastructure as Code
* **Jenkins** for CI/CD automation
* **HashiCorp Vault** for secure secret management

Infrastructure is deployed in a **controlled and secure manner** with a **manual approval step before applying changes**.

---

## 🏗️ Architecture

```text
Developer → GitHub Repo → Jenkins (CI)
                                ↓
                         Jenkins (CD)
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
* Jenkins
* HashiCorp Vault

---

## 📂 Repository Structure

```text
aws-infra-terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars
├── Jenkinsfile
└── README.md
```

---

## ⚙️ CI/CD Workflow

### ✅ CI Pipeline (Jenkins)

Triggered on code changes.

Performs:

* Terraform format check (`terraform fmt -check`)
* Terraform validation (`terraform validate`)
* Terraform plan (`terraform plan`)

👉 Ensures infrastructure code quality before deployment.

---

### 🚀 CD Pipeline (Jenkins)

Triggered after code is ready for deployment.

Steps:

1. Terraform plan
2. ⏸️ Manual approval required
3. 🔐 Fetch AWS credentials from Vault
4. Terraform apply

👉 Ensures controlled and secure infrastructure deployment.

---

## 🛑 Manual Approval

Deployment is paused before applying changes using Jenkins:

```groovy
input message: 'Approve Terraform Apply?', ok: 'Deploy'
```

👉 Prevents accidental deployments to production.

---

## 🔐 Secret Management (Vault)

* AWS credentials are stored in **HashiCorp Vault**
* Jenkins authenticates to Vault
* Secrets are fetched dynamically during pipeline execution

👉 No hardcoded secrets
👉 No credentials stored in GitHub or Jenkins

---

## 🚀 How to Use

1. Push code to repository
2. Jenkins CI pipeline runs automatically
3. Review Terraform plan
4. Approve deployment manually
5. Infrastructure gets deployed

---

## ☁️ Resources Created

* AWS EC2 Instance
* Security Group 

---

## 💰 Cost Warning

⚠️ This project provisions real AWS resources.

👉 Remember to destroy resources after testing:

```bash
terraform destroy -var-file=terraform.tfvars
```

---

## 🔮 Future Enhancements

* Deploy EKS instead of EC2
* Add S3 backend with state locking
* Implement multi-environment setup
* Add monitoring and logging

---

## 👨‍💻 Author

**Abd-del1**

---

## ⭐ Key Learning

* CI/CD pipeline design using Jenkins
* Infrastructure automation with Terraform
* Secure secret management using Vault
* Manual approval workflows for safe deployments
