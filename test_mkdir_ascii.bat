@echo off

setlocal DISABLEDELAYEDEXPANSION

rem to make not printable characters visible
chcp 437

rem CAUTION:
rem   The `LF` affects `!` character expansion in
rem   `setlocal DISABLEDELAYEDEXPANSION` context.
rem
set "ASCII_FILE=ascii-nocrlf.txt"

set /P CHARS=<"%ASCII_FILE%" & rem w/o NUL and cleared CR

for /F "tokens=* delims="eol^= %%i in ("%ASCII_FILE%") do set "ASCII_FILE_SIZE=%%~zi"

if not defined CHARS exit /b 1

set "WD=%~dp0.temp"

set ASCII_CODE=1
set PREV_INDEX=0
set /A NEXT_INDEX=PREV_INDEX+1

cd "%WD%" || exit /b

:LOOP
if %ASCII_CODE% GEQ %ASCII_FILE_SIZE% exit /b 0
if %PREV_INDEX% GEQ %ASCII_FILE_SIZE% exit /b 0
if %PREV_INDEX% GEQ 255 exit /b 0 & rem just in case

set ASCII_CODE_STR=%ASCII_CODE%

if "%ASCII_CODE_STR:~2,1%" == "" set ASCII_CODE_STR=0%ASCII_CODE_STR%
if "%ASCII_CODE_STR:~2,1%" == "" set ASCII_CODE_STR=0%ASCII_CODE_STR%

if not "!CHARS:~%PREV_INDEX%,1!" == "" setlocal ENABLEDELAYEDEXPANSION & for /F "tokens=* delims="eol^= %%i in ("!CHARS:~%PREV_INDEX%,1!") do endlocal & set "CHAR_%ASCII_CODE%=%%i"

if defined CHAR_%ASCII_CODE% setlocal ENABLEDELAYEDEXPANSION & for /F "tokens=* delims="eol^= %%i in ("!CHAR_%ASCII_CODE%!") do endlocal & (
  echo;[%ASCII_CODE_STR%] ^|%%i^|
  if exist "[%ASCII_CODE_STR%] %%i" rmdir "[%ASCII_CODE_STR%] %%i"
  mkdir "[%ASCII_CODE_STR%] %%i"
) else set CHAR_%ASCII_CODE%

set PREV_INDEX=%NEXT_INDEX%
set /A NEXT_INDEX+=1
set /A ASCII_CODE+=1

goto LOOP
