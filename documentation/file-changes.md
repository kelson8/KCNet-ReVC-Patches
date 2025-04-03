This is a list of most new files or files that have been moved out of the game folder.

# Moved into ViceExtended
Here is a list of files that I have moved into 'ViceExtended/data'
* main.scm
* main_d.scm
* freeroam_miami.scm
* object.dat
* particle.cfg
* weapon.dat

Here is a list of files that I have moved into 'ViceExtended/models'
* Most txd files from the models folder.
* Added: 'frontend_ds5.txd'
* Modifed: 'hud.txd' 

The only new files that seems like is in 'ViceExtended/models' are these:
* weaponSights.txd - For extra weapon sights, this doesn't work right with complex and is broken in my version.
* radio.txd - For extra radio icons. For other devs: search '#ifdef EX_RADIO_ICONS' in the code to find usages.

# In game folders
Here is a list of files that are currently in the regular 'data' folder:
* gta_vc.dat - Don't modify the one in 'ViceExtended', I made that mistake earlier

These files have been modified from the originals outside of the 'ViceExtended' folders:
* Mostly all files in the 'txd' folder have been replaced with HD versions for the loading screens. I have a random loding screen system to cycle between them on game start.
* 'TEXT/american.gxt' - I have added the KCNet custom texts in this file

# New files and additions:

'ViceExtended/lua_scripts' folder, these files can be found in the 'utils/lua' directory in this repo.
* kcnet-events.lua - Events defined in this file will constantly run, so don't place anything in here that may crash the game, I don't have any protections in place for that currently. 
* locations.lua - This file isn't in use yet, it could be used for teleport locations using the F9 keybind later on.
* test.lua - Main testing for my lua code, I need to rename this one to kcnet-main.lua. This one runs on game init, wasted, busted, and when F9 is pressed so not all the time like the events. 

Lua info for devs:
* kcnet-events.lua - This is set under the 'void CGame::Process' inside of Game.cpp.
* test.lua - This is running under 'WBSTATE_WASTED' and 'WBSTATE_BUSTED' switch statements in GameLogic.cpp, and in the 'GS_PLAYING_GAME' switch statement within win.cpp.

'ViceExtended' folder {My additions} (TODO Move these into 'ViceExtended/kcnet' folder or something):

My items:
* ImGui-Controls.ini - This will contain a config for xbox controller keybinds once I setup the config for ImGui with it.
* vehicles.ini - List of vehicles from the Cheat Menu of user-grinch on github.
* warps.ini - List of warps from the Cheat Menu of user-grinch on github.

'ViceExtended' folder {From ViceExtended project}:
* features.ini - This can toggle features on/off within the game code.
* gamecontrollerdb.txt - I think this is from the ReVC project originally, just moved into here.
* limits.ini - This can adjust the limits in the game, not too sure if I have this active in the code or not.
