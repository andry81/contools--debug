@echo off

setlocal

rem requires CTRL+C or CTRL+BREAK because of infinite loop, but does not print `^C` because `break` sets ERRORLEVEL=255 on SIGINT
cmd.exe /c @for /L %%i in () do @break & call :ERR_FILTER

echo ERRORLEVEL=%ERRORLEVEL%

exit /b

rem DOES skip `Terminate Batch Job`
:ERR_FILTER
exit /b
