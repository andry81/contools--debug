@echo off

setlocal

echo enter %~nx0
cmd.exe /k @"%~dp0.%~n0\test.bat"
echo exit %~nx0

exit /b 0
