@echo off

setlocal

set NUL= 

rem ignored characters:
rem 00 - NUL character
rem 10 - LF character
for /F usebackq^ tokens^=^*^ delims^=%NUL%^ eol^= %%i in ("%~dp0eols.txt") do (echo.%%i)
