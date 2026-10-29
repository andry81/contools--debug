@echo off

setlocal

pushd "%~dp0"

echo;1.in:
type 1.in
echo;---

echo Broken iteration

rem trick with simultaneous iteration over 2 list in the same time
(
  for /F "usebackq tokens=* delims="eol^= %%i in ("1.in") do set /P "READ1=" & set "READ2=%%i" & call :PROCESS & echo;---
) < "1.in"

goto NEXT

:PROCESS
set READ
chcp.com
exit /b

:NEXT

echo Fixed iteration 1

rem trick with simultaneous iteration over 2 list in the same time
(
  for /F "usebackq tokens=* delims="eol^= %%i in ("1.in") do set /P "READ1=" & set "READ2=%%i" & call :PROCESS & echo;---
) < "1.in"

goto NEXT

:PROCESS
set READ
chcp.com <nul
exit /b

:NEXT

echo Fixed iteration 2

rem trick with simultaneous iteration over 2 list in the same time
(
  for /F "usebackq tokens=* delims="eol^= %%i in ("1.in") do set /P "READ1=" & set "READ2=%%i" & call :PROCESS <nul & echo;---
) < "1.in"

goto NEXT

:PROCESS
set READ
chcp.com
exit /b

:NEXT

echo Fixed iteration 3

rem trick with simultaneous iteration over 2 list in the same time
(
  for /F "usebackq tokens=* delims="eol^= %%i in ("1.in") do set /P "READ1=" & set "READ2=%%i" & call :PROCESS & echo;---
) < "1.in"

goto NEXT

:PROCESS
set READ
call;|chcp.com
exit /b

:NEXT
exit /b 0
