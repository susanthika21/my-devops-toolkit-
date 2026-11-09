# Jenkins Docker Demo 🚀

A continuous integration and continuous deployment (CI/CD) pipeline project demonstrating how to automate containerized application deployments using Jenkins and Docker.

---

## 📋 Project Overview
This project sets up an automated pipeline that pulls code from GitHub, builds a Docker image of the application, runs tests, and deploys/runs the container environment via Jenkins automation.

---

## 🛠️ Tech Stack & Tools
* **Orchestration / CI/CD:** Jenkins
* **Containerization:** Docker & Docker Compose
* **Version Control:** Git & GitHub
* **Webhooks:** GitHub Webhook integration for automatic build triggering

---

## ⚙️ Prerequisites
Before running this project locally or through Jenkins, make sure you have the following installed:
* [Docker](https://docs.docker.com/get-docker/)
* [Jenkins](https://www.jenkins.io/) (with Docker pipeline plugins configured)
* Git

---

## 🚀 Getting Started Locally

1. **Clone the repository:**
   ```bash
   git clone https://github.com/susanthika21/jenkins-demo.git
   cd jenkins-demo/jenkins-docker-demo
   
2. Run the application container manually (optional test):
  docker build -t jenkins-docker-demo .
  docker run -d -p 5000:5000 jenkins-docker-demo
  
## 🔄 Jenkins CI/CD Pipeline Workflow

**Code Commit:** Developer pushes code changes to the main branch on GitHub.

**Webhook Trigger:** GitHub sends an automated payload notification via webhook to your local Jenkins server.

**Build Stage:** Jenkins clones the repository and builds a fresh Docker container image.

**Test & Deploy Stage:** Jenkins runs verification tasks and spins up the container environment automatically.

---

## 🤝 Author
* **Susanthika** - [GitHub Profile](https://github.com/susanthika21)
