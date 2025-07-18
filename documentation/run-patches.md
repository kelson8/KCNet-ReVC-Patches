# Guide to run my custom ReVC patches

TODO Fix this to build, the ini_functions.h doesn't get patched properly.

You need to own GTA Vice City on Steam! This won't work without a copy of GTA Vice City.

You will need MSYS2 or some Linux enviornment to apply the patches.

### First, setup the repo


* If the link for Re3/ReVC is dead, you may need to find another git repo for this
1. Clone a repo that re3 is hosted on, for this example I'll use this one:

 git clone --recursive https://github.com/halpz/re3.git -b miami
 
2. Clone my patches to the patches folder:
 git clone https://github.com/kelson8/KCNet-ReVC-Patches.git patches
3. Run the apply patches script (Use MSYS2 for this):
 ./apply-patches.sh
4. Replace the premake5.exe and premake5.lua with the one from the files folder in patches
5. Using my included premake5.exe, I will provide a virus total scan of this and my final ReVC exe
 run this (Run with Windows Terminal or cmd): premake-vs2022.cmd
6. Run this to setup ImGui as a submodule:
 git submodule add https://github.com/ocornut/imgui.git lib/imgui

If you don't want to use my premake5.exe, you can download it directly from the link here for the latest version:
 https://premake.github.io/download/
 
Just select the windows version, extract it and place the premake5.exe into the root of the cloned source folder.

Here is a link to the official github for the version this project is using (premake-5.0.0-beta4-windows.zip):
 https://github.com/premake/premake-core/releases/tag/v5.0.0-beta4
 

### After building:
You will need some of the modified game files.
* I currently do not have this download setup, I would need to fix it later.

1. Download my ViceExtended folder from here (Contains new required game files for my project to run):
  https://kelsoncraft.net/downloads/ViceExtended-1.2a-PreRelease.zip
  
2. Extract the folder, move the 'ViceExtended' folder to your GTA Vice City folder.

3. Copy the exe, pdb, and OpenAL32.dll from bin/win-amd64-librw_d3d9-oal/Debug/
 to your Vice City folder.