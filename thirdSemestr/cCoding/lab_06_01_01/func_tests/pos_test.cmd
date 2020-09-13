@ECHO OFF
IF "%1"=="" ECHO NOT ENOUGH PARAMETERS... & GOTO :END
set /p pw=<./pos_%~1_args.txt
..\app.exe %pw%  <.\pos_%~1_in.txt >out.txt
set /A errorlvl=%ERRORLEVEL% 
IF %errorlvl% NEQ 0 ECHO POS TEST %~1 ::FAILED:: RETURN CODE IS NOT ZERO (%errorlvl%) & GOTO :END

FC .\pos_%~1_out.txt out.txt >NUL
IF %ERRORLEVEL% NEQ 0 GOTO :DIFFRENT
ECHO POS TEST %~1 ::PASSED:: & GOTO :END


:DIFFRENT
ECHO POS TEST %~1 ::FAILED::
FC /N .\pos_%~1_out.txt out.txt

:END

