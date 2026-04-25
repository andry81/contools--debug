@echo off

setlocal

rem `%%#` must remain as is in a subroutine or even in a subscript (see `test_for_vars_between_calls.bat` test script)

setlocal ENABLEDELAYEDEXPANSION

set A=%%#

for /L %%# in (1,1,16) do for /L %%# in (1,1,16) do for /L %%# in (1,1,16) do for /L %%# in (1,1,16) do ^
for /L %%# in (1,1,16) do for /L %%# in (1,1,16) do for /L %%# in (1,1,16) do for /L %%# in (1,1,16) do ^
for %%# in (%%) do for %%# in (%%##) do (
  echo;^|%%#^|
  echo;^|%A%^|
  exit /b
)
