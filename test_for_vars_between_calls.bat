@echo off

setlocal DISABLEDELAYEDEXPANSION

echo for /F

setlocal & for /F "tokens=* delims="eol^= %%i in ("123&|!<") do endlocal & call :TEST
goto NEXT

:TEST
setlocal & for /F "tokens=* delims="eol^= %%j in ("321") do endlocal & echo;%%i & echo;%%j
echo;=%%i=
setlocal & for %%a in (:) do endlocal & echo;=%%i=
exit /b 0

:NEXT

echo;---

echo for in

setlocal & for %%i in (:^!123^& :^<456^|) do endlocal & call :TEST
goto NEXT

:TEST
setlocal & for %%j in (:321 :654) do endlocal & echo;%%i & echo;%%j
echo;=%%i=
setlocal & for %%a in (:) do endlocal & echo;=%%i=
exit /b 0

:NEXT

echo;---

echo for in with %%* in nested for in

for %%i in (:123^| :456^&) do call :TEST %%i
goto NEXT

:TEST
for %%j in (%*) do echo;%%j
exit /b 0

:NEXT

echo;---

echo for in with %%i in nested for in

for %%i in (:123^| :456^&) do call :TEST
goto NEXT

:TEST
for %%j in (%%i) do echo;%%j
exit /b 0

:NEXT

echo;---

echo for in with %%i in nested for in (workaround)

for %%i in (:123^| :456^&) do call :TEST
goto NEXT

:TEST
for %%a in (:) do for %%i in (%%i) do echo;%%i
exit /b 0

:NEXT

echo;---
