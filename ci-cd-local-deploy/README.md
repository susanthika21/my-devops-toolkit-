# 🚀 Automated CI/CD Pipeline with GitHub Actions & Self-Hosted Runner

An end-to-end Continuous Integration and Continuous Deployment (CI/CD) pipeline that automatically tests, containerizes, pushes, and deploys a Python Flask application to a local Linux server (Ubuntu WSL) using a **GitHub Actions Self-Hosted Runner** and **Docker**.

---

## 📂 Project Directory Structure

1. **Architecture & Workflow:**
   ```text
    Git Push (main/master)
                │
                ▼
          ┌─────────────────────────────────────────┐
          │  Job 1: build-and-push (ubuntu-latest)  │
          │  1. Checkout repository code            │
          │  2. Install dependencies & run tests    │
          │  3. Authenticate with Docker Hub        │
          │  4. Build & push Docker image           │
          └────────────────────┬────────────────────┘
                               │ (on success)
                               ▼
                        ┌─────────────────────────────────────────┐
                        │  Job 2: deploy (self-hosted runner)     │
                        │  1. Pull latest image from Docker Hub   │
                        │  2. Stop & remove existing container    │
                        │  3. Launch updated container on :8080   │
                        │  4. Prune dangling Docker images        │
                        └─────────────────────────────────────────┘

## **Why a Self-Hosted Runner?**

In private or firewalled environments without a public IP or open inbound SSH ports, exposing a server to the internet introduces security and networking bottlenecks. By running a GitHub Actions Self-Hosted Runner on the target Linux host, the server initiates outbound HTTPS (443) connections to GitHub—enabling zero-downtime-style local deployments without public port forwarding or SSH key exposure.

my-devops-toolkit-/
├── .github/
│   └── workflows/
│       └── ci-cd-pipeline.yml   # Multi-stage CI/CD workflow definition
└── ci-cd-local-deploy/
    ├── app.py                   # Python Flask web application
    ├── test_app.py              # Automated unit tests using unittest
    ├── requirements.txt         # Python package dependencies
    ├── Dockerfile               # Lightweight python:3.11-slim container spec
    └── README.md                # Project documentation




