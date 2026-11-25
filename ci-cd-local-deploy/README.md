# 🚀 Automated CI/CD Pipeline with GitHub Actions & Self-Hosted Runner

A complete Continuous Integration and Continuous Deployment (CI/CD) automation pipeline that tests a Python Flask web application, builds and pushes a versioned container image to Docker Hub, and automatically deploys the live container onto a local Ubuntu Linux server (WSL) using a **GitHub Actions Self-Hosted Runner**—without requiring public IP exposure, inbound firewall ports, or SSH keys.


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


| Component / Tool | Why We Used It |
| :--- | :--- |
| **Python & Flask (`app.py`)** | Provides a lightweight HTTP microservice running on port `5000` inside the container, making version changes (`v1` → `v2`) immediately verifiable via `curl` or a browser. |
| **Python `unittest` (`test_app.py`)** | Acts as an automated quality gate in CI. If any endpoint fails or returns an unexpected status/response, the pipeline aborts *before* building or pushing a broken Docker image. |
| **Docker & `python:3.11-slim`** | Packages the application and its exact dependencies into an immutable, portable container image while keeping image size small (`-slim` base + `--no-cache-dir`). |
| **Docker Hub (`susanthika21/my-python-app`)** | Serves as the central container registry decoupling the CI build environment (`ubuntu-latest`) from the CD deployment environment (`self-hosted`). |
| **GitHub Actions (`ubuntu-latest`)** | Executes Continuous Integration (checkout, dependency installation, unit testing, Docker image build & registry push) on every push to `main` or `master`. |
| **GitHub Actions Self-Hosted Runner** | Executes Continuous Deployment directly on the target Ubuntu WSL host. Because the runner polls GitHub over outbound HTTPS (`443`), it pulls the newly built image and restarts the local container securely behind NAT/firewalls. |

---

## 2. Repository & Project Structure

  ```text
my-devops-toolkit-/
├── .github/
│   └── workflows/
│       └── ci-cd-pipeline.yml     # Two-stage CI (cloud) + CD (self-hosted) pipeline
└── ci-cd-local-deploy/
    ├── app.py                     # Flask application exposing '/' on 0.0.0.0:5000
    ├── test_app.py                # Automated unit tests for Flask routes & payload
    ├── requirements.txt           # Python dependencies (Flask)
    ├── Dockerfile                 # Container image build instructions
    └── README.md                  # Detailed architecture, setup & troubleshooting guide

```
---

## 3. Everything We Built & Configured (Step-by-Step)
****Step 1:** Application, Unit Tests & Containerization (`ci-cd-local-deploy/`)**

1. `app.py` **(Web Application):**

   - Created a Flask server bound to `0.0.0.0:5000` so external traffic mapped from the host port (`8080`) can reach the container.

   - Returned a clear versioned response (`Hello from CI/CD Self-Hosted Deployment - v1!`, later updated to `v2!`) to verify zero-         manual- intervention rollouts.

2. `test_app.py` **(Automated Verification):**

   - Used Flask's built-in `app.test_client()` with Python's `unittest` framework to verify that `GET /` returns HTTP `200 OK` and           contains the exact expected version string.

3. `Dockerfile` **(Container Spec):**

   - Base image: `python:3.11-slim` for fast pulls and minimal attack surface.

   - Set `WORKDIR /app` , copied `requirements.txt`, installed dependencies with `pip install --no-cache-dir -r requirements.txt` ,         copied application source code, exposed port `5000`, and defined `CMD ["python", "app.py"]`

**Step 2: GitHub Repository Secrets Configuration**

   To prevent hardcoding credentials in YAML files or source control, Docker Hub credentials were stored encrypted under Repository       Settings → Secrets and variables → Actions:

- `DOCKER_USERNAME`: Docker Hub username (susanthika21)

- `DOCKER_PASSWORD`: Docker Hub password / Personal Access Token (PAT)

**Step 3: Self-Hosted Runner Provisioning on Ubuntu WSL**

To allow GitHub Actions to run deployment commands directly on the local machine:

1. Installed the required .NET globalization library (`libicu-dev`) on Ubuntu WSL so the GitHub Actions runner binary could execute       cleanly.

2. Downloaded and extracted the Linux x64 GitHub Actions runner package inside `~/actions-runner`.

3. Registered the runner against `https://github.com/susanthika21/my-devops-toolkit-` using `./config.sh --url ... --token ...` (assigning the default `self-hosted`, `Linux`, `X64` labels).

4. Started the listener via `./run.sh` (`√ Connected to GitHub → Listening for Jobs`).

**Step 4: Two-Stage CI/CD Workflow (`.github/workflows/ci-cd-pipeline.yml`)**

   **Stage 1** — `build-and-push` (Runs on `ubuntu-latest`)
   
      1. Checkout Code (`actions/checkout@v4`): Clones the latest commit from `main/master`.

      2. Set up Python & Run Tests ( `actions/setup-python@v5` ): Installs Python 3.11, installs `ci-cd-local-deploy/requirements.txt`, and executes `python -m unittest discover -s ci-cd-local-deploy`.

      3. Log in to Docker Hub (`docker/login-action@v3`): Authenticates using `${{ secrets.DOCKER_USERNAME }}` and `${{ secrets.DOCKER_PASSWORD }}`

      4. Build and Push Image (`docker/build-push-action@v5`): Builds `./ci-cd-local-deploy/Dockerfile` and pushes `susanthika21/my-python- app:ci-cd-latest` to Docker Hub.

   **Stage 2** — `deploy` (Runs on `self-hosted`, depends on `needs: build-and-push`)
      Runs automatically on the local Ubuntu WSL runner only after `build-and-push` succeeds:

      1. `docker pull susanthika21/my-python-app:ci-cd-latest`: Downloads the freshly built image from Docker Hub.

      2. `docker stop flask-cicd-demo || true` & `docker rm flask-cicd-demo || true` : Gracefully stops and removes the previous container version (`|| true` ensures the first deployment never fails if no container exists yet).

      3. `docker run -d --name flask-cicd-demo -p 8080:5000 --restart unless-stopped ...`: Starts the new container in detached mode,mapping host port `8080` to container port `5000` with automatic restart resilience.

      4. `docker image prune -f` : Cleans up dangling/untagged old image layers to reclaim local disk space.

## 4. Verification & Automated Rollout Testing (v1 → v2)

**1. Initial Deployment (`v1`):**

   - Verified container status with docker ps (flask-cicd-demo running on 0.0.0.0:8080->5000/tcp).

   - Verified HTTP response:

```Bash
curl http://localhost:8080
# Output: Hello from CI/CD Self-Hosted Deployment - v1!
 ```
     
**2. End-to-End Automated Rollout (`v2`):**

   - Updated the response string from `v1` to `v2` in both `app.py` and `test_app.py` and pushed to `main`

   - GitHub Actions automatically ran unit tests, built and pushed the updated `ci-cd-latest` image, and triggered          the self-hosted runner to replace the running container on port `8080`:

 ``` Bash
curl http://localhost:8080
# Output: Hello from CI/CD Self-Hosted Deployment - v2!
```

### 5. Issues Faced & Troubleshooting

**1. Issue / Error:** `curl: (7) Failed to connect to localhost port 8080`
**Root Cause:** No `flask-cicd-demo` container existed yet because the upstream CI job had not completed pushing the image.
**Resolution:** Checked `docker ps -a` and GitHub Actions logs to trace the failure back to the `build-and-push` job.

**2. Issue / Error:** `deploy` job stuck in `Queued / Canceled` state
  ** Root Cause:** The self-hosted runner process (`./run.sh`) in Ubuntu WSL was not actively listening when the workflow triggered.
  ** Resolution:** Started `./run.sh` in `~/actions-runner` (`Listening for Jobs`) and re-ran the workflow job so the runner picked it up immediately.


