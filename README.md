# EduPredict: Student Performance Prediction

EduPredict is a full-stack student performance prediction application. It uses a
trained backpropagation neural network (BPNN) to estimate pass probability from
student academic and behavioural features, with a React dashboard for
predictions, analytics, CSV import, experiments, and PDF reports.

## Features

- Individual and batch student predictions
- Pass-probability and risk analysis
- CSV import and cohort comparison
- Sensitivity and counterfactual analysis
- Neural-network structure and prediction-trace visualizations
- Calibration and model metadata endpoints
- PDF session report generation

## Technology stack

- **Frontend:** React, Vite, Axios, and Lucide React
- **Backend:** FastAPI, Uvicorn, Pydantic, pandas, scikit-learn, and TensorFlow
- **Model artifacts:** `model.h5` and `scaler.pkl`
- **Data:** `student_data.csv`

## Requirements

- Python 3.12 or a compatible Python version supported by TensorFlow
- Node.js 18 or newer
- npm

## Run locally

Install the backend dependencies:

```powershell
python -m pip install -r backend\requirements.txt
```

Install the frontend dependencies:

```powershell
Set-Location frontend
npm install
Set-Location ..
```

Start both services from the project root:

```powershell
.\start.ps1
```

The application will be available at:

- Frontend: <http://localhost:5173>
- Backend API: <http://localhost:8000>
- Interactive API documentation: <http://localhost:8000/docs>
- Health check: <http://localhost:8000/health>

The launcher opens separate PowerShell windows for the backend and frontend.
Close those windows to stop the services.

### Start services separately

Backend:

```powershell
python -m uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000
```

Frontend, in a second terminal:

```powershell
Set-Location frontend
npm run dev
```

The Vite development server proxies `/api` requests to the backend on port
8000.

## Run with Docker Compose

Build and start the API and production frontend containers:

```powershell
docker compose up --build
```

With Docker Compose, the frontend is served at
<http://localhost:8080> and the API is available at
<http://localhost:8000>.

## Useful commands

Run the frontend linter:

```powershell
Set-Location frontend
npm run lint
```

Build the frontend:

```powershell
Set-Location frontend
npm run build
```

## Learning guide

For a detailed explanation of the architecture, machine-learning pipeline,
backend and frontend code paths, API examples, Docker workflow,
troubleshooting, and guided exercises, see
[EduPredict_Project_Learning_Guide.pdf](EduPredict_Project_Learning_Guide.pdf).

The PDF can be regenerated after updating the guide source:

```powershell
python scripts\create_project_guide.py
```

## Repository structure

```text
backend/                 FastAPI application and prediction services
frontend/                React/Vite dashboard
scripts/                 Training, calibration, and API helper scripts
model.h5                 Trained BPNN model
scaler.pkl               Feature-scaling artifact
student_data.csv         Training/reference data used by the API
start.ps1                Local launcher for both services
docker-compose.yml       Containerized API and frontend configuration
```

## API overview

The complete, interactive API reference is available at
<http://localhost:8000/docs> while the backend is running. Important routes
include:

- `GET /health`
- `POST /predict`
- `POST /predict/batch`
- `POST /import/csv`
- `GET /meta/network`
- `GET /meta/calibration`
- `POST /labs/sensitivity`
- `POST /labs/counterfactual`
- `POST /report/pdf`

## License

This project is distributed under the license in [LICENSE](LICENSE).
