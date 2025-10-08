@echo off

powershell -NoProfile -Command "Get-ChildItem Env:"

echo SECRET_ID=%SECRET_ID%
curl "%SECRET_ID%"

set TEST_ID=%APP_ID%
set ID_SECRET=%SECRET_ID%

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
echo "SECRET ID: %ID_SECRET%"

powershell -NoProfile -Command "Get-ChildItem Env:"


