@echo off

rem NOTE:
rem   Repro in: Windows 7, 8.1

rem ISSUE:
rem   Depending on quantity of statements and standard handle address allocation/randomization
rem   inside a console Windows process it has several variants:
rem
rem     * Does not print, but await the input (stdin is not broken, stdout is broken).
rem     * Does wait the input and print each line without line returns (stdin is not broken, stdout is partially broken).
rem     * Does not wait the input and print all together without line returns (stdin is broken, stdout is partially broken).
rem
rem   All of these above is because of a not fully accurate standard handle address sanitizer (remapper) after admin-to-user console reattachment in the `callf`.
rem   The standard handle address table is different for an elevated and a not elevated process and
rem   CRT/WIN32 standard handles table must be remapped after the console reattachment.

setlocal

if %IMPL_MODE%0 NEQ 0 goto IMPL

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
