@echo off

setlocal

echo enter %~nx0
call "%%~dp0..\_externals\contools\Scripts\Tools\std\assert.bat"
echo exit %~nx0

exit /b 0
