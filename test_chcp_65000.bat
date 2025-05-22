@echo off

rem CAUTION:
rem   When the 65000 codepage is used then some of characters DOES BECOME
rem   CONTROL CHARACTERS!
rem   For example, the plus character (`+`) becomes the unicode codepoint
rem   prefix character and expressions which contain this character like
rem   `set BLABLA=1+1` WILL FAIL!

rem repro: Windows XP/7/8.1

setlocal

set TEST=0

echo;1. `plus` sign does WORK HERE:
chcp.com 866
echo;=+002B=
cmd.exe /C @echo;=+002B=
set /A TEST+=1
echo TEST=%TEST%
echo;---

rem workaround for the 65000 active codepage
set "?2B=+"

echo;2. `plus` sign is BROKEN HERE:
chcp.com 65000
echo;=+002B=
cmd.exe /C @echo;=+002B=
set /A TEST+=1
echo TEST=%TEST%
echo;---

echo;3. `plus` sign is WORKAROUNDED HERE:
echo;=%?2B%002B=
rem NOTE: `cmd.exe` has a command line double expansion
cmd.exe /C @echo;=%%?2B%%002B=
set /A TEST=1%?2B%1
echo TEST=%TEST%
echo;---

echo;4. `plus` sign again does WORK HERE!
chcp.com 65001
echo;=+002B=
cmd.exe /C @echo;=+002B=
set /A TEST+=1
echo 4. TEST=%TEST%
