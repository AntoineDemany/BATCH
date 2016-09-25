@echo off

::the part who is writing the tchat

IF EXIST log.db GOTO :suite
echo Fichier log inexistant
echo Génération fichier log >> log.db
echo Fichier log existant

:suite
echo.
echo Bienvenue dans ce tchat en batch
echo Programme : Write
echo.
echo -------------
echo.
:pseudo
echo Veuillez choisir un pseudo :
set /p pseudo=">> "
IF %pseudo% EQU warbog GOTO :verif
IF %pseudo% EQU /color GOTO :color
:ok
echo.
:message
echo Ecrire dans le tchat :
set /p message=">>> "

:ecrire
if %pseudo% EQU warbog GOTO :admin
if exist log.db echo $ %pseudo% : %message% >> log.db
goto :message
:admin
if exist log.db echo # %pseudo% : %message% >> log.db
goto :message

:verif
set /p pass="pass >> "
IF %pass% EQU "ananas" GOTO :ok
GOTO :pseudo

:color
set /p passcolor="pass >> "
IF %passcolor% EQU "couleur" GOTO :alz
GOTO :pseudo
:alz
IF EXIST color.db DEL color.db
echo Quelle couleur ? ( blanc - rouge - vert )
set /p couleur=">> "
IF %couleur% EQU blanc GOTO :blanc
IF %couleur% EQU rouge GOTO :rouge
IF %couleur% EQU vert GOTO :vert
GOTO :alz
:blanc
echo 123 >> color.db
goto :pseudo
:rouge
echo 456 >> color.db
goto :pseudo
:vert
echo 789 >> color.db
goto :pseudo
