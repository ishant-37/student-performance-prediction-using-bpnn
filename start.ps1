# EduPredict — Start both Backend (FastAPI) and Frontend (Vite) together
$ErrorActionPreference = "Stop"
$root = $PSScriptRoot

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   EduPredict — Starting Project" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# --- Start FastAPI Backend ---
Write-Host "[1/2] Starting Backend (FastAPI) on http://localhost:8000 ..." -ForegroundColor Yellow
$api = Start-Process powershell -ArgumentList "-NoExit", "-Command",
    "Set-Location '$root'; python -m uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000" `
    -PassThru

# Give backend a moment to start
Start-Sleep -Seconds 3

# --- Start Vite Frontend ---
Write-Host "[2/2] Starting Frontend (Vite) on http://localhost:5173 ..." -ForegroundColor Yellow
$web = Start-Process powershell -ArgumentList "-NoExit", "-Command",
    "Set-Location '$root\frontend'; npm run dev" `
    -PassThru

Start-Sleep -Seconds 2

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "   Project is running!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "  Frontend  -> http://localhost:5173" -ForegroundColor White
Write-Host "  Backend   -> http://localhost:8000" -ForegroundColor White
Write-Host "  API Docs  -> http://localhost:8000/docs" -ForegroundColor White
Write-Host ""
Write-Host "  Opening browser..." -ForegroundColor DarkGray
Start-Process "http://localhost:5173"

Write-Host ""
Write-Host "Close the two terminal windows to stop the servers." -ForegroundColor DarkGray
