# Python Flask Web Application - Containerization Project

A lightweight, production-ready Python & Flask web service containerized using Docker and published to Docker Hub as part of a personal DevOps infrastructure toolkit.

## 🚀 Project Overview
This project demonstrates foundational containerization principles:
- **Application Layer:** Built a RESTful web service using Python and Flask.
- **Containerization:** Wrote an optimized `Dockerfile` leveraging a slim Python base image and efficient layer caching.
- **Image Registry:** Built, tagged, and pushed the production image to [Docker Hub](https://hub.docker.com/repositories/susanthika21).

---

## 🛠️ Tech Stack
* **Language:** Python 3.11
* **Framework:** Flask
* **Containerization:** Docker & Docker Desktop
* **Registry:** Docker Hub (`susanthika21/my-python-app`)

---

## ⚙️ How to Run Locally

You can run this container directly from Docker Hub with a single command:

```bash
docker run -d -p 8080:5000 susanthika21/my-python-app:v1

---
Once running, open your browser and visit:  http://localhost:8080

📂 Project Structure

python-docker-project/
├── app.py              # Main Flask application logic
├── requirements.txt    # Python package dependencies
├── Dockerfile          # Container build instructions
├── .dockerignore       # Files to exclude from build context
└── README.md           # Project documentation

