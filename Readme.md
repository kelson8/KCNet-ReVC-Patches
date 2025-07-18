# KCNet-ReVC-Patches
This is the patch files for my custom modified build of ReVC, these can be applied to a normal copy of ReVC.
Find the git repo to it or the code somewhere, and apply these to it.

# Config
* Most of my custom options in the code can be toggled in the config.h.


# Building
I don't really have an easy way to build this, but the project is using patches with git, which can be applied to a copy of the reVC code found on GitHub.

So you would need to find a copy of reVC with a git repo somewhere, know how to apply patches for Git, and know how to build this using Visual Studio 2022.

Also, you would need to have some extra game files and data files moved into the Game folder under "ViceExtended" which I would need to upload somewhere.

This does somewhat break the sound from my testing also.

I didn't want to risk a DMCA, so I used patches on top of the original code and did not include any game data or assets


Also, I have some guides here in the documentation page on this repo:
 https://github.com/kelson8/KCNet-ReVC-Patches/tree/master/documentation


# Files added

I have added these files: 
* src/extras/test/cheats/custom_cheats.cpp & custom_cheats.h - Custom cheats for the debug menu
* src/extras/test/ped_test.cpp & ped_test.h - Ped spawn testing, so far this just spawns a ped that drives away from the player.

* src/extras/debug/debug_functions.cpp - Debug menu functions moved out of re3.cpp
* src/extras/functions/ini_functions.cpp - Ini functions moved out of re3.cpp
* src/extras/imgui_test.cpp & imgui_test.h - This is a very early work in progress for ImGui, it will show up but there is no mouse, and if closed it crashes the game so I have it disabled for now.
* src/extras/modloader_reVC.h, modloader.cpp, modloader.h - Partial modloader support, this is very incomplete and crashes the game.
* src/extras/PhotoMode.cpp and PhotoMode.h - This is the photo mode from the Vice Extended project, I don't have it working just yet.

---

### Log test:
src/extras/functions/log_functions.cpp, and log_functions.h 
* These files have a log to file function in the debug menu hooked up to them. I figured out how to make this create the 'ViceExtended\\logs' folder if it doesn't exist and do some basic logging. For now all it logs is a test info, warning, and error message.

---

### Custom cheats
src/extras/test/cheats/custom_cheats.cpp, and custom_cheats.h

* Blow up all cars: BlowUpAllCars(void)

---

Toggle police spike strips
* Enable Police Spike Strips: EnablePoliceSpikeStrips(void)
* Disable Police Spike Strips: DisablePoliceSpikeStrips(void)
* Toggle Police Spike Strips: TogglePoliceSpikeStrips(void)

---
Toggle police weapons
* Change police weapons (Can change police weapons to anything once I set it up in the debug menu): EnableChangePoliceWeapons(void)
* DisableChangePoliceWeapons(void)

---
Misc testing
* Vehicle Testing: vehicleTest(void)
* Ped Testing: PedTest1(void)
* Explode Ped: ExplodePed(void)
* Plugin sdk test: CommandTest1(void)
* Give RC Car test: GiveRcCar(void)

---
Vehicle
* Lock Car Doors: LockDoors(void)
* Unlock Car Doors: UnlockDoors(void)
----

* Clear items from area: void ClearItemsFromArea(float radius)
* Test cheat: TestCheat1(void)
* Spawn ped cheat: SpawnPedCheat(void)
* Give player a weapon: GivePlayerWeapon(void)

---
Test for spawning peds and cars
* Spawn ped test: SpawnPedTest(void)
* Spawn Car test: SpawnCarTestCheat(void)
---

* Set Text test: SetText(void)
* Tank rapid fire toggle (Incomplete): TankRapidFireToggle(void)
---
Raise/Lower wanted level
* Raise wanted level: RaiseWantedLevel(void)
* Lower wanted level: LowerWantedLevel(void)
---
Health
* Enable infinite health: EnableInfiniteHealth(void)
* Disable infinite health: DisableInfiniteHealth(void)
* Infinite health cheat: InfiniteHealthCheat(void)
---
Never wanted
* Enable never wanted: EnableNeverWanted(void)
* Disable never wanted: DisableNeverWanted(void)
* Never wanted cheat: NeverWantedCheat(void)
---
Vehicle
* Enable vehicle invincibility: void EnableVehicleInvincibility(CVehicle *veh)
* Disable vehicle invincibility: void DisableVehicleInvincibility(CVehicle *veh)
* Toggle vehicle invincibility: void ToggleVehicleInvincible(CVehicle *veh)
* Invincible vehicle cheat: InvincibleVehicleCheat(void)
* No upside down blow up cheat: void NoUpsideDownBlowUpCheat(bool toggle)
---
Player
* Explosion cheat (Add a bomb near the player): ExplosionCheat(void)
* Player Testing: PlayerTest2(void)
* Spawn weapon pickup (This does nothing): SpawnWeaponPickup(void)

---

### Vehicle Functions
src/extras/functions/vehicle_functions.cpp, and vehicle_functions.h

* Repair vehicle
* Toggle vehicle invincibility
* Unlock all car doors in area (Incomplete)
* Toggle Upside Down Explosions (Incomplete)
* Spawn vehicle function, customized from original debug menu: SpawnVehicle(int id, bool deleteCurrentVehicle, bool warpIntoVehicle)
* Requesting the vehicle model: RequestVehicleModel(int vehicleModel)
* Removing the vehicle from the world: RemoveCurrentVehicleFromWorld(void)

---

# Fast loader
* The fast loader can be modified in the ReVC.ini, or when a game is launched while on the pause menu. It won't work in the main menu.

---

# Changes
* Document quite a bit of functions.
* Document premake guides for Linux, Mac, and FreeBSD, I copied the guide from the original wiki on the Internet Archive.

---

### Files moved
* The debug menu has been moved out of re3.cpp and into src/extras/debug/debug_functions.cpp.
* The ini functions has been moved out of re3.cpp and into src/extras/functions/ini_functions.cpp.

---

### ImGui

* I have ImGui mostly working on this build, although it does somewhat distort the sound sometimes, it can be opened with the `F8` key.

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


List of files that now get loaded in from the "ViceExtended" folder (`ViceCityFolder`/ViceExtended):
TODO Complete this list
* `data` - 
<details> 
<summary> Data folder </summary>

```
Moved:
default.dat ViceExtended/
default.ide
gta_vc.dat
object.dat
particle.cfg,
and weapon.dat.
Also, moved mission scripts


```

</details>


* `fonts` - Custom font from [Cheat Menu Fonts](https://github.com/user-grinch/Cheat-Menu/blob/master/resource/addon/text.ttf)
* `logs` - Logs for lua files, toml, and the game itself.
* `lua_scripts` - My custom lua scripts.
* `models` - Some new txd files, hud, and other models
* `neo` - Something to do with reVC data.
* `TEXT` - Moved custom text into here for my menu.
* `toml` - Configs from the [Cheat Menu](https://github.com/user-grinch/Cheat-Menu/releases/tag/3.52)

# Info
This is the KCNet ReVC project, it will need applied to a copy of the ReVC code.

I have documented quite a bit in this repo, a lot of functions have documentation now.

There probably won't be very many updates to this anymore, I don't mess with this project much now.

# Credits
Credit goes to x87 on github for some code from the Vice Extended project
* https://github.com/x87/gta-extended