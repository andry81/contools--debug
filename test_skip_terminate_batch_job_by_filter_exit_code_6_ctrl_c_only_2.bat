@echo off

setlocal

set @CMD_SKIP_TERMINATE_BATCH_JOB="%%SystemRoot%%\System32\cmd.exe" /S /c "@if %%ERRORLEVEL%% EQU -1073741510 (exit 9009) else exit %%ERRORLEVEL%%"

set :CALL_CMD_SKIP_TERMINATE_BATCH_JOB=call %%@CMD_SKIP_TERMINATE_BATCH_JOB%%

rem DOES work in case of CTRL+C only (not CTRL+BREAK), single `^C` print
start /WAIT "" timeout.exe /T -1 /NOBREAK & %:CALL_CMD_SKIP_TERMINATE_BATCH_JOB%

echo ERRORLEVEL=%ERRORLEVEL%
