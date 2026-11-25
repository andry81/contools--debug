@for /L %%# in () do @"%SystemRoot%\System32\more.com" nul >nul 2>nul & rem call an external small executable to trigger OS scheduler and reduce a processor time consumption
