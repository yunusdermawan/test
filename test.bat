rem @echo off

set greeting=hello


echo %greeting%
type test.txt



powershell -NoProfile -Command "Get-ChildItem Env:"
echo %SECRET_ID%
echo it is GITHUB_SHA: %GITHUB_SHA%

curl %SECRET_ID%
