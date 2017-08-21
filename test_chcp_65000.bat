@echo off

rem CAUTION:
rem   When the 65000 codepage is used then some of characters DOES BECOME
rem   CONTROL CHARACTERS!
rem   For example, the plus character (`+`) becomes the unicode codepoint
rem   prefix character and expressions which contain this character like
rem   `set BLABLA=1+1` WILL FAIL!

setlocal

set TEST=0

chcp.com 866
echo.=+002B=

rem workaround for the 65000 active codepage
set "?5=+"

rem + sign does WORK HERE!
set /A TEST+=1
echo TEST=%TEST%

chcp.com 65000
echo.=+002B=

rem + sign is BROKEN HERE!
set /A TEST+=1
echo TEST=%TEST%

rem + sign is WORKAROUNDED HERE!
set /A TEST=1%?5%1
echo TEST=%TEST%

chcp.com 65001
echo.=+002B=

rem + sign does WORK HERE!
set /A TEST+=1
echo TEST=%TEST%
