# 🚀 Serverless Task Manager API with AWS Lambda, API Gateway, DynamoDB & Terraform

**A fully serverless, scalable backend API using AWS — built and deployed via Infrastructure as Code (Terraform).**
> 📌 Build, Deploy, and Manage tasks via an API – with zero server maintenance.

---

## 🎯 Project Objective

This project demonstrates how to build a **production-ready backend API** that:
- Automatically scales using AWS Lambda.
- Persists task data in DynamoDB.
- Exposes secure HTTP endpoints via API Gateway.
- Automates infrastructure provisioning using Terraform.

Ideal for showcasing cloud engineering, serverless architecture, and Infrastructure as Code (IaC) skills.

---

## 📦 Core Features

✅ **Create Tasks API Endpoint**  
✅ **AWS Lambda Function (Python)**  
✅ **DynamoDB for Persistent Storage**  
✅ **Secure with IAM Role Permissions**  
✅ **Automated Deployment using Terraform**  
✅ **CloudWatch Logging & Monitoring**  

---

## 📊 AWS Architecture Overview

```

Client (Postman, Web App)
│
▼
Amazon API Gateway
│
▼
AWS Lambda (Python)
│
▼
Amazon DynamoDB (Tasks Table)
│
▼
AWS CloudWatch Logs

```

---

## 🛠️ AWS Services Used
```
| 🛠️ Service        | ⚙️ Purpose                                  |
|-------------------|---------------------------------------------|
| AWS Lambda        | Backend compute (Python 3.8)                |
| Amazon API Gateway| RESTful HTTP API endpoint                   |
| DynamoDB          | NoSQL database to store tasks               |
| IAM Roles/Policies| Secures Lambda with strict access control   |
| CloudWatch Logs   | Monitors Lambda execution                   |
| Terraform         | Infrastructure as Code for full automation  |


```

## 📂 Project Structure

```

terraform-task-manager/
│
├── main.tf               # API Gateway setup
├── lambda.tf             # Lambda function deployment
├── dynamodb.tf           # DynamoDB table definition
├── iam.tf                # IAM roles & policies
├── variables.tf          # Terraform variables
├── outputs.tf            # Terraform outputs (API URL)
├── lambdas/
│   ├── task\_manager.py   # Lambda function source code
└── README.md             # Documentation (this file)

````

---

## 🚀 Deployment Guide (Step-by-Step)

### 1️⃣ Prerequisites:
- AWS CLI configured (`aws configure`)
- Terraform installed (`terraform --version`)

---

### 2️⃣ Deployment:

```bash
# Clone the project repository
git clone <your-repository-url>
cd terraform-task-manager

# Initialize Terraform
terraform init

# Review infrastructure plan
terraform plan

# Deploy infrastructure
terraform apply
````

---

### 3️⃣ Testing the API:

* Use **Postman** or cURL to test your deployed API.
* **Request Type**: POST
* **URL**: https\://<api-id>.execute-api.<region>.amazonaws.com/
* **Headers**:

  * Content-Type: application/json
* **Body Example**:

```json
{
  "title": "Complete AWS Certification"
}
```

---

### 4️⃣ Example API Response:

```json
{
  "message": "Task created successfully",
  "task_id": "7c9b807e-db27-410f-8a1a-25983c39082f"
}
```

---

## 🔐 Security Focus

* **IAM Role** with strict permissions.
* **DynamoDB table access** restricted to Lambda.
* CloudWatch Logs for monitoring & troubleshooting.

---

## 💡 Why This Project Stands Out

This project reflects real-world, production-level skills:

* 🚀 Serverless architecture design.
* 🛠️ Automated infrastructure deployment with Terraform.
* ⚙️ Practical AWS service integrations.
* 🛡️ Secure, scalable, and efficient backend.

---

## 🏆 Final Outcome

A professional-grade, serverless task management backend — built entirely on AWS and automated via Terraform.
