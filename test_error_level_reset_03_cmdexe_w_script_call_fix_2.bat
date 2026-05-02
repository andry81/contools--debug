@echo off

setlocal

call "%%~dp0__init__\__init__.bat" || exit /b

cmd.exe /c @"%~dp0.test_error_level_reset_in_cmdexe_w_script_call\test.bat" ^& "%%CONTOOLS_ROOT%%/std/errlvl.bat"

echo ERRORLEVEL=%ERRORLEVEL%
