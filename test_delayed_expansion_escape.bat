@echo off

setlocal ENABLEDELAYEDEXPANSION

set A=123

echo;^!A^!A!A!
echo;"^!A^!A!A!"

setlocal DISABLEDELAYEDEXPANSION & for /F "usebackq tokens=* delims="eol^= %%i in ('^!A^!A!A!') do endlocal & echo;%%i
setlocal DISABLEDELAYEDEXPANSION & for /F "usebackq tokens=* delims="eol^= %%i in ('"^!A^!A!A!"') do endlocal & echo;%%~i

setlocal DISABLEDELAYEDEXPANSION & for /F "usebackq tokens=* delims="eol^= %%i in ('"^!A^!A!A!"') do endlocal & set "B=%%~i"
set B

setlocal DISABLEDELAYEDEXPANSION & for /F "usebackq tokens=* delims="eol^= %%i in ('"^!B^!B!B!"') do endlocal & echo;%%~i
setlocal DISABLEDELAYEDEXPANSION & for /F "usebackq tokens=* delims="eol^= %%i in ('"!B!"') do endlocal & echo;%%~i
