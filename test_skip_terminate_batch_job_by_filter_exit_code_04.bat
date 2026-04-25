@echo off

setlocal

set @CMD_SKIP_TERMINATE_BATCH_JOB="%%SystemRoot%%\System32\cmd.exe" /S /c "@if %%ERRORLEVEL%% EQU -1073741510 (exit 9009) else exit %%ERRORLEVEL%%"

start /WAIT "" timeout.exe /T -1 /NOBREAK & call %@CMD_SKIP_TERMINATE_BATCH_JOB%

echo ERRORLEVEL=%ERRORLEVEL%
