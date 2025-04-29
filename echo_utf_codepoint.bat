@echo off

setlocal

chcp 866 >nul

set "?05=+"

chcp 65000 >nul

cmd.exe /C @echo;%?05%%~1
