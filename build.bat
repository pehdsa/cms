@echo off
setlocal

REM ===== CONFIG =====
set LOCAL_IMAGE=cms
set REMOTE_IMAGE=pehdsa/cms_td_investimentos

if "%~1"=="" (
  echo ❌ Informe a versão.
  echo Exemplo: push-image.bat 1.0.0
  exit /b 1
)

set TAG=%~1

echo =====================================
echo 📦 Local:  %LOCAL_IMAGE%:latest
echo 🚀 Remote: %REMOTE_IMAGE%:%TAG%
echo =====================================

REM ===== TAG =====
docker tag %LOCAL_IMAGE%:latest %REMOTE_IMAGE%:%TAG%
if errorlevel 1 exit /b 1

docker tag %LOCAL_IMAGE%:latest %REMOTE_IMAGE%:latest

REM ===== PUSH =====
docker push %REMOTE_IMAGE%:%TAG%
if errorlevel 1 exit /b 1

docker push %REMOTE_IMAGE%:latest
if errorlevel 1 exit /b 1

echo ✅ Imagem enviada com sucesso!
pause
