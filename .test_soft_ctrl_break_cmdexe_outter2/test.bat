@echo off

setlocal

echo enter %~nx0
call ctrl-break.bat
echo exit %~nx0

exit /b 0
