@echo off

REM Titre de la fenêtre et affichage
title Doom mod launcher
echo ----------------------------------------------------------------------
echo Zarex's Doom mod launcher
echo ----------------------------------------------------------------------


REM Demander à l'utilisateur d'entrer un IWAD
:iwaderror
echo Which iwad do you want to use?
	dir /b doom*
set /p iwad=Enter your choice here : 
	if exist wad\%iwad% (cd wad\%iwad%) else goto iwaderror
	
REM Affichage des mods disponibles (liste les fichiers .pk3 et .wad)
:waderror
cls
echo ----------------------------------------------------------------------
echo Here are the wads available : 
	dir /b *.wad *.pk3 common

REM Demander à l'utilisateur d'entrer le programme qu'il veut installer
echo ----------------------------------------------------------------------
	set /p input=Enter your choice here (Enter file name with extension) : 

REM Si le dossier entré par l'utilisateur est valide, exécuter l'installeur
	if exist %input% (start ../../gzdoom.exe -iwad %iwad% -file %input%) else (goto waderror)
	exit