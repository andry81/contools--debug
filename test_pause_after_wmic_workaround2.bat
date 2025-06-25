@echo off

setlocal

rem script restarts with the pause on exit
if %IMPL_MODE%0 NEQ 0 goto IMPL
"%~dp0_externals\contools--utils\bin\contools\callf.exe" /v IMPL_MODE 1 /no-expand-env /no-subst-pos-vars /no-esc /pause-on-exit // ^
  "%COMSPEC%" "/c \"@\"%~f0\" {*}\"" ^
  %*
exit /b

:IMPL
rem wait without pause to be able to press a key before the script run
for /L %%i in (1,1,10000) do echo %%i

call "%%~dp0_externals\contools\scripts\tools\wmi\print_wmi_local_datetime.vbs.bat"
