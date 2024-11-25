#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Game Initialization

var i;

// Image speed:
image_speed = 0;

// Randomize:
randomize();

// Player count:
player_count = 2;

// Game variables:
game_debug = debug_mode;
game_speed = 1;
game_timer = 0;

// Checkpoint variables:
checkpoint_timer = -1;
checkpoint_x = -1;
checkpoint_y = -1;

// Data:
game_setting_init();
game_save_init();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Manager Initialization

instance_create(0, 0, mgr_screen);
instance_create(0, 0, mgr_audio);
instance_create(0, 0, mgr_input);
instance_create(0, 0, mgr_text);
instance_create(0, 0, mgr_animation);
transition_create(rm_debug);
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Timers

// Increase save time:
game_save_set("time", game_save_get("time") + 1);

// Exit if the stage is paused:
if (game_ispaused(mnu_pause))
{
    exit;
}

game_timer += game_speed;
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy Data Structures

var i;

ds_list_destroy(keyboard_list);

for (i = 0; i < game_get_player_count(); i += 1)
{
    ds_list_destroy(gamepad_list[i]);
}

ds_map_destroy(setting_map);
ds_map_destroy(save_map);
