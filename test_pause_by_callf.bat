@echo off

setlocal

set "CONTOOLS_UTILS_BIN_ROOT=%~dp0_externals\contools--utils\bin"

rem wait without pause to be able to press a key before the pause
for /L %%i in (1,1,10000) do echo %%i

rem does check a key press by read from the input buffer ignoring the standard input handle redirection
"%CONTOOLS_UTILS_BIN_ROOT%/contools/callf.exe" /pause-on-exit .
