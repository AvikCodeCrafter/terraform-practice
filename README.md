# 🏗️ AWS VPC from Scratch using Terraform (IaC)

🔍 **It’s not just Terraform code — it’s understanding AWS VPC from the ground up** ☁️🏗️  
Built using **Terraform (Infrastructure as Code)** with a strong focus on **core AWS networking fundamentals**.

---

## 📌 Overview

This repository contains a **complete AWS VPC architecture built from scratch using Terraform**.

The goal of this project is **learning-first**, not speed or abstraction.  
Instead of relying on Terraform modules, this setup is intentionally built **layer by layer** to understand how AWS networking works **under the hood**.

This is **not about quickly spinning up infrastructure** ⚡  
This **is about mastering the fundamentals every SRE / DevOps engineer should understand** 💡

---

## 🎯 Purpose of This Repository

- Understand how AWS VPC components work together
- Learn what Terraform modules abstract away
- Build confidence in debugging real-world networking issues
- Strengthen AWS networking fundamentals before moving to production abstractions

> ⚠️ **Note:**  
> Terraform modules are the preferred approach in production.  
> This repository intentionally avoids them to focus on **core concepts and clarity**.

---

## 🧩 What This Setup Includes

- 🧱 **Custom VPC** with a well-planned CIDR range  
- 🌐 **Multiple public and private subnets** across Availability Zones  
- 🚪 **Internet Gateway (IGW)** for inbound/outbound internet access  
- 🔁 **NAT Gateway + Elastic IP** for secure outbound access from private subnets  
- 🗺️ **Separate route tables** for public and private subnets with explicit associations  
  *(no magic defaults ✨🚫)*  
- 🖥️ **EC2 instances** deployed in public subnets  
- 🗄️ **RDS deployed in private subnets** (no direct internet exposure 🔒)  
- 📦 **Remote Terraform state stored in S3** for safety, locking, and collaboration  

---

## 📐 Architecture & Traffic Flow

The architecture follows AWS best practices for isolation and routing:

- ➡️ Public subnets route outbound traffic via the **Internet Gateway**
- ➡️ Private subnets route outbound traffic via the **NAT Gateway**
- 🚫 No direct internet access to private resources
- 🧭 Clear separation of responsibility at every networking layer

*(Refer to the architecture diagram in this repository for a visual overview.)*

---

## 🎯 Why Build This Manually Instead of Using Modules?

While Terraform modules are the **preferred approach in production**, this project avoids them intentionally to:

- ✅ Understand what modules abstract away
- ✅ Learn how route tables actually control traffic
- ✅ See how NAT Gateway, IGW, and subnets interact
- ✅ Build confidence in debugging real-world networking issues
- ✅ Strengthen core SRE / DevOps fundamentals
- ✅ Debug issues with evidence and clarity instead of guessing

> 🚀 **Modules help you move fast**  
> 🧠 **Building from scratch helps you understand *why* things work**

This exercise focuses on **core VPC concepts**, not just writing Terraform that “works”.

---

## 🧠 Key Learnings

- A VPC is not a single resource — it is a **collection of tightly connected layers**
- Most AWS networking issues come down to **route tables and subnet design**
- Clear routing matters more than assumptions
- Infrastructure as Code enforces clarity in design and intent

---

## 🚀 What’s Next

Planned improvements:

- 🔁 Refactor this setup into **clean, reusable Terraform modules**
- 📊 Add **VPC Flow Logs** for observability and troubleshooting
- ☸️ Extend this VPC to support **EKS, ALB, and autoscaling workloads**
- 🌍 Apply the same design principles to **multi-account AWS architectures**

---

## 🧱 Final Note

This repository follows a **learning-first, fundamentals-first approach** — because  
**strong foundations are what make scalable, secure systems possible**.

If you’re learning AWS, Terraform, or preparing for real-world SRE / DevOps work, this repo is designed to help you understand **not just *how* things work, but *why* they work**.
