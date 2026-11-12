#  Python Flask Web Application - Containerized Deployment 

A lightweight, production-ready Python & Flask web service containerized using Docker, locally tested via Docker Desktop, and published to [Docker Hub](url:id=40) as part of a personal DevOps infrastructure toolkit.

---

## 📋 Project Overview & Objectives
Modern cloud infrastructure relies heavily on containerization to eliminate environment discrepancies (the
classic "it works on my machine" problem). This project showcases essential DevOps competencies by
packaging a lightweight RESTful web application into a secure, portable, and reproducible Docker container.

This project demonstrates foundational containerization and registry publishing principles:
- **Application Layer:** Developed a clean RESTful microservice API using Python and the lightweight Flask
web framework.
- **Containerization:** Wrote an optimized `Dockerfile` leveraging a slim Python base image, efficient layer caching, and a secure `.dockerignore` file.
- **Local Validation:** Successfully built and tested containerized networking via port mapping on Docker Desktop.
- **Image Registry Management:** Tagged, authenticated, and pushed the production image to [Docker Hub]( susanthika21/my-python-app).

---

## 🛠️ Tech Stack & Tools
* **Programming Language:** Python 3.11
* **Web Framework:** Flask (v3.0+)
* **Containerization:** Docker, Docker Engine & Docker Desktop
* **Registry:** Docker Hub (`susanthika21/my-python-app`)
* **Version Control:** Git & GitHub (`my-devops-toolkit- repository`)

---
## 📁 Included Files & Structure
- **`app.py`**: Main Flask web application logic, routing, and JSON response definitions.
- **`requirements.txt`**: Python package dependencies required to run the service (Flask).
- **`Dockerfile`**: Multi-step container build instructions using a lightweight Python base image.
- **`.dockerignore`**: Specifies files and directories excluded from the Docker build context.
- **`README.md`**: Comprehensive project documentation, tech stack details, and usage instructions.

---
## 🚀 Getting Started & Usage

1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/susanthika21/my-devops-toolkit-.git](https://github.com/susanthika21/my-devops-toolkit-.git)
   cd my-devops-toolkit-/python-docker-project


2. **Run the Container Directly from Docker Hub:**
   
   You can pull and run the pre-built container image instantly with a single command without building it locally:
   ```bash
   docker run -d -p 8080:5000 --name running-python-app susanthika21/my-python-app:v1

3.  **Verify the Application:**

   Once running, open your web browser or test via curl:
  - URL: http://localhost:8080
  - Expected Output JSON:

     ```JSON
     {
        "project": "Project #3 - Dockerization",
     "status": "Running smoothly inside a container!",
      "tech_stack": "Python & Flask"
    }

---

## **🔄 Development Workflow & Container Lifecycle**

**1. Build Image:** docker build -t my-python-app:v1 .

**2. Tag Image:** docker tag my-python-app:v1 susanthika21/my-python-app:v1

**3. Push to Registry:** docker push susanthika21/my-python-app:v1

**4. Stop Container:** docker stop running-python-app

---
## **🤝 Author**
* **Susanthika** - [GitHub Profile](https://github.com/susanthika21)
* Docker Hub Namespace: susanthika21
