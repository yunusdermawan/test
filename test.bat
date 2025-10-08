rem @echo off

set greeting=hello


echo %greeting%
type test.txt



powershell -NoProfile -Command "Get-ChildItem Env:"
echo %SECRET_ID%
echo it is GITHUB_SHA: %GITHUB_SHA%

set "URL=%SECRET_ID%"

curl "URL"

echo "without invoke"
powershell -NoProfile -Command "curl $env:SECRET_ID"
echo "with invoke"
powershell -NoProfile -Command "Invoke-WebRequest -Uri $env:SECRET_ID -UseBasicParsing"

