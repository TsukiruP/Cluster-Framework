#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Engine Initialization

var i;

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

global.animation_grid = -1;
global.animation_character = -1;
global.animation_coordinates = -1;
global.animation_initialized = false;

global.checkpoint_x = -1;
global.checkpoint_y = -1;
global.checkpoint_time = -1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Game Initialization

game_setting_init();
game_save_init();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Settings Initialization

// Image speed:
image_speed = 0;

// Open/create settings file:
ini_open("settings.ini");

// Read/create gamepad settings:
for (i = 0; i < global.player_count; i += 1)
{
    global.setting_input_pad[i, INP_UP] = DEFAULT_PAD_UP;
    global.setting_input_pad[i, INP_DOWN] = DEFAULT_PAD_DOWN;
    global.setting_input_pad[i, INP_LEFT] = DEFAULT_PAD_LEFT;
    global.setting_input_pad[i, INP_RIGHT] = DEFAULT_PAD_RIGHT;

    global.setting_input_pad[i, INP_JUMP] = ini_read_real("input", "joy" + string(i) + "_jump", DEFAULT_PAD_JUMP);
    global.setting_input_pad[i, INP_AUX] = ini_read_real("input", "joy" + string(i) + "_aux", DEFAULT_PAD_AUX);
    global.setting_input_pad[i, INP_SWAP] = ini_read_real("input", "joy" + string(i) + "_swap", DEFAULT_PAD_SWAP);
    global.setting_input_pad[i, INP_SUPER] = ini_read_real("input", "joy" + string(i) + "_super", DEFAULT_PAD_SUPER);
    global.setting_input_pad[i, INP_TAG] = ini_read_real("input", "joy" + string(i) + "_tag", DEFAULT_PAD_TAG);
    global.setting_input_pad[i, INP_ALT] = ini_read_real("input", "joy" + string(i) + "_alt", DEFAULT_PAD_ALT);

    global.setting_input_pad[i, INP_START] = DEFAULT_PAD_START;
    global.setting_input_pad[i, INP_SELECT] = DEFAULT_PAD_SELECT;
    global.setting_input_pad[i, INP_CONFIRM] = DEFAULT_PAD_ACCEPT;
    global.setting_input_pad[i, INP_CANCEL] = DEFAULT_PAD_CANCEL;
    global.setting_input_pad[i, INP_HELP] = DEFAULT_PAD_HELP;

    // Other:
    global.setting_input_deadzone[i] = ini_read_real("input", "joy" + string(i) + "_deadzone", DEFAULT_PAD_DEADZONE);
    global.setting_input_confirm[i] = ini_read_real("input", "joy" + string(i) + "_confirm", DEFAULT_PAD_CONFIRM);
    global.setting_input_style[i] = ini_read_real("input", "joy" + string(i) + "_style", DEFAULT_PAD_STYLE);
}

// Read/create misc. input settings:
global.setting_input_focus = ini_read_real("input", "focus", false);

// Close settings file:
ini_close();

// Apply gamepad settings:
for (i = 0; i < global.player_count; i += 1)
{
    for (j = INP_UP; j <= INP_HELP; j += 1)
    {
        global.input_pad[i, j] = global.setting_input_pad[i, j];
    }

    // Other settings:
    global.input_deadzone[i] = global.setting_input_deadzone[i];
    global.input_confirm[i] = global.setting_input_confirm[i];
    global.input_style[i] = global.setting_input_style[i];
}

// Apply misc. input settings:
global.input_focus = global.setting_input_focus;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Manager Initialization

instance_create(x, y, mgr_screen);
instance_create(x, y, mgr_audio);
instance_create(x, y, mgr_input);
instance_create(x, y, mgr_text);
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

ds_map_destroy(setting_map);
ds_list_destroy(keyboard_list);
ds_map_destroy(save_map);
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Game

global.game_speed = 1;
global.game_time = 0;
global.object_time = 0;
global.game_rings = 0;
global.game_score = 0;

global.pause_allow = true;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Animations

if (global.animation_grid != -1)
{
    global.animation_initialized = false;
    ds_grid_destroy(global.animation_grid);
    global.animation_grid = -1;
}
