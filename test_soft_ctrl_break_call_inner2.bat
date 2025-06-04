@echo off

setlocal

call :TEST1

exit /b 0

:TEST1
echo enter TEST1
call :TEST2
echo exit TEST1
exit /b 0

:TEST2
echo enter TEST2
call "%%~dp0_externals\userbin\scripts\bat\ctrl-break.bat"
echo exit TEST2
exit /b 0
