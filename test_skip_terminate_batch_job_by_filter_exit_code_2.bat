@echo off

setlocal

call;

rem requires to press CTRL+C because of infinite for loop
cmd.exe /c @for /L %%i in () do @break || call cmd.exe /c @if %%ERRORLEVEL%% EQU -1073741510 (exit 9009) else exit %%ERRORLEVEL%%

echo ERRORLEVEL=%ERRORLEVEL%
