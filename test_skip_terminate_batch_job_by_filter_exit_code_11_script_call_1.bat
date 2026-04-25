@echo off

setlocal

call "%%~dp0__init__\__init__.bat" || exit /b

rem DOES work in case of CTRL+BREAK
start /WAIT "" timeout.exe /T -1 /NOBREAK & call "%%CONTOOLS_ROOT%%/std/errlvl.bat"

echo ERRORLEVEL=%ERRORLEVEL%
