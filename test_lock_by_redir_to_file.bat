@echo off

setlocal

set "LOCK_FILE=%~dp0.temp\%~n0.0.lock"

(call)

rem lock via redirection to file
set LOCK_ACQUIRE=0
( ( set "LOCK_ACQUIRE=1" & call :LOCKED_CALL ) 9> "%LOCK_FILE%" && set "LOCK_ACQUIRE=1" ) 2>nul

set LOCK_ACQUIRE

exit /b 0

:LOCKED_CALL
pause
