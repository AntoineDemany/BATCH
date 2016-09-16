::Par Antoine Demany
::Copyright etc
@echo off
:init
cls
echo.
echo  Bienvenue dans le programme de protection
echo.
echo  Voulez vous : ( entrez le chiffre )
echo  1.Creer un dossier a proteger
echo  2.Verouiller un dossier en attente
echo  3.Deverouiller un dossier
echo.
set /p choix=">>> "
IF %choix% EQU 1 GOTO :CreateFolder
IF %choix% EQU 2 GOTO :Lock
IF %choix% EQU 3 GOTO :Unlock
GOTO :init

:CreateFolder
cls
echo.
echo  Quel nom de fichier ?
echo  ( sans accent sans caracteres chelou sans espace )
echo.
set /p name=">>> "
IF EXIST %name% GOTO :existing
mkdir %name%
:again
cls
echo  Dossier cree
echo  Vous pouvez mettre ce que vous voulez dedans
echo  Proteger maintenant ?
echo.
set /p pro="(o/n)>> "
IF %pro% EQU o GOTO :Lock
IF %pro% EQU n GOTO EXIT
GOTO again

:Lock
cls
echo.
echo  Voulez vous une liste de ce que contient
echo  le repertoire courant ?
echo.
set /p cho="(o/n)>> "
cls
IF %cho% EQU o GOTO :Lock1
IF %cho% EQU n GOTO :Lock2
GOTO :Lock
:Lock1
forfiles /m * /c "cmd /c echo @file"
:Lock2
echo.
echo  Veuillez entrer le nom du dossier
echo.
set /p nam=">>> "
IF EXIST %nam% GOTO :okok
echo  Dossier inexistant
pause
GOTO :Lock
:okok
cls
echo.
echo  Entrez un mot de passe :
echo  ( sans accent ni caracteres chelou sans espace )
echo.
set /p MDP=">>> "
echo  Retapez le mot de passe :
set /p MDP2=">>> "
IF NOT %MDP% EQU %MDP2% GOTO :okok
attrib +h +s %nam%
cd %nam%
echo %MDP% >> NePasSupprimer.db
cls
echo.
echo  Dossier verouille !
echo.
echo  Appuyez sur une touche
pause > nul
exit

:Unlock
cls
echo.
echo  Voulez vous une liste de ce que contient
echo  le repertoire courant ?
echo.
set /p cho="(o/n)>> "
cls
IF %cho% EQU o GOTO :Unlock1
IF %cho% EQU n GOTO :Unlock2
GOTO :Unlock
:Unlock1
forfiles /m * /c "cmd /c echo @file"
:Unlock2
echo.
echo  Veuillez entrer le nom du dossier
echo.
set /p nam=">>> "
IF EXIST %nam% GOTO :cparti
echo  Dossier inexistant
pause
GOTO :Unlock
:cparti
IF EXIST %nam%\NePasSupprimer.db GOTO :Suite
echo  Dossier corrompu, dossier perdu a tout jamais
pause
exit
:Suite
SET /p imported=< %nam%\NePasSupprimer.db
:lolmdrallez
cls
echo.
echo  Entrez le mot de passe :
echo.
set /p motdepasse=">>> "
IF NOT %motdepasse% EQU %imported% GOTO :lolmdrallez
attrib -h -s %nam%
cd %nam%
IF EXIST NePasSupprimer.db DEL NePasSupprimer.db
cls
echo.
echo  Dossier bien deverouille
echo.
pause
exit
