# Doom WAD loader-Windows
A doom wad loader for Windows written in Batch code

How it works :

There are 2 files : One is the installer (WadLauncher-Setup.bat) and the program (WadLauncher.bat)

## WadLauncher-Setup.bat
The installer will prompt you to locate the Doom Folder. For that, you have to know where your Doom files are located.

For example the path has to look like this : _C:\Doom_

To be clear, this is an example and your path might not be the same.

Then, it will create the necessary folders in which they will be organized : _Wad_, _Wad\Common_, _Wad\Documentation_

  * Wad : Folder where you have to copy your Wad files for them to be detected for each IWAD (IWAD folders will be created afterwards)
  * Wad\Common : Wad or .pk3 files for multiple IWADS
  * Documentation for all the mods has to be stored here

After that, you will be prompted to enter the available IWADS on your device (Doom, Doom2, Plutonia, and so on and so forth.) The folders will be created in the _Wad_ directory.
So for example, if you enter doom and doom2 in the prompt, then it will create the following folders : 
 * Wad\Doom
 * Wad\Doom2

After all the configuration is over, then the launcher will be moved to the Doom path and you will be asked if you want to start the launcher or not. 

If you enter Y, the launcher will be opened

If you enter N, the installer will quit

## WadLauncher.bat
First, the launcher will list the available IWADS and prompt you to select an IWAD, with common included. If you select common, the launcher will prompt you to select an IWAD. If not, then it will launch automatically with the IWAD selected.

After selecting the IWADS, the launcher will list the available mods for this IWAD and prompt you to select a mod in the list.

Then, it will launch the launcher and you're done!
