# 🚀 Jenkins Docker Demo (CI/CD Pipeline)

A complete, hands-on Demonstration of a **Continuous Integration and Continuous Deployment (CI/CD)** pipeline using **GitHub Actions**, **Docker**, and **Python (Flask)**. 

This project automates the process of code testing, containerization, and deployment to Docker Hub whenever code changes are pushed to the repository.

---

## **📂 Project Directory Structure**

text
my-devops-toolkit-/
│
├── .github/
│   └── workflows/
│       └── ci-docker-pipeline.yml   # GitHub Actions Automation Workflow
│
└── jenkins-docker-demo/
    ├── app.py                       # Python Flask Web Application
    ├── test_app.py                  # Automated Unit Tests
    ├── Dockerfile                   # Container Blueprint Specification
    └── README.md                    # Project Documentation




---

## **🛠️ Technology Stack**

**Language:** Python 3.10 / Flask

**Containerization:** Docker & Docker Buildx

**CI/CD Orchestration:** GitHub Actions

**Registry:** Docker Hub

## ⚙️ How the CI/CD Pipeline Works

When you push code changes to the main branch, the GitHub Actions workflow (ci-docker-pipeline.yml) executes the following steps automatically:

- **Checkout Code:** Downloads the repository source code onto a clean runner environment.

- **Setup Python:** Configures Python 3.10 and installs project dependencies.

- **Run Tests:** Executes automated tests (test_app.py) to verify code integrity.

- **Docker Authentication:** Securely logs into Docker Hub using encrypted repository secrets (DOCKER_USERNAME and DOCKER_PASSWORD).

- **Build & Push:** Uses Docker Buildx to build the image from the jenkins-docker-demo/Dockerfile and pushes the final container artifact directly to Docker Hub.

## **🚀 Running the Application Locally**

If you want to run or test this application locally on your machine, follow these steps:

1. Clone the Repository
    Bash
    git clone [https://github.com/susanthika21/my-devops-toolkit-.git](https://github.com/susanthika21/my-devops-toolkit-.git)
    cd my-devops-toolkit-/jenkins-docker-demo

2. Run with Docker
Build the container image locally:

Bash
docker build -t jenkins-docker-demo .
Run the container:

Bash
docker run -p 5000:5000 jenkins-docker-demo
Open your browser and navigate to http://localhost:5000 to see your application live!

**🔐 Configuration (GitHub Secrets)**
To enable the automated push to Docker Hub via GitHub Actions, the following secrets must be configured in your GitHub Repository settings under Settings > Secrets and variables > Actions:

DOCKER_USERNAME: Your Docker Hub username.

DOCKER_PASSWORD: Your Docker Hub Personal Access Token (PAT) with Repo Read & Write permissions.
