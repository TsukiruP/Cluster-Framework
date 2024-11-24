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

// Game initialization:
global.game_debug = debug_mode;
global.time_allow = false;
global.pause_allow = true;

global.game_speed = 1;
global.game_time = 0;
global.object_time = 0;
global.game_rings = 0;
global.game_score = 0;

// Player initialization:
global.player_count = 2;

for (i = 0; i < global.player_count; i += 1)
{
    global.player_data[i, 0] = -1;
    global.player_data[i, 1] = noone;
}

global.player_data[0, 0] = CHAR_SONIC;

global.checkpoint_x = -1;
global.checkpoint_y = -1;
global.checkpoint_time = -1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Data Initialization

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
/// Global Timers

// Exit if the stage is paused:
if (game_ispaused(mnu_pause))
{
    exit;
}

// Stage timer:
if (global.time_allow == true && !game_ispaused(mgr_text))
{
    global.game_time += global.game_speed;
}

// Object timer:
global.object_time += global.game_speed;

// Floor timers:
if (global.game_speed == 1)
{
    global.game_time = floor(global.game_time);
    global.object_time = floor(global.object_time);
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause

// Exit if there's no player 1:
if (!instance_exists(player_get_instance(0)))
{
    exit;
}

if (!game_ispaused(mgr_text) && global.pause_allow == true && !instance_exists(mnu_pause) && input_get_check(INP_START, CHECK_PRESSED))
{
    var pause_fade;
    
    pause_fade = fade_create(0.6, 0.06, depth);
    
    with (instance_create(0, 0, mnu_pause))
    {
        fade_handle = pause_fade;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cull Instances

if (instance_exists(mgr_camera))
{
    // Deactivate objects:
    instance_deactivate_object(par_culled);

    // Activate region around view:
    instance_activate_region(view_xview[view_current] - 64, view_yview[view_current] - 64, view_wview[view_current] + 128, view_hview[view_current] + 128, true);

    // Activate region around players:
    with (obj_player)
    {
        if (!in_view())
        {
            instance_activate_region(x - 64, y - 64, 128, 128, true);
        }
    }
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy Data Structures

var i;

ds_list_destroy(keyboard_list);

for (i = 0; i < global.player_count; i += 1)
{
    ds_list_destroy(gamepad_list[i]);
}

ds_map_destroy(setting_map);
ds_map_destroy(save_map);
