@echo off

setlocal DISABLEDELAYEDEXPANSION

set ?.=^^^<nul 2^^^>nul start /B /WAIT "" cmd.exe /c @start /WAIT "" cmd.exe /k @echo close me

set ?.

echo ---

echo on

@echo 1. exe cmdline expansion

"%COMSPEC%" /c @echo_va_args.bat %%?.%%

@echo ---

@echo 2. start+exe cmdline expansion with old environment

start /I /B /WAIT "" "%COMSPEC%" /c @echo_va_args.bat %%?.%%

@echo ---

@echo 3. call+script expansion

call echo_va_args.bat %%?.%%

@echo ---

@echo 4. script w/o call expansion

echo_va_args.bat %?.%
