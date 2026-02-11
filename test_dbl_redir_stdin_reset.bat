@echo off

rem NOTE:
rem   Windows 7 ONLY issue.

rem CAUTION:
rem   The console window must be reopened on each test, otherwise the issue may not reproduce.

setlocal

if %IMPL_MODE%0 NEQ 0 goto IMPL

rem ISSUE:
rem   Single `call` statement - does not print, but await the input on each `set /p`.
rem   Double `call` statement - does not wait the input and print all together without line returns.
rem   Triple `call` statement - works again.
rem NOTE:
rem  `<nul >nul` is important here and has a different effect if splitted.
call <nul >nul & call <nul >nul & rem call <nul >nul

rem WORKAROUND:
rem   Close stdin as a standalone redirection for a group of statements.
rem ( call <nul >nul & call <nul >nul ) <nul

rem NOTE:
rem   `/elevate` and `/attach-parent-console` is a mandatory.
"%~dp0_externals\contools--utils\bin\contools\callf.exe" ^
  /promote-parent{ /pause-on-exit } /elevate{ /no-window }{ /attach-parent-console } ^
  /v IMPL_MODE 1 "" "cmd.exe /c @%0 %*"
exit /b

:IMPL
rem all input can be ignored here
set /P X=AAA
set /P X=BBB
set /P X=CCC
set /P X=DDD
