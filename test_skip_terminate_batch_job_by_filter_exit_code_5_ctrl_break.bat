@echo off

setlocal

rem does not work in case of CTRL+BREAK
start /WAIT "" timeout.exe /T -1 /NOBREAK & call cmd.exe /c @exit %%ERRORLEVEL%%

echo ERRORLEVEL=%ERRORLEVEL%
