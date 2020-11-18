@ECHO OFF
IF "%1"=="" ECHO NOT ENOUGH PARAMETERS... & GOTO :END
set /p pw=<./neg_%~1_args.txt
..\app.exe %pw% <.\neg_%~1_in.txt >out.txt
set /A errorlvl=%ERRORLEVEL% 
IF %errorlvl% EQU 0 ECHO NEG TEST %~1 ::FAILED:: RETURN CODE IS ZERO & GOTO :END

FC .\neg_%~1_out.txt out.txt >NUL
IF %ERRORLEVEL% NEQ 0 GOTO :DIFFRENT
ECHO NEG TEST %~1 ::PASSED:: (rc=%errorlvl%) & GOTO :END


:DIFFRENT
ECHO NEG TEST %~1 ::FAILED::
FC /N .\neg_%~1_out.txt out.txt

:END

