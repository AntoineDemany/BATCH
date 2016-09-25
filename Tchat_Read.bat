@echo off

::the part who is reading the tchat

IF EXIST log.db GOTO :suite
echo Le fichier log.db est inexistant
echo Démarre Tchat_Write d'abord
pause > nul
exit

:suite
IF EXIST color.db GOTO :changeColor
:next
cls
echo.
echo Bienvenue dans ce tchat en batch
echo Programme : Read
echo.
echo -------------
echo.
IF EXIST log.db TYPE log.db
timeout /t 2 > nul
goto :suite

:changeColor
set /p import= <color.db
IF %import% EQU 123 color 7
IF %import% EQU 456 color C
IF %import% EQU 789 color A
GOTO :next