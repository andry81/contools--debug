@echo off

setlocal

call "%%~dp0__init__\__init__.bat" || exit /b

rem contools installation
call "%%CONTOOLS_PROJECT_ROOT%%\_install.bat" %%*
