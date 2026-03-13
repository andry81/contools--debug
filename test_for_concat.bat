@echo off

setlocal

rem `break` as `noop`

call;

break

echo 1.ERRORLEVEL=%ERRORLEVEL%

(call)

break

echo 2.ERRORLEVEL=%ERRORLEVEL%

call;

(
  for %%i in (:) do for %%i in (:) do break ^
  & for %%i in (:) do for %%i in (:) do break ^
  & for %%i in (:) do for %%i in (:) do break
)

echo 3.ERRORLEVEL=%ERRORLEVEL%
