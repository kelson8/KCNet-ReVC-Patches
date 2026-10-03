# KCNet ReVC changelog

I have just recently started this, so I'll only have new changes for the ReVC code in here.

Taken this changelog from my internal Git repo.
There is a lot in here from when I started working on this Lua script stuff.

<details>
<summary>
1.2.3a
</summary>

### 1.2.3a
Created on 9-4-2026

New commit:
feat: Add test for disabling game scripts

* This is a very early alpha work in progress and is disabled, this can be toggled with the DISABLE_GAME_SCRIPTS preprocessor.

* Once I get this working, it'll allow me to create a freeroam script for ReVC in lua instead of using the scm langauge, and I'll be able to reload it in game with a keybind instead of rebuilding scm scripts.

DISABLE_GAME_SCRIPTS preprocessor info
* Disable game loading/saving if this is enabled.
* Disable the fast loader, shut down the scm script system.

* Disable CScriptPaths::Init
* Disable CTheScripts::StartTestScript and CTheScripts::Process
* Disable CTheScripts::LoadAllScripts and CTheScripts::Init
* Disable CRunningScript::ProcessOneCommand

Extra changes
* Disable an assert under LoadAllScripts, seems to crash.
* Add COMMAND_INVALID into ScriptCommands.h.

* Add Changelog.md.

* Bump project version from 1.2.2a to 1.2.3a.
* Add freeroam-game.lua script under `gamefiles/ViceExtended/lua_scripts`, I will use this once I figure out how to redirect the game scripts to lua.


* Update c_cpp_properties, fix some errors in VSCode.
* Add TODO.md for a list of things to do for this project.
* Add DISABLE_GAME_SCRIPTS to config.h and document the option a bit more.

* Move FastLoader and GameSaveOnStartup ini values out of General and into KCNet options.
* Update reVC.ini with new changes, disable fast loader by default since it might crash on invalid saves.

</details>





<details>
<summary>
1.2.4a
</summary>

### 1.2.4a
feat: Rename test.lua to kcnet-init.lua

* This is a needed change for my lua scripts, so I know what this is doing without looking in the code.

Added:
* Add VehicleFunctions::IsModelValid for checking if a vehicle model is valid.

</details>

<details>
<summary>
1.2.5a
</summary>


### 1.2.5a

feat: Add test for spawning player in lua scripts

* Fix lua script system to somewhat work.
* Now the game can startup without the scm scripts, I tested it by moving all of them into another folder.

* Move lua init into Game.cpp.
* Make CTheScripts::Init() spawn the player.

* Add CreatePlayer function into MiscFunctions.
* Update changelog.md, bump version to 1.2.5a.

</details>

<details>
<summary>
1.2.6a
</summary>

### 1.2.6a

**Commit 1**

feat: Make create_player work in free roam script

* Make project use freeroam-game.lua for init in new freeroam mode.

* Add SetupFreeroamScript function to load the freeroam script on init.

* Setup basic player spawning in freeroam-game.lua.

* Fix createPlayerLua function in lua_player.cpp.

* Make lua init work again if DISABLE_GAME_SCRIPTS isn't enabled.

* Add freeroam script to defines.cpp
* Update changelog.md, Bump version to 1.2.6a.

**Commit 2**
feat: Disable some menus with DISABLE_GAME_SCRIPTS

* Disable load, delete, and save menus with my lua script system, currently the button is still there but if I try to remove that it breaks all of the menus.

* Update changelog.md

**Commit 3**
feat: Move vehicle spawn logic

* I moved the vehicle spawning logic into the new VehicleFunctions::CreateVehicle function, which now takes a X, Y, and Z for a position.

* Make VehicleFunctions::SpawnVehicle call the new function, mostly so I don't have to update things using this.
* Switch lua_vehicle.cpp to using new vehicle spawn function.

* Re-enable fast loader with game scripts disabled.

* Fix createVehicleLua function to work, now I can spawn vehicles in lua.
* Update lua scripts.

* Update changelog.md.

</details>


<details>
<summary>
1.2.7a
</summary>

### 1.2.7a

**Commit 1**

feat: Add OnTick function into lua

* Now my game scripts can have a tick system, although if you change anything in it, you have to start a new game.

* Add things todo for things to replicate into my lua freeroam scripts.

* Update lua_setup, now F5 will start a new game if DISABLE_GAME_SCRIPTS is enabled, my OnTick function in lua requires a reload to be changed so this is a workaround.

* Make fast loader able to be toggled with DISABLE_GAME_SCRIPTS enabled by holding control.

* Update changelog.md, Bump version to 1.2.7a.

**Commit 2**
feat: Add some missing functions for lua

* Add disable_never_wanted to lua,  I was missing this for turning off never wanted in my lua scripts.

* Add disable_infinite_health to lua.
* Update freeroam-game.lua.

* Fix player spawned log line in createPlayerLua.

* Update lua-documentation.md.

* Update changelog.md.

</details>

<details>
<summary>
1.2.8a
</summary>


### 1.2.8a

**Commit 1**

fix: Make CreatePlayer function only create one player

* Add more todo for scripts to replicate.

* Add init_game.cpp and init_game.h
* Move Create Player function into init_game.cpp, remove it out of misc_functions.cpp.

* Add src/extras/custom_scripts into premake5.lua.

* Update c_cpp_properties.json for VSCode includes.
* Add new comment to pch.h file.

* Update changelog.md, bump version to 1.2.8a.

**Commit 2**
fix: Actually make the function only create one player.

* Make CreatePlayer function set `m_bPlayerCreated` to true, so it doesn't spawn in more then one player.

* Set CreatePlayer function to bool, makes it to where the log message in lua only prints once when the player is created, instead of spamming it if there are multiple lines.

* Update player spawn in freeroam-game.lua to the police station.

* Update changelog.

</details>

<details>
<summary>
1.2.9a
</summary>

### 1.2.9a

**Commit 1**

feat: Make scroll speed in stat page able to be changed

* Now the stats page scroll speed can be changed

* Move vehiclesDontCatchFire variable into main.h and main.cpp, and move it out of features.ini into the reVC.ini.

* Add option to toggle vehicles exploding when upside down in freeroam-game.lua.

* Rename bVehiclesDontCatchFireWhenTurningOver to gbVehiclesDontCatchFireWhenTurningOver.

* Enable the 'DISABLE_GAME_SCRIPTS' preprocessor in config.h to run my lua scripts from now on.

* Add STAT_SCROLL_SPEED into config.h.

* Remove ReadAndGetFeature from ini_functions, remove features.ini from build since I no longer use it.

* Add time_to_pass variable into freeroam-game.lua for later use, will be used for setting how much time passes when the player dies or is busted. 

* Add freeroam-locations.lua, make freeroam-game.lua load locations from the new file.

* Re-enable most options running in `CTheScripts::Init()`, they work with my lua scripts besides the scm loading.

* Update changelog, bump version to 1.2.9a.

**Commit 2**

fix: Make game not crash when new game is started

* I had to set the player created variable to false before starting a new game with F5 or the pause menu, so my CreatePlayer script will run.

* Add freeroam-enums.lua for later use.

* Update changelog.

### 1.2.9-1a

**Commit 1**

feat: Add toggle for reloading lua scripts

* I added the gbReloadLuaScriptWithKeybind global into freeroam-game.lua, which can enable the F5 keybind, or disable it.

* Make SetupFreeroamScript load the gbReloadLuaScriptWithKeybind variable from lua.

* Rename game title to KCNet ReVC in skeleton.cpp.

* Fix a crash when starting new game with the pause menu, I had to change something in Frontend.cpp.

* Switch version syntax, add a `1.2.9-1a` to it instead of incrementing the version.

* Update changelog, bump version to 1.2.9-1a.


### 1.2.9-2a

feat: Update some lua scripts

Lua changes:---

* Make playerX, playerY, and playerZ into globals for use with F9 in `kcnet-keybind-events.lua.

* Make lua_test.cpp crash the game if 'create_player' isn't called when setting up the freeroam scripts, this is always required in them.

* Update lua scripts to use CVector values instead of floats, move all new custom positions into lua table.

* Make SetPlayerPositionLua use a CVector instead of floats.

* Update freeroam-game.lua, freeroam-locations.lua,  kcnet-keybind-events.lua, and vehicles.lua scripts.

Misc changes:---

* Make game assert if the player isn't created with `create_player` in the lua scripts.

* Update changelog.md, bump version to 1.2.9-2a.

</details>

<details>
<summary>
1.2.10a
</summary>

# 1.2.10a

### 1.2.10-1a

**Commit 1**

feat: Update CreateVehicle function to take a CVector

* Now my create vehicle function takes a CVector in the C++ code and in the lua code.

* Update the lua scripts with the new create_vehicle function and test functions.

* Add new functions to test later and info to kcnet-keybind-events.lua.

* Update TODO.md for things to do and look into for project.

* Update changelog, bump version to 1.2.10-1a.

**Commit 2**

feat: Update some items in freeroam-game.lua

* When I updated the function to a new namespace I forgot to update this file with the new values.

* Move lua world functions into 'world' namespace.

* Add Readme into `gamefiles` folder.

* Update changelog.

### 1.2.10-2a

feat: Move lua cheats into lua_game.cpp

* Fix lua_world.cpp to work, I forgot to enable the global for the namespace using it.

* Add OnInit into lua functions for running things once the game starts up, so I can run other stuff in the main script also, I have disabled this since it doesn't work right.

* Add NEW_LUA_FORMAT preprocessor, so I can enable the `OnInit` function in my lua script later which will only run once on startup.

* Update config.h.

* Update changelog, bump verison to 1.2.10-2a.

### 1.2.10-3a

feat: Make vehicle_functions remove previous vehicle with lua

* Now when the delete previous vehicle option is enabled, it will actually remove the vehicle.

* Fix warp into vehicle function with lua, now you can warp into the new vehicle that was spawned.

* I still need to set a limit on how many vehicles can be spawned which I'll set to like 5 or something.

* Add m_pLastCreatedVehicle variable into vehicle_functions, for storing the last used vehicle to remove.

* Update changelog, bump version to 1.2.10-3a.

### 1.2.10-4a

feat: Make some log lines disabled without EXTRA_LOGGING

* Remove items in RegisterLuaFunctions function, since I moved these they weren't in use.

* Add test for setting hospital and police respawns in lua scripts, currently crashes and is disabled.

* Make vehicles fall down when spawned in with the mod menu, instead of floating in the air.

* Fix camera mode when removing old vehicle for warping into new ones.

* Update changelog, bump version to 1.2.10-4a

### 1.2.10-5a

feat: Add game.start_fire to lua

* Now you can start fires in the game.

Lua usage:
* game.start_fire({x = 20, y = 20, z = 20})

* Update changelog, bump version to 1.2.10-5a.

### 1.2.10-6a

feat: Add unlock all car doors function to lua

* I added the world.unlock_all_car_doors_in_area() function into lua, this can unlock all car doors in a specified area.

* Update changelog, bump version to 1.2.10-6a.

</details>

<details>
<summary>
1.2.11a
</summary>


# 1.2.11a

### 1.2.11-1a

feat: Add some lua functions

Lua functions added:

* Added game.pass_time, game.set_time, and game.set_time_scale into lua_game.cpp.

Breaking lua changes:

* player.create now takes a vector list of arguments instead of floats now

Old usage:
* player.create(0, 25, 25, 25)

New usage:
* player.create(0, {x = 25, y = 25, z = 25})

Other changes:

* Label some more code and document some files.

* Move lua library loading into another function.

* Update InitGame::CreatePlayer function to now take a CVector instead of floats.

* Make busted and wasted time to pass variable be obtained from my busted and wasted event scripts in lua.

* Update changelog, bump version to 1.2.11-1a.

### 1.2.11-2a

feat: Add custom text to main.cpp for KCNet freeroam

* Now when DISABLE_GAME_SCRIPTS is toggled, my ReVC build will display 'KCNet - Freeroam' at the top left.

* Add lua_font.cpp/.h for later font testing, this isn't currently in use but I will draw to the screen with my OnTick functions later once I get this working.

* Make game position display with my custom text enabled.

* Add global in `freeroam-game.lua` to enable or disable the position display, named `gbDisplayPosn` just like in the C++ code.

* Add vehicle frozen toggle to lua scripts.

* Add test function to run on all peds in lua scripts, world.set_ped_objectives(), this is now setup to make all peds get weapons and shoot the player.

* Update changelog.md, bump version to 1.2.11-2a.

### 1.2.11-3a

**Commit 1**

feat: Add turn phone off and turn phone on to lua

* I added some phone functions mostly so I can turn off the ringing phones around the map.

* Update changelog, bump version to 1.2.11-3a.

**Commit 2**

feat: Add test for wait in lua_game

* I added a test for a COMMAND_WAIT implementation, I'm not sure if this will work just yet though. 

* Update changelog.

### 1.2.11-4a

**Commit 1**

feat: Add test for wait in lua_game

* I added a test for a COMMAND_WAIT implementation, I'm not sure if this will work just yet though. 

* Added game.add_blip_for_coord into lua for basic blip creation.

* Add lua_garages for garage functions, and add set garage function.

* Add checkFloatLua and checkIntLua functions for later use.

* Update changelog, bump version to 1.2.11-4a

**Commit 2**

feat: Add missing lua functions changes

* Update changelog.

</details>

<details>
<summary>
1.2.12a
</summary>

### 1.2.12-1a

feat: Setup basic save/load system with json

* Added json.hpp and lib folder for it

* I added the nlohmann json library and added the 'lib' directory to the include directories in the premake.

* Add test for making a json save/load system, I added this into the misc menu under debug functions for now in my mod menu.

* Now basic stats can be saved/loaded from the json with the mod menu, I may add this to my lua scripts later.

* Make sure some scripts code is disabled by adding an `#else` statement to check when the `DISABLE_GAME_SCRIPTS` preprocessor is active.

* Add freeroam_util.cpp/.h, currently this has my new saving/loading system in it.

* Update changelog, bump version to 1.2.12-1a.

### 1.2.12-2a

feat: Fix ped spawner to work

* I had something messed up forever on my ped spawner and now it works, I had to disable some variable and move some things around with it.

* Make CreatePed function store the ped, and add RemovePed function for removing them from the world.

* I need to fix removing the ped, currently it doesn't work.

* Add some more ped functions.

* Update changelog, bump version to 1.2.12-2a

### 1.2.12-3a

feat: Add singleton to ped functions

* Move more ped functions out of misc_menu.cpp and into ped_menu.cpp.

* Add some ped objective functions into ped_functions, these were originally in misc_util and I forgot about them so I rebuilt the set objective functions.

* Make ped able to be spawned and removed in ped_menu.cpp.

* Add missing changes to GenericGameStorage.cpp, fixes load and save to not run at all if the scripts are disabled.

* Update changelog, bump version to 1.2.12-3a.

### 1.2.12-4a

feat: Move some functions into player_functions.cpp

* I made a new class in player_functions.cpp/.h, which will now contain the player functions.

* Add GetPed into ped_functions, so I can try to set objectives and other stuff on the peds that I spawn in.

* Rename NeverWantedCheat to SetNeverWanted, make this take a toggle value now.

* Make some functions in lua into boolean toggle functions, instead of having separate enable/disable functions for everything.

* Cleanup lua_player file quite a bit with new toggle functions.

* Update changelog, bump version to 1.2.12-4a.

### 1.2.12-5a

feat: Add get player coords and heading functions

* Add IsPlayerSafe function, move it out of misc_util.

* Disable DisplayCounterOnScreen if I have the game scripts disabled, otherwise this causes crashes.

* Enable blow up all vehicles in lua again.

* Disable cheat message for BlowUpAllVehicles cheat.

* Update changelog, change version to 1.2.12-5a.

### 1.2.12-6a

feat: Make ped objective test work in mod menu

* Add world.switch_roads_on and world.switch_roads_off to lua functions.

* Add custom set ped density and set vehicle density functions for my lua scripts.

* Update changelog, change version to 1.2.12-6a.

### 1.2.12-7a

feat: Add player.get_position to lua

* Now I can pass the CVector of the player to lua.

* Update changelog, switch version to 1.2.12-7a.

### 1.2.12-8a

feat: Add fixes from AltronMaxX repo on GitHub

* Fix for car engine sound.
* Added Borderless game window option for video settings.

* Update readme.


* Update changelog, switch version to 1.2.12-8a.

### 1.2.12-9a

feat: Add teleport to marker for lua scripts

* Now you can use 'player.tp_to_marker' to teleport to a marker set on the map.

* Update changelog, switch version to 1.2.12-9a.

### 1.2.12-10a

**Commit 1**

feat: Add more objective testing, update functions

* Add more checks in ped_functions

* I made some of the vehicle objectives check if the player is in a vehicle, no sense in making them leave a vehicle if they aren't in one.

* Make flee and leave car set the ped to leave their vehicle instead of the one set in the function.

* Add some default break statements into the SetObjective functions.

* Add some new objective testing into ped_functions and Ped.h.

* Add new explosion cheat function that can set an explosion at a specific set of coordinates.

* Remove old test preprocessor and unused functions in custom_cheats.h.

* Setup add explosion to custom coordinates in lua with game.add_explosion.

* Disable explosion on player with suicide cheat.

* Update changelog, switch version to 1.2.12-10a.

**Commit 2**

fix: Disable global position variables for player in lua

* Update changelog.

**Commit 3**

feat: Add test for setting blip on peds and vehicles

* I made a test in lua to set the blip on the spawned ped and vehicle that I create in the C++ code.

* Update changelog.

**Commit 4**

feat: Add toggle for emergency vehicle spawns

* I can now toggle the emergency vehicle spawning in the lua scripts with a global that I setup.

* Make project build again without DISABLE_GAME_SCRIPTS, I need to keep this working so the main mission scripts also still work.

* Update changelog

### 1.2.12-11a

feat: Add everyone ignore and police ignore toggles

* I added these into lua to be set now, with player.everyone_ignore, and player.police_ignore.

* Update changelog, change version to 1.2.12-11a.

</details>

<details>
<summary>
1.2.13a
</summary>

### 1.2.13-1a

**Commit 1**

feat: Add infinite ammo global for lua

* I added an infinite ammo global into lua to easily be toggled on or off.

* Add give weapon and remove weapon functions to lua scripts.

* Move freeroam text into defines.cpp/.h, and add version to freeroam text display.

* Update changelog, change version to 1.2.13-1a.

**Commit 2**

refactor: Label some functions

* I labeled most functions in Pickups.cpp as to what I think they are doing.

* Label some functions and variables in Pathfind.cpp and World.cpp.

* Update changelog.

### 1.2.13-2a

feat: Add test for giving player the rc car in lua

* I setup a player.give_rc_car function in lua to test out.

* Move is player vehicle check, and toggle player control out of lua_test.cpp.

* Update changelog, change version to 1.2.13-2a.

### 1.2.13-3a

feat: Enable some items in CTheScripts::Process

* I had somethings disabled in here and the game doesn't crash with them enabled so I turned them back on.

* Add test for new lua coroutines with lua_script.cpp/.h, this isn't complete yet.

* Add some commands to implement in the future to lua_vehicle and lua_world.

* Fix setFontStyleLua function, and label some more items in Script.cpp.

* Add global in lua to toggle fading the game when wasted or busted.

* Update changelog, change version to 1.2.13-3a.

### 1.2.13-4a

feat: Add Colors.cpp from plugin-sdk

* Now I can more easily use hud colors for drawing to the screen and other functions.

* Add Screen.cpp and Screen.h for getting positions on the screen from the plugin sdk.

* Modify blow up vehicle function a bit.

* Update changelog, change version to 1.2.13-4a.

### 1.2.13-5a

feat: Add weather functions into lua_game

* Add a CVector2D for use in lua.

* Update changelog, change version to 1.2.13-5a.

### 1.2.13-6a

feat: Add set health, armor and get armor functions

* I needed these in lua to load my test save file, I can now load those values and the weather straight in lua.

* Add toggles for ped and vehicle roads, disabled in lua due to these not working.

* Add disabled toggle for creating some objects, this currently crashes in lua.

* Update changelog, change version to 1.2.13-6a.

### 1.2.13-7a

feat: Add more stats to freeroam_util 

* I added more stats for the json save file in freeroam_util.

* Fix add blip for coord to now take a custom parameter for the blip sprite, and if the blip should have a route.

* Update changelog, change version to 1.2.13-7a.

### 1.2.13-8a

feat: Add untested SetStat function in player_util.cpp

* I should now be able to set all the stats I want to load or save to my custom json save format.

* Added a new eStatType enum in my misc_enums.h for the list of stats.

* Add test for making item pickups such as a save pickup which works using the mod menu.

* Add test for pushing blip id to lua, and for removing a blip in lua.

* Update changelog, change version to 1.2.13-8a.

### 1.2.13-9a

**Commit 1**

feat: Add setting player stats to lua

* Now I can set the players stats in lua, and I will use this for my save system once I get the stats saved and a pickup fixed for it.

* Update changelog, change version to 1.2.13-9a.

**Commit 2**

feat: Add a few more stats into freeroam_util

* Update changelog

**Commit 3**

feat: Move some functions

* I have moved some items out of lua_player and into player_functions.

* Cleanup some code in GameLogic.cpp and remove code that I was no longer using.

* Update changelog.

**Commit 4**

feat: Add option to change load game slots text

* I figured out how to change the text that shows up on the load game slots, and only set one slot to show up.

* Update changelog.

### 1.2.13-10a

**Commit 1**

feat: Make load game option load into json save

* Now load game in the menu loads into the custom json save format.

* I re-enabled some menus in Frontend.cpp that I had previsouly disabled with DISABLE_GAME_SCRIPTS.

* Update changelog, change version to 1.2.13-10a.

**Commit 2**

fix: I had broken the save format in the save function

* Fixed save file format.
* Update changelog.

**Commit 3**

fix: Make game effects work again

* I had acidentally turned off the RenderEffects in main.cpp, oops.

* Add mission passed sound effect to misc menu.

* Update changelog.

**Commit 4**

fix: Make audio work on game start

* I was having problems with my fast loader and the audio not working when loading the game, but I fixed that now.

* Reorganize functions in fast_loader a bit.

* Update changelog.

**Commit 5**

feat: Add frontend-guides for modifying the menus

* I have added a guide that I will be adding to that will show how to add to the Frontend and modify the game menus

* Re-enable some functions in Frontend.cpp.

* Update changelog.

### 1.2.13-11a

**Commit 1**

feat: Make target marker get saved to the save file

* Now the target marker position will get saved to the custom json file.

* Update changelog, change version to 1.2.13-11a.

**Commit 2**

feat: Make target marker display again when loaded

* Fix new game causing no audio until game was paused and unpaused, I had it fixed for when it started but not on new games.

* Update changelog.

### 1.2.13-12a

feat: Fix load game option to work

* For now, I have disabled the confirm option for loading the custom save slot.

* Re-enable switching roads off and on in the lua scripts, I will test this later.

* Move function that sets the player as not created into fast_loader.cpp, this makes it to where I don't have to remember to run the function each time I reload the save.

* Update changelog, change version to 1.2.13-12a.

### 1.2.13-12a

**Commit 1**

feat: Make setPedObjectives take parameters in lua

* Now you can set custom actions for the test objectives.

* Remove ped objective test from ped menu.

* Update changelog, change version to 1.2.13-13a.

**Commit 2**

feat: Add IsWeaponValid to misc_util

* Add Util/Weapon namespace into misc_util.

* Make givePlayerWeaponLua function use my new is weapon valid function.

* Update frontend-guides.md.

* Update changelog.

**Commit 3**

feat: Add arrest player test option to misc menu

* I added a arrest player menu option which can show the busted screen, this needs some work.

* Update changelog.

### 1.2.13-13a

**Commit 1**

feat: Add arrest player test option to misc menu

* I added a arrest player menu option which can show the busted screen, this needs some work.

* Remove extra imgui preprocessors, these were not needed.

* Cleanup imgui_defines.h, switch misc_menu and vehicle_menu to using ImGui functions instead of my macros.

* I accidentally changed the version in defines.cpp with one of the last commits, so it's already changed.

* Update changelog, change version to 1.2.13-13a.

**Commit 2**

feat: Make game not crash if player isn't created

* Now with my lua scripts, if the player isn't created the games code will automatically set the spawn to the middle of the map.

* I plan on adding random locations to spawn at using my json files later.

* Update changelog.


### 1.2.13-14a

feat: Make OnInit function work in lua

* This commit fixes the OnInit function that I have in lua, now I can run things in there only when the game starts up

* Set total number of hidden packages to 0 by default in PlayerInfo.cpp

* Update changelog, change version to 1.2.13-14a.

</details>

<details>
<summary>
1.2.14a
</summary>

### 1.2.14-1a

fix: Revert player fallback spawn

* I had to disable the create player in CTheScript::Init since it spawns multiple players.

* Add fading the camera in and out in lua.

* Update changelog, change version to 1.2.14-1a.

### 1.2.14-2a

**Commit 1**

feat: Move setup target marker into function

* I made a function that can easily setup a blip as a target marker in freeroam_util.

* Remove pos_x and make variables cleaner for storing target marker into save file.

* Add set_marker to lua_world.

* Update changelog, change version to 1.2.14-2a.

**Commit 2**

feat: Add get game hour and minute to lua

* I was missing this and had to add it.

* Fix target marker in lua_world.

* Move save file items into preprocessor defines in freeroam_util.

* Update changelog.

### 1.2.14-3a

**Commit 1**

feat: Add set_money and get_money to lua

* Now you can set the players amount of money in my scripts.

* Disable mission script starting with debug menu using my custom scripts, this will crash.

* Added world.create_car_generator, and world.switch_car_generator to lua.

* Add test for saving the car generators to the json file.

* Add game.override_next_restart, and game.cancel_override_restart to lua.

* Update changelog, change version to 1.2.14-3a.

**Commit 2**

feat: Move freeroam script options in debug menu

* Add new save format into freeroam_util for later use.

* Update changelog

**Commit 3**

feat: Move chas mode timer bar into main.cpp

* Now I can run this all the time with the new gbTimerBarDisplay global.

* Added ChaosBg and ChaosProgressTimer colors into Colors.cpp/.h.

* Cleanup misc_menu a bit.

* Add bgColor and progressColor parameters to TimerBarTest function.

* Add check for if player is in water to kill them with invincibility cheat, otherwise they get stuck in the water.

* Update changelog.

**Commit 4**

refactor: Cleanup imgui_setup a bit

* I moved somethings around in imgui_setup, and made comments into my new style for doxygen.

* Update changelog.

**Commit 5**

feat: Move version stuff into header

* Add 'SAVE_FILE_VERSION' and 'SAVE_FILE_FORMAT' for use in lua.

* Update changelog.

### 1.2.14-4a

**Commit 1**

feat: Add stubs for setting the zone info in lua

* I have mostly replicated the original scripts for this, although it needs tested and still needs some work.

* Cleanup code in lua_test a bit.

* Label some more items in the code.

* Update changelog, change version to 1.2.14-4a.

**Commit 2**

feat: Add infinite sprint toggle to lua

* Update changelog.

**Commit 3**

feat: Update comments in vehicle_functions

* I also cleaned up and removed some old functions in vehicle_functions.

* Update comments in Hud.cpp.
* Disable some logs in lua_test, these were logging too often.

* Add Doxyfile from other git branch for documentation.

* Update changelog.

**Commit 4**

feat: Try to fix auto pause on minimize

When you switch windows the game should automatically pause instead of keep running, well this didn't work.

Taken from a few git commits from this repo

Commit 1:
https://github.com/AltronMaxX/reVC/commit/4413fd505b5ad67a1fa4463e4f645f3e6f9936f6

Commit 2:
https://github.com/AltronMaxX/reVC/commit/81f62c4d31e76ff87d9ddd24e459be4b4100526c

* Update changelog.

**Commit 5**

fix: Add a few changes from some commits

Taken from this commit
* https://github.com/AltronMaxX/reVC/commit/f08da5aa9534c1c0698454074ce4bd2370bab2dd

* Update changelog

### 1.2.14-5a

feat: Make garages work in lua

* I got the garage system to work in lua, now I can return the garage ID in lua.

* I can open/close the garages, and check if they are open/closed now.

* Update changelog, change version to 1.2.14-5a.

### 1.2.14-6a

feat: Fix objects to spawn with lua

* Now I can create objects in my lua code, such as the road blocks that the scripts would normally set up.

* Update Garages code a bit, move pay n spray code into its own function.

* Update changelog, change verison to 1.2.14-6a.

### 1.2.14-7a

feat: Add wait timer for lua

* I finally got this wait timer working! Now I can run things just like the original game scripts!

* Update changelog, change version to 1.2.14-7a.

### 1.2.14-8a

**Commit 1**

feat: Add creating pickups to lua

* I added creating, removing, and checking if pickups have been collected.

* Add missing change into Game.cpp.

* Disable some extra logging.

* Update changelog, change version to 1.2.14-8a.

**Commit 2**

fix: Make toggle player controls work in lua

* Add SetControl function to player_functions.

* Update changelog.

**Commit 3**

feat: Add/fix things in lua

* Make switch_roads_off and switch_ped_roads_off work in lua.

* Added getFadingStatus, drawSphere, and switchRubbish functions into lua_world.

* Add test for drawing sphere to the world in lua, this works but I need to add a toggle in lua.

* Add test function for validating the the road positions for turning them on/off.

* Fix infinite ammo in vehicles.

* Update changelog.

### 1.2.14-9a

feat: Add json logging for coords

* I setup my lua code to be able to log the players position into my lua json format.

* Make my freeroam text only draw when not paused.
* Fix freeroam text to use the Screen.cpp classes from TExtender.

* Add more cheats into cheat_menu.

* Update changelog, change version to 1.2.14-9a.


</details>

<details>
<summary>
1.2.15a - Latest builds
</summary>

### 1.2.15-1a

**Commit 1**

feat: Add audio management for use in my lua scripts.

* Add lua_ped file for later use.

* Make json save format now load and save the audio and music volume, incomplete and disabled.

* Make game auto load into the json save on startup now, instead of requiring it to be manually done.

* Add loading and saving the game from my C++ code into lua.

* Update changelog, change version to 1.2.15-1a.

**Commit 2**

feat: Finally fix mouse crashing and going out of bounds with ImGui mod menu.

* Make freeroam save loading toggleable

* Add some cheats to the cheat menu.

* Add gbLoadFreeroamSave global for use in lua.

* Update changelog.

**Commit 3**

feat: Add model and rampage testing to lua

* New lua commands added:
game.start_rampage - Disabled
game.request_model - Untested
game.has_model_loaded - Untested

* Added rampage testing to ImGui menu.
* A Few more fixes to try to make this build without DISABLE_GAME_SCRIPTS.

* Make freeroam load system restore the max health for the player, instead of the previous saved health.

* Update changelog.

**Commit 4**

feat: Make gravity able to be changed

* Now I can change the gravity in my mod menu and with Lua.

* New lua commands added
game.set_gravity
game.get_gravity

* Update changelog.

**Commit 5**

fix: Make project work again with mission scripts

* I had accidentally left out CTheScripts::Process, I probably wouldn't have found this without Valgrind.

* Fix some compiler warnings in some files.

* Update changelog.

### 1.2.15-2a

feat: Some lua changes, and refactoring

* Fix some code in custom_cheats.cpp.
* Make SetupTextAndFont take a CVector2D for the textposition, and use my color code enums.

* Make addBlipForCoordOldLua function in lua_game.cpp now accept a boolean for setting a short range blip.

* Add saving and loading freeroam json into the debug menu.

* Add the CustomYellow color into Colors.cpp for custom_cheats.cpp.

* Move some code around, move lua thread functions into lua_script.cpp.

* Update changelog, change verison to 1.2.15-2a.

</details>