@echo off

setlocal

rem wait without pause to be able to press a key before the pause
for /L %%i in (1,1,10000) do echo %%i

rem does check a key press without read the input buffer, so can miss the input
timeout.exe /T -1
