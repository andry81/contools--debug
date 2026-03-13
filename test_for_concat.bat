@echo off

setlocal

rem `break` as `noop`

call;

(
  for %%i in (:) do for %%i in (:) do break ^
  & for %%i in (:) do for %%i in (:) do break ^
  & for %%i in (:) do for %%i in (:) do break
)

echo ERRORLEVEL=%ERRORLEVEL%
