@echo off

REM Titre de la fenêtre et affichage
title Doom mod launcher
echo ----------------------------------------------------------------------
echo Zarex's Doom mod launcher
echo ----------------------------------------------------------------------
pause

REM Demander à l'utilisateur d'entrer un IWAD
:iwadchoice
echo Which iwad do you want to use?
	dir /b *doom*.wad
	dir /b plutonia.wad
	dir /b tnt.wad
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