## **🚀Overview**

To solidify my DevOps fundamentals, I built a centralized DevOps toolkit repository containing hands-on labs across the deployment lifecycle. 
I started with Bash scripting for Linux server administration, moved to Ansible for automated configuration management, containerized Python Flask apps with Docker, and finally built automated CI/CD pipelines using both Jenkins and GitHub Actions to test, build, and push images to Docker Hub.

### **✅Project-by-Project Breakdown**
1.  `linux-automation-toolkit` **(OS & Shell Scripting)**
   
      - **What it is:** Four Bash scripts (`setup.sh`, `backup.sh`, `log_cleanup.sh`, `health_check.sh` ) that automate routine Linux sysadmin tasks.
    - **How it works:** Instead of typing commands manually every day, these scripts use Linux utilities ( `tar`, `cron`,` df`, `free`, `find`) to initialize server directories, compress backups with timestamps,
        delete old logs to save disk space, and monitor CPU/RAM/disk usage.
      
    Every DevOps engineer needs strong Linux fundamentals. I wrote modular Bash scripts to handle server health monitoring, automated backups,
    and log rotation so servers don't crash from full disks.
---
2. `ansible-server-setup` **(Configuration Management)**

     - **What it is:** Infrastructure-as-Code (IaC) using an inventory file (hosts.ini) and a YAML playbook (playbook.yml).
     - **How it works:** Ansible connects to target Linux servers over SSH (agentless) and enforces a desired state—creating application directories (/opt/app) and installing required system packages (git, htop) consistently across machines.

   Bash scripts are great for one server, but if I have 10 servers, I need idempotency.
   I used Ansible to automate server provisioning so any fresh Linux machine gets configured identically with one command.
---
3. `python-docker-project` **(Containerization)** 🐳

    -  **What it is:** A Python Flask web app (`app.py`) packaged with a `Dockerfile` and `.dockerignore`

    - **How it works:** The `Dockerfile` takes a lightweight Python base image, copies your code, installs dependencies from `requirements.txt`, exposes a port, and runs the app. `.dockerignore` keeps unnecessary local files out of the image to keep it small and fast.

   To eliminate 'it works on my machine' issues, I containerized a Python Flask microservice using Docker, optimizing the image size with
   `.dockerignore` and verifying it locally before pushing to Docker Hub
   
   ---
4. `jenkins-docker-demo` & `ci-cd-local-deploy` **(CI/CD with Jenkins)**

   - **What it is:** An automated pipeline defined in a `Jenkinsfile` that builds and deploys a containerized Python app.
   - **How it works:** When code changes are pushed to GitHub, a webhook triggers Jenkins. Jenkins reads the `Jenkinsfile`, pulls the code,              builds a fresh Docker image, and deploys the running container.
     
   I built a Jenkins pipeline using a declarative `Jenkinsfile` to automate the build-and-deploy lifecycle—turning a manual `docker build` and          `docker run` process into an automated pipeline triggered by Git commits.
---
5. `.github/workflows` (`ci-docker-pipeline.yml` / `ci-cd-pipeline.yml`) **(Cloud-Native CI/CD)**
      
     - **What it is:** Event-driven CI/CD workflows hosted directly on GitHub Actions.
     - **How it works:** Whenever you push code or open a pull request on `main`, GitHub spins up an Ubuntu runner, installs Python, runs your               unit tests (`test_app.py`), authenticates with Docker Hub using encrypted GitHub Secrets (`DOCKER_USERNAME`, `DOCKER_PASSWORD`),                  builds the image via Docker Buildx, and pushes it to your registry.

    Alongside Jenkins, I implemented a serverless CI/CD workflow using GitHub Actions. A key challenge I solved here was configuring repository      secrets with a Docker Hub Personal Access Token and setting custom subfolder build contexts since all my projects live in a monorepo.

---

<div align="center">
   
### ✨ **Susanthika Muddada** ✨ 
*DevOps & Cloud Engineer* 

🌐 Connect with me: 👇

[![GitHub](https://img.shields.io/badge/GitHub-susanthika21-181717?style=flat&logo=github)](https://github.com/susanthika21) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin)](https://www.linkedin.com/in/susanthika-muddada-407374208/)

</div>
