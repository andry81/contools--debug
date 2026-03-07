@echo off

rem NOTE:
rem   Basically the script tests the
rem   `Protect my computer and data from unauthorized program activity` option
rem   in the Windows XP Run As dialog. It must be deselected to pass the test.

setlocal

if %IMPL_MODE%0 NEQ 0 goto IMPL

rem NOTE:
rem   `/elevate` and `/attach-parent-console` is a mandatory.
"%~dp0_externals\contools--utils\bin\contools\callf.exe" ^
  /promote-parent{ /pause-on-exit } /elevate{ /no-window }{ /attach-parent-console } ^
  /v IMPL_MODE 1 "" "cmd.exe /c @%0 %*"
exit /b

:IMPL
rem check for true elevated environment
call "%~dp0_externals\contools\scripts\tools\std\is_admin_elevated.bat" || (
  echo.%~nx0: error: the script process is not properly elevated up to Administrator privileges.
  exit /b 255
) >&2

echo.%~nx0: info: is full admin elevated.
