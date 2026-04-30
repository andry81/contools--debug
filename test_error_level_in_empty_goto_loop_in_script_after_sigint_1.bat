@echo off

setlocal

rem The `Terminate batch job` skip does NOT work completely due to early SIGINT handle in the `cmd.exe`, `cmd.exe` sets ERRORLEVEL=255 on SIGINT
cmd.exe /c @"%~dp0.%~n0\test.bat" & call :ERR_FILTER

echo ERRORLEVEL=%ERRORLEVEL%

exit /b

rem DOES skip the second `Terminate batch job`
:ERR_FILTER
exit /b
