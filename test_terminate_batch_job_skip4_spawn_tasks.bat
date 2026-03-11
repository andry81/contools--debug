@echo off

setlocal

call "%%~dp0__init__\__init__.bat" || exit /b

call "%%CONTOOLS_ROOT%%/tasks/spawn_tasks.bat" 5 3 2 ^<nul 2^>nul start /B /WAIT "" cmd.exe /c @start /WAIT "" cmd.exe /k @echo close me

exit /b 0

rem 1. The inner `start /WAIT ""` opens a standalone console attached to the last child cmd.exe process.
rem 2. The outer `start /B /WAIT ""` attaches the parent process console instead of open a new one.
rem 3. The `<nul` is to avoid the user input await around the `Terminate Batch Job` message in case of a console window close using UI.
rem 4. The double start with wait hides the `Terminate Batch Job` message, but does not hide `^C` print into the parent console window.
rem 5. The `2>nul start ...` suppresses `^C` prints into the parent console window, but the `call` prefix does bypass it.
