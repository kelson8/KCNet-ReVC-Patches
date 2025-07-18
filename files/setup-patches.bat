:: First clone the re3 miami branch
:: Change url here if the repo is no longer available
 git clone --recursive https://github.com/halpz/re3.git -b miami reVC
 
:: Then clone my patches to the patches folder
 git clone https://github.com/kelson8/KCNet-ReVC-Patches.git reVC/patches
 
:: This will need to be done with MSYS2:
:: ./apply-patches.sh

:: Replace the premake5.exe and premake.lua
:: TODO Set this up

:: Init ImGui as a submodule:
 git submodule add https://github.com/ocornut/imgui.git reVC/lib/imgui
