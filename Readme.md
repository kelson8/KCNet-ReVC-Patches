# KCNet-ReVC-Patches
This is the patch files for my custom modified build of ReVC, these can be applied to a normal copy of ReVC.
Find the git repo to it or the code somewhere, and apply these to it.

# Config
* Most of my custom options in the code can be toggled in the config.h.



# Files added

I have added these files: 
* src/extras/test/cheats/custom_cheats.cpp & custom_cheats.h - Custom cheats for the debug menu
* src/extras/test/ped_test.cpp & ped_test.h - Ped spawn testing, so far this just spawns a ped that drives away from the player.

* src/extras/debug/debug_functions.cpp - Debug menu functions moved out of re3.cpp
* src/extras/functions/ini_functions.cpp - Ini functions moved out of re3.cpp
* src/extras/imgui_test.cpp & imgui_test.h - This is a very early work in progress for ImGui, it will show up but there is no mouse, and if closed it crashes the game so I have it disabled for now.
* src/extras/modloader_reVC.h, modloader.cpp, modloader.h - Partial modloader support, this is very incomplete and crashes the game.

# Fast loader
* The fast loader can be modified in the ReVC.ini, or when a game is launched while on the pause menu. It won't work in the main menu.

# Changes
* Document quite a bit of functions.
* Document premake guides for Linux, Mac, and FreeBSD, I copied the guide from the original wiki on the Internet Archive.


### Files moved
* The debug menu has been moved out of re3.cpp and into src/extras/debug/debug_functions.cpp.
* The ini functions has been moved out of re3.cpp and into src/extras/functions/ini_functions.cpp.


### ImGui

* There is a very early work in progress of ImGui in this also, it doesn't really work well so it is disabled.

### Modifications

* A Fast loader has been added, it can only be toggled in the game, the toggle is disabled in the menu due to it instantly launching the game. It can be toggled on/off in the ini and the menu in game.

* Added interior selector to debug menu.

* I have modified the debug menu, it now has a "Test", and "Vehicle" tab at the bottom or close to the bottom.
* I have added in quite a few changes from the Vice Extended project

* Added gps line on map for the marker destination.
* Add toggle for allowing all vehicles to be resprayed at a pay n spray, so police vehicles and anything that normally wouldn't be allowed there.
* Add suicide option to debug menu.
* Modified the built in debug menu vehicle spawner for use in my vehicle spawner.
* Changed the wanted up cheat to give 1 extra star instead of 2.

* Add custom options for changing the police weapons in the debug menu, so far it just has a toggle option.

* Change most files to load in from the "ViceExtended" instead of "data" and "models".


List of files that now get loaded in from the "ViceExtended" folder:
TODO Complete this list
* 

# Info
This is the KCNet ReVC project, it will need applied to a copy of the ReVC code.


I have documentated quite a bit in this repo, a lot of functions have documentation now.

# Credits
Credit goes to x87 on github for some code from the Vice Extended project
* https://github.com/x87/gta-extended