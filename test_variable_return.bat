@echo off

set a=
set aa=
set aaa=

set ?00=!

setlocal ENABLEDELAYEDEXPANSION

set a=	;^|="|";,-%%^& 123 "&" !?00!
set aa= ;^|="|";,-%%^& 123 "&" !?00!
set aaa=;^|="|";,-%%^& 123 "&" !?00!

rem special variable return trick to return variables with special characters
for /F tokens^=^*^ delims^=^ eol^= %%i in ("!a!") do (
  for /F tokens^=^*^ delims^=^ eol^= %%j in ("!aa!") do (
    for /F tokens^=^*^ delims^=^ eol^= %%k in ("!aaa!") do (
      endlocal
      set "aaa=%%k"
    )
    set "aa=%%j"
  )
  set "a=%%i"
)

set a
