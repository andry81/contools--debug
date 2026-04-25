@echo off

setlocal

rem DOES work in case of CTRL+BREAK
start /WAIT "" timeout.exe /T -1 /NOBREAK & call :SETERR

echo ERRORLEVEL=%ERRORLEVEL%

exit /b

:SETERR
exit /b
