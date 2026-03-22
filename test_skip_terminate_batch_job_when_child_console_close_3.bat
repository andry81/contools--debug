@echo off

setlocal

set "CMDLINE_PREFIX=^<nul 2^>nul"

call :TEST %%CMDLINE_PREFIX%% start /B /WAIT "" cmd.exe /c @start /WAIT "" cmd.exe /k @echo close me

exit /b 0

:TEST
%*
exit /b

rem 1. The inner `start /WAIT ""` opens a standalone console attached to the last child cmd.exe process.
rem 2. The outer `start /B /WAIT ""` attaches the parent process console instead of open a new one.
rem 3. The `<nul` is to avoid the user input await around the `Terminate Batch Job` message in case of a child console window close using UI.
rem 4. The double start with wait hides the `Terminate Batch Job` message, but does not hide `^C` print into the parent console window.
rem 5. The `2>nul start ...` suppresses `^C` prints into the parent console window, but the `call` prefix does bypass it, so we replaces `^<nul 2^>nul` to evaluate command line prefix after the call prefix.
