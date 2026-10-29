@echo off

setlocal

set "VAR="

rem CAUTION: `echo` command line must not contain `:`

if not ":" == "%VAR:.%" echo PASSED 1

if "%VAR:.%" == ":" == ".%" == ":" echo PASSED 2

if "%VAR:.%%" == ".%%" echo PASSED 3

if not "%VAR:.%" == ":" echo PASSED 4
