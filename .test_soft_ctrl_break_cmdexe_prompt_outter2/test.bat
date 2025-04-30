@echo off

setlocal

echo enter %~nx0
call ctrl-break.bat
echo exit %~nx0

rem exit prompt
exit 0
