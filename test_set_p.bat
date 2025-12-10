@echo off

setlocal

:REPEAT
set "CONTINUE_ASK="
echo;Do you want to repeat [y]es/[n]o?
set /P "REPEAT_ASK="

if /i "%REPEAT_ASK%" == "y" goto REPEAT
if /i "%REPEAT_ASK%" == "n" goto CANCEL

"%SystemRoot%\System32\pathping.exe" 127.0.0.1 -n -q 1 -p 1000 >nul 2>nul

goto REPEAT

:CANCEL
echo Cancelled.
