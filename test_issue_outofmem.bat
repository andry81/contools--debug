@echo off

rem Details:
rem   https://stackoverflow.com/questions/15466298/simple-caret-at-end-of-windows-batch-file-consumes-all-memory
rem   https://web.archive.org/web/20170814061717/https://stackoverflow.com/questions/23284131/cmd-exe-parsing-bug-leads-to-other-exploits

call :OUT_OF_MEMORY ^^
exit /b

:OUT_OF_MEMORY
call set __DUMMY=%%1
