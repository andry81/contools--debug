@echo off

setlocal

call;

cmd.exe /c @"%~dp0.test_error_level_reset_in_cmdexe_w_script_call\test.bat" ^& exit

echo ERRORLEVEL=%ERRORLEVEL%
