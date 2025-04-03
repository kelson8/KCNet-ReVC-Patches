## Info about my lua test
I will have a list of all functions that work in my lua test in here

TODO I need to rename the test.lua file to kcnet-revc.lua or kcnet-revc-init.lua.
It will need renamed in the C++ code and the file itself.

These will always run on game startup, wasted, and busted if placed in the test.lua file under ViceExtended/lua_scripts.

Warning: DO NOT place some of these in the kcnet-events.lua file

TODO Make a list of what not to place in the kcnet-events.lua file.

# Misc
Run a test for the cheats, this was a basic test to run C++ functions but it isn't needed anymore.
* cheat_test(Cheat)

* List of items for cheat_test():
1. BLOWMEUP - Blow up the players current vehicle
2. KILLME - Run the suicide cheat
3. SPAWNCAR - Test for spawning a car
4. IMGUITG - This is a leftover and disabled, it used to be my original ImGui toggle.


Toggle the players control on/off
* toggle_control()

A toggle for ImGui, I moved to using a keybind for this.
* toggle_imgui()

# Player
Toggles

Turn on never wanted
* enable_never_wanted()

Turn on infinite health
* enable_infinite_health()

Functions

Set the players position to the specified coords
* set_position(x, y, z)

Heal the player to full health and give max armor
* heal_player()

Set the players spawn point, TODO Make this get the respawn point from the locations.lua
* set_respawn_point(x, y, z, heading)

Cancel the respawn, not sure if this works right
* cancel_override_restart()

Toggles for losing weapons when dying.
* enable_lose_weapons_on_death()
* disable_lose_weapons_on_death()

Log the players coords and heading
* log_player_coords()
* log_player_heading()

Check if player is in a vehicle
* is_player_in_vehicle()

Blow up the players vehicle
* blow_up_vehicle()

Kill the player if wanted
* kill_wanted_player()

Kill the player
* kill_player()

Change the players clothes, due to a crash with invalid models I have disabled this in the C++ code.
TODO Fix this and stop it from crashing on invalid models
* change_clothes("clothesName")

Booleans/Other:

Check if the player is alive
* is_player_alive()

Get the current wanted level if above 0
* get_wanted_level()

# Messages
Display a hud help message
* print_msg(message)

Log messages in lua

Log an info message
* log_info(message)

# World

Clear the area of any peds and vehicles
* clear_area(radius)

Set ped density to 0, disable peds
* disable_peds()

Set vehicle density to 0, disable vehicles
* disable_vehicles()

Blow up all vehicles (Doesn't blow up the players vehicle)
* blow_up_all_vehicles()

