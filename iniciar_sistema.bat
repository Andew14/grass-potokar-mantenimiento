@echo off
title Sistema Grass Potokar - Lanzador
echo ========================================================
echo   Iniciando Sistema Grass Potokar (BD + Backend + Frontend)
echo ========================================================

echo [1/3] Iniciando PostgreSQL 17...
start "PostgreSQL" cmd /c "cd /d C:\Users\USER\pgsql && pgsql\bin\postgres.exe -D data"
timeout /t 3 /nobreak > nul

echo [2/3] Iniciando Backend Spring Boot (Puerto 8080)...
start "Backend Spring Boot" cmd /c "cd /d %~dp0grass-potokar-backend-main && mvnw.cmd spring-boot:run"
timeout /t 10 /nobreak > nul

echo [3/3] Iniciando Frontend React + Vite con pnpm (Puerto 5173)...
start "Frontend Vite" cmd /c "cd /d %~dp0grass-potokar-frontend-main && pnpm run dev"

echo.
echo Todo listo. Abriendo el sistema en el navegador...
timeout /t 4 /nobreak > nul
start http://localhost:5173
