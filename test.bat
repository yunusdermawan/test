@echo off

echo SECRET_ID=%SECRET_ID%
curl "%SECRET_ID%"

powershell -NoProfile -Command "Get-ChildItem Env:"

setlocal enabledelayedexpansion

echo Starting test...
echo.

rem Load the secret from PowerShell into CMD variable
for /f "usebackq delims=" %%A in (`powershell -NoProfile -Command "Write-Output $env:SECRET_ID"`) do (
    set "SECRET_ID=%%A"
)

echo SECRET_ID is !SECRET_ID!

rem Use the secret with curl
curl "!SECRET_ID!"

echo "Also using PowerShell to confirm:"
powershell -NoProfile -Command "Invoke-WebRequest -Uri $env:SECRET_ID -UseBasicParsing"

endlocal

echo "APP ID: %APP_ID%"

powershell -NoProfile -Command "Get-ChildItem Env:"
