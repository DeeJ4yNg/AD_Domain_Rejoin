@ECHO OFF
REM *******************************************************************
REM * FILE NAME: setup.BAT
REM * LOCATION : C:\per
REM * DATE     : 21 Apr 2015
REM * DEVELOPER: Jeff Lau
REM * PURPOSE  : RUN setup.PS1
REM *******************************************************************
CLS
ECHO Please Wait - Running Script......
ECHO.

C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe -noprofile -ExecutionPolicy Bypass "&{.\Unjoin.ps1 /q %* ;exit $LastExitCode}" set code=%errorlevel%

IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

@echo Done running Script......
