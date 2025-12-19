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
echo 📦 Build Local: cms:latest
echo 🚀 Remote: %REMOTE_IMAGE%:%TAG%
echo =====================================

REM ===== 1. BUILD COM --NO-CACHE =====
echo.
echo 🛠️ Iniciando BUILD da imagem local (CMS) com NO-CACHE...
docker build --no-cache -t %LOCAL_IMAGE%:latest -f docker/Dockerfile .
if errorlevel 1 (
    echo ❌ Erro durante o BUILD. Abortando.
    exit /b 1
)
echo ✅ BUILD concluído com sucesso.

REM ===== 2. TAG =====
echo.
echo 🏷️ Criando tags...
docker tag %LOCAL_IMAGE%:latest %REMOTE_IMAGE%:%TAG%
if errorlevel 1 exit /b 1

docker tag %LOCAL_IMAGE%:latest %REMOTE_IMAGE%:latest

REM ===== 3. PUSH =====
echo.
echo ⬆️ Enviando imagem para o Docker Hub...
docker push %REMOTE_IMAGE%:%TAG%
if errorlevel 1 exit /b 1

docker push %REMOTE_IMAGE%:latest
if errorlevel 1 exit /b 1

echo.
echo ✅ Imagem enviada com sucesso! Versão: %TAG%
pause