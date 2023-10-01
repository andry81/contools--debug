@echo off

set /A rr1=%RANDOM% %% 2
set /A rr2=%RANDOM% %% 2
set /A rr3=%RANDOM% %% 2

setlocal DISABLEDELAYEDEXPANSION

set var1=	;^|="|";,-%%^& 123 "&" !
set var2= ;^|="|";,-%%^& 123 "&" !
set var3=;^|="|";,-%%^& 123 "&" !

rem random variables can be empty
if %rr1% EQU 0 set "var1="
if %rr2% EQU 0 set "var2="
if %rr3% EQU 0 set "var3="

setlocal ENABLEDELAYEDEXPANSION

rem special variable return trick to return variables with special characters
set "RETURN_EXEC_LINE=type nul>nul"
if defined var1 set RETURN_EXEC_LINE=!RETURN_EXEC_LINE! ^& set "var1=%%i"
if defined var2 set RETURN_EXEC_LINE=!RETURN_EXEC_LINE! ^& set "var2=%%j"
if defined var3 set RETURN_EXEC_LINE=!RETURN_EXEC_LINE! ^& set "var3=%%k"

for /F tokens^=^*^ delims^=^ eol^= %%i in ("!RETURN_EXEC_LINE!") do echo.%%i

for /F tokens^=^*^ delims^=^ eol^= %%i in ("!var1!") do (
  for /F tokens^=^*^ delims^=^ eol^= %%j in ("!var2!") do (
    for /F tokens^=^*^ delims^=^ eol^= %%k in ("!var3!") do (
      endlocal
      %RETURN_EXEC_LINE%
    )
  )
)

set rr
set var

exit /b 0
