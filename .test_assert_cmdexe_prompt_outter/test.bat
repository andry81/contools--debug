@echo off

setlocal

echo enter %~nx0
call "%%~dp0..\_externals\contools\scripts\tools\std\assert.bat"
echo exit %~nx0

rem exit prompt
exit 0
