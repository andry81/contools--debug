@echo off

setlocal

rem sets error level
(call)
echo 1. ERRORLEVEL=%ERRORLEVEL%

rem does NOT reset error level
set "A=123"
echo 2. ERRORLEVEL=%ERRORLEVEL%

setlocal ENABLEEXTENSIONS
rem resets error level
set "A=123"
echo 3. ERRORLEVEL=%ERRORLEVEL%
endlocal

rem does NOT set error level
set "A="
echo 4. ERRORLEVEL=%ERRORLEVEL%

rem resets error level
call;
echo 5. ERRORLEVEL=%ERRORLEVEL%

rem sets error level
<nul set /P "A="
echo 6. ERRORLEVEL=%ERRORLEVEL%
