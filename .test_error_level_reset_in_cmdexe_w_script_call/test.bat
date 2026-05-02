@echo off

setlocal

call;

call :TEST || exit /b
exit /b 0

:TEST
exit /b 123
