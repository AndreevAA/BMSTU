@echo off
REM change CHCP to UTF-8
CHCP 866
cls
for %%i in (1 2 3 4 5 6 7 8 9) do call test.bat %%i
