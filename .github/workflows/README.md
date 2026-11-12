# 🚀 Jenkins Docker Demo (CI/CD Pipeline)

A complete, hands-on Demonstration of a **Continuous Integration and Continuous Deployment (CI/CD)** pipeline using **GitHub Actions**, **Docker**, and **Python (Flask)**. 

This project automates the process of code testing, containerization, and deployment to Docker Hub whenever code changes are pushed to the repository.


## 📂 Project Directory Structure

1. **Navigate to your toolkit directory:**
   ```text
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


## **🛠️ Technology Stack**

- **Language:** Python 3.10 / Flask

- **Containerization:** Docker & Docker Buildx

- **CI/CD Orchestration:** GitHub Actions

- **Artifact Registry:** Docker Hub

---

## ⚙️ How the CI/CD Pipeline Works

When code changes are pushed to the **main** branch, the GitHub Actions workflow (**ci-docker-pipeline.yml**) executes the following steps automatically:

- **1. Checkout Code:** Downloads the repository source code onto a clean runner environment.

- **2. Setup Python:** Configures Python 3.10 and installs project dependencies.

- **3. Run Tests:** Executes automated tests (**test_app.py**) to verify code stability before building.

- **4. Docker Authentication:** Securely logs into Docker Hub using encrypted repository secrets (DOCKER_USERNAME and DOCKER_PASSWORD).

- **5. Build & Push:** Uses Docker Buildx to build the container image from the subfolder context (jenkins-docker-demo/Dockerfile) and pushes the final container artifact (image) directly to Docker Hub.

---
## 🧗‍♂️ Challenges & Troubleshooting

Building this pipeline from scratch involved solving several real-world DevOps and configuration challenges:

**1. Docker Hub Authentication & Authorization Errors**
   
- **Challenge: Initially encountered**
  
   **Error:** Username and password required followed by malformed HTTP Authorization header errors               during the Log in to Docker Hub step.
  
  **Root Cause:** Standard Docker Hub account passwords are restricted in CI/CD automation                            pipelines for security reasons, and manual secrets can occasionally suffer from                     trailing whitespace or syntax mismatches.
  
  **Solution:** Generated a dedicated Docker Hub Personal Access Token (PAT) with explicit Repo                     Read & Write permissions, and securely stored it alongside the username in GitHub                  Repository Secrets (DOCKER_USERNAME and DOCKER_PASSWORD).

**2. Multi-Folder Repository Context & Build Failures**
   
- **Challenge: The pipeline failed at the build step with**
  
   **Error:** failed to solve: failed to read dockerfile: open Dockerfile: no such file or                        directory.
  
  **Root Cause:** The GitHub Actions runner looked for the Dockerfile at the repository root                          directory, whereas the project files were modularly organized inside a subfolder                    (jenkins-docker-demo/).
  
  **Solution:** Refined the GitHub Actions workflow file by explicitly specifying the build context                 and file parameters to target the subfolder path:
   
   ```YAML
   with:
     context: ./jenkins-docker-demo
     file: ./jenkins-docker-demo/Dockerfile


## 🚀 Running the Application Locally

If you want to run or test this application locally on your machine, follow these steps:

1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/susanthika21/my-devops-toolkit-.git](https://github.com/susanthika21/my-devops-toolkit-.git)
   cd my-devops-toolkit-/jenkins-docker-demo


2. **Run with Docker**
   
   Build the container image locally:
   
   ```bash
   docker build -t jenkins-docker-demo .

3.  **Run the container:**
     ```bash
     docker run -p 5000:5000 jenkins-docker-demo

Open your browser and navigate to http://localhost:5000 to view the running web service.

---

## **🔐 Configuration (GitHub Secrets)**

To enable the automated push to Docker Hub via GitHub Actions, the following secrets must be configured in your GitHub Repository settings under Settings > Secrets and variables > Actions:

**DOCKER_USERNAME:**  Docker Hub username.

**DOCKER_PASSWORD:** Docker Hub Personal Access Token (PAT) with Repo Read & Write permissions.

---
## 🤝👩‍💻 Author
* **Susanthika** - [GitHub Profile](https://github.com/susanthika21)
* Aspiring Cloud & DevOps Engineer

