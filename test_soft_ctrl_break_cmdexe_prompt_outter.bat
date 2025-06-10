@echo off

setlocal

echo enter %~nx0
echo warning: CTRL-BREAK won't exit outer prompt. You must type exit explicitly here!
cmd.exe /k @"%~dp0.%~n0\test.bat"
echo exit %~nx0

exit /b 0
