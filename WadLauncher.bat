@echo off

REM Titre de la fenêtre et affichage
title Doom mod launcher
echo ----------------------------------------------------------------------
echo Zarex's Doom mod launcher
echo ----------------------------------------------------------------------
pause

if defined DoomExec goto iwadchoice

cls

REM Demander à l'utilisateur le chemin pour le dossier dans lequel doom se situe pour créer l'arborescence de dossiers et créer la variable d'environnement afin de se rappeler de la décision
set /p DoomPath=Please locate the path of the doom folder (Ex C:\Doom), so that the program will create the folder tree structure : 
setx DoomExec %DoomPath%
echo The path has been located and the file system will be created...
pause

REM Créer l'arborescence de dossiers
cd %DoomPath%
mkdir Wad
mkdir Wad\Common
mkdir Wad\Documentation

REM Demander à l'utilisateur quels IWADS sont disponibles sur le système pour créer les dossiers nécessaires pour les IWADS
echo Which IWADS are available on your system?
set /p AvailableIWADS=Enter it here : 
for %%i in (%AvailableIWADS%) do mkdir Wad\%%i

REM Demander à l'utilisateur d'entrer un IWAD
:iwadchoice
echo Which iwad do you want to use?
	dir /b doom*
	echo common
set /p iwad=Enter your choice here : 
	if exist wad\%iwad% (cd wad\%iwad%) else goto iwadchoice
	
REM Affichage des mods disponibles (liste les fichiers .pk3 et .wad)
:wadchoice
cls
echo ----------------------------------------------------------------------
echo Here are the wads available : 
	dir /b *.wad *.pk3

REM Demander à l'utilisateur d'entrer le programme qu'il veut installer
echo ----------------------------------------------------------------------
	set /p input=Enter your choice here (Enter file name with extension) : 

REM Si le dossier entré par l'utilisateur est valide, exécuter l'installeur
if exist %input%.wad set file=%input%.wad
if exist %input%.pk3 set file=%input%.pk3
	if not defined file (goto wadchoice) else (start ../../gzdoom.exe -iwad %iwad% -file %input%)
	exit /b