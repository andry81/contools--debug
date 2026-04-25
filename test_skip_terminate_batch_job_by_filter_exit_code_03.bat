@echo off

setlocal

rem requires to press CTRL+C because of infinite timeout
timeout.exe /T -1 /NOBREAK || call cmd.exe /c @if %%ERRORLEVEL%% EQU -1073741510 (exit 9009) else exit %%ERRORLEVEL%%

echo ERRORLEVEL=%ERRORLEVEL%
