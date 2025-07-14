@echo off

setlocal DISABLEDELAYEDEXPANSION

chcp 437

set PREV_INDEX=0
set /A NEXT_INDEX=PREV_INDEX+1

rem ignored characters:
rem 00 - NUL
rem 10 - LF
rem continuation for-read characters:
rem 13 - CR
for /F "usebackq tokens=* delims="eol^= %%i in ("%~dp0eols.txt") do (
  set "LINE=%%i"

  setlocal ENABLEDELAYEDEXPANSION
  if not "!LINE!" == "" if "!LINE:~0,1!" == "[" (
    set NEXT_INDEX_STR=!NEXT_INDEX!
    if "!NEXT_INDEX_STR:~2,1!" == "" set NEXT_INDEX_STR=0!NEXT_INDEX_STR!
    if "!NEXT_INDEX_STR:~2,1!" == "" set NEXT_INDEX_STR=0!NEXT_INDEX_STR!
    <nul set /P =^<!NEXT_INDEX_STR!^>
  )
  endlocal

  echo;%%i

  setlocal ENABLEDELAYEDEXPANSION
  if not "!LINE!" == "" if "!LINE:~0,1!" == "[" (
    endlocal
    call set PREV_INDEX=%%NEXT_INDEX%%
    set /A NEXT_INDEX+=1
  ) else endlocal
)
