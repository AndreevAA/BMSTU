@echo off
REM change CHCP to UTF-8
CHCP 866
cls
for %%i in (1 2 3 4) do call test.bat %%i
