@echo off

setlocal

echo enter %~nx0
call "%%~dp0..\_externals\userbin\scripts\bat\ctrl-break.bat"
echo exit %~nx0

exit /b 0
