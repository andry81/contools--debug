@echo off

setlocal

rem DOES work in case of CTRL+C only (not CTRL+BREAK), double `^C` print
start /WAIT "" timeout.exe /T -1 /NOBREAK & call cmd.exe /c @exit %%ERRORLEVEL%%

echo ERRORLEVEL=%ERRORLEVEL%
