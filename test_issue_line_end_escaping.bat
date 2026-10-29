@echo off

rem issue
cmd.exe /c echo ^
"123" ^
echo 456

rem workaround
cmd.exe /c echo ^
 "123" ^
echo 456

rem issue
call; & ^
"%COMSPEC%" /c echo 123 ^
echo 456

rem workaround 1
call; & ^
call; & "%COMSPEC%" /c echo 123 ^
echo 456

rem workaround 2
call; ^
 & "%COMSPEC%" /c echo 123 ^
echo 456
