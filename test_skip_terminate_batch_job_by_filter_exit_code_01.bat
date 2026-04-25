@echo off

setlocal

cmd.exe /c exit -1073741510 || call cmd.exe /c @if %%ERRORLEVEL%% EQU -1073741510 (exit 9009) else exit %%ERRORLEVEL%%

echo ERRORLEVEL=%ERRORLEVEL%
