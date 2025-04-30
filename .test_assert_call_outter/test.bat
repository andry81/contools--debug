@echo off

setlocal

echo enter %~nx0
call assert.bat
echo exit %~nx0

exit /b 0
