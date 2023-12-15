@echo off

title Doom mod launcher
echo ----------------------------------------------------------------------
echo Zarex's Doom mod launcher
echo ----------------------------------------------------------------------
pause
cls

REM Demander à l'utilisateur le chemin pour le dossier dans lequel doom se situe pour créer l'arborescence de dossiers et créer la variable d'environnement afin de se rappeler de la décision
set /p DoomPath=Please locate the path of the doom folder (Ex C:\Doom), so that the program will create the folder tree structure : 
echo The path has been located and the file system will be created...
pause

mkdir %DoomPath%\Wad
mkdir %DoomPath%\Wad\Common
mkdir %DoomPath%\Wad\Documentation

REM Demander à l'utilisateur quels IWADS sont disponibles sur le système pour créer les dossiers nécessaires pour les IWADS
echo Which IWADS are available on your system?
set /p AvailableIWADS=Enter them here : 
for %%i in (%AvailableIWADS%) do if exists %%i.wad (mkdir %DoomPath%\Wad\%%i) else (echo Non-existent WAD. The folder for it will not be created) 

move %Userprofile%\Downloads\WadLauncher.bat %DoomPath%\WadLauncher.bat

set /p Confirm=Do you want to create a shortcut on your desktop? (Y/N) : 
if %Confirm%==Y (mklink %Userprofile%\Desktop\WadLauncher %DoomPath%\WadLauncher.bat)
if %Confirm%==Y (echo The shortcut has been created on the desktop)
if %Confirm%==N (echo The shortcut hasn't been created on the desktop)
pause

set /p Confirm=Do you want to start the newly installed program? (Y/N) : 
if %Confirm%==Y ( call %DoomPath%\WadLauncher.bat )
