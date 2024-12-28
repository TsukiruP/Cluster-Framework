#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Room Initialization

// Room grid:
room_grid = ds_grid_create(9, 0);
game_room_set(rm_debug, TRANS_FADE, "bgm_debug", obj_sky_sanctuary_parallax);
game_room_set(rm_basic_test_1, TRANS_CARD, "bgm_basic_test_1", -1, "Basic Test", 1, 864, START_READY);
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
game_time = 0;

// Checkpoint variables:
checkpoint_time = -1;
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
/// Time

// Exit if the stage is paused:
if (game_ispaused(mnu_pause))
{
    exit;
}

// Save time:
if (!instance_exists(mgr_transition))
{
    game_save_set("time", game_save_get("time") + 1);
}

// Game time:
game_time += game_speed;
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

var i;

ds_list_destroy(keyboard_list);

for (i = 0; i < game_get_player_count(); i += 1)
{
    ds_list_destroy(gamepad_list[i]);
}

ds_map_destroy(setting_map);
ds_map_destroy(save_map);
ds_grid_destroy(room_grid);
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Time

game_time = 0;
