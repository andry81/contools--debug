@echo off

setlocal

set @CMD_SKIP_TERMINATE_BATCH_JOB="%%SystemRoot%%\System32\cmd.exe" /s /c "@if %%ERRORLEVEL%% EQU -1073741510 (exit 9009) else exit %%ERRORLEVEL%%"

rem The `Terminate batch job` skip does NOT work completely due to early SIGINT handle in the `cmd.exe`, `cmd.exe` sets ERRORLEVEL=255 on SIGINT
cmd.exe /c @"%~dp0.%~n0\test.bat" & call %@CMD_SKIP_TERMINATE_BATCH_JOB%

echo ERRORLEVEL=%ERRORLEVEL%
