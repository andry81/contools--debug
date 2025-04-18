@echo off

setlocal DISABLEDELAYEDEXPANSION

chcp 437

rem CAUTION: being loaded text line must not contain NUL or CR character
set /P CHARS_NOCR_=<"ascii-nocr.txt"

set CHARS_NOCR_

echo.---

rem NOTE: will print `CHARS_NOCR_=` twice because of LF character
setlocal ENABLEDELAYEDEXPANSION & for /F "tokens=* delims="eol^= %%i in ("!CHARS_NOCR_!") do endlocal & echo.CHARS_NOCR_=%%i

echo.---

rem CAUTION: being loaded text line must not contain NUL, CR or LF character
for /F "usebackq tokens=* delims="eol^= %%i in ("ascii-nocrlf.txt") do set "CHARS_NOCRLF=%%i"

set CHARS_NOCRLF

echo.---

setlocal ENABLEDELAYEDEXPANSION & for /F "tokens=* delims="eol^= %%i in ("!CHARS_NOCRLF!") do endlocal & echo.CHARS_NOCRLF=%%i
