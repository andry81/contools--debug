@echo off

setlocal

echo enter %~nx0
cmd.exe /c exit -1073741510
echo exit %~nx0

exit /b 0
