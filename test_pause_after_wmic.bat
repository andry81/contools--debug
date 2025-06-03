@echo off

setlocal

rem wait without pause to be able to press a space before the `wmic.exe` run
for /L %%i in (1,1,10000) do echo %%i

rem may consume a single press into console window
"%SystemRoot%\System32\wbem\wmic.exe" path Win32_OperatingSystem get LocalDateTime /VALUE

rem pause may remain
pause
