#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Engine Initialization

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

// Read/create audio settings:
global.setting_audio_bgm = ini_read_real("audio", "bgm", DEFAULT_AUDIO_BGM);
global.setting_audio_sfx = ini_read_real("audio", "sfx", DEFAULT_AUDIO_SFX);

// Read/create keyboard settings:
global.setting_input_key[INP_UP] = ini_read_real("input", "key_up", DEFAULT_KEY_UP);
global.setting_input_key[INP_DOWN] = ini_read_real("input", "key_down", DEFAULT_KEY_DOWN);
global.setting_input_key[INP_LEFT] = ini_read_real("input", "key_left", DEFAULT_KEY_LEFT);
global.setting_input_key[INP_RIGHT] = ini_read_real("input", "key_right", DEFAULT_KEY_RIGHT);

global.setting_input_key[INP_JUMP] = ini_read_real("input", "key_jump", DEFAULT_KEY_JUMP);
global.setting_input_key[INP_AUX] = ini_read_real("input", "key_aux", DEFAULT_KEY_AUX);
global.setting_input_key[INP_SWAP] = ini_read_real("input", "key_swap", DEFAULT_KEY_SWAP);
global.setting_input_key[INP_SUPER] = ini_read_real("input", "key_super", DEFAULT_KEY_SUPER);
global.setting_input_key[INP_TAG] = ini_read_real("input", "key_tag", DEFAULT_KEY_TAG);
global.setting_input_key[INP_ALT] = ini_read_real("input", "key_alt", DEFAULT_KEY_ALT);

global.setting_input_key[INP_START] = ini_read_real("input", "key_start", DEFAULT_KEY_START);
global.setting_input_key[INP_SELECT] = ini_read_real("input", "key_select", DEFAULT_KEY_SELECT);
global.setting_input_key[INP_ACCEPT] = ini_read_real("input", "key_accept", DEFAULT_KEY_ACCEPT);
global.setting_input_key[INP_CANCEL] = ini_read_real("input", "key_cancel", DEFAULT_KEY_CANCEL);
global.setting_input_key[INP_HELP] = ini_read_real("input", "key_help", DEFAULT_KEY_HELP);

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
    global.setting_input_pad[i, INP_ACCEPT] = DEFAULT_PAD_ACCEPT;
    global.setting_input_pad[i, INP_CANCEL] = DEFAULT_PAD_CANCEL;
    global.setting_input_pad[i, INP_HELP] = DEFAULT_PAD_HELP;

    // Other:
    global.setting_input_deadzone[i] = ini_read_real("input", "joy" + string(i) + "_deadzone", DEFAULT_PAD_DEADZONE);
    global.setting_input_confirm[i] = ini_read_real("input", "joy" + string(i) + "_confirm", DEFAULT_PAD_CONFIRM);
    global.setting_input_style[i] = ini_read_real("input", "joy" + string(i) + "_style", DEFAULT_PAD_STYLE);
}

// Read/create misc. input settings:
global.setting_input_focus = ini_read_real("input", "focus", false);

// Read/create textbox settings:
global.setting_textbox_red = ini_read_real("textbox", "red", DEFAULT_TEXT_RED);
global.setting_textbox_green = ini_read_real("textbox", "green", DEFAULT_TEXT_GREEN);
global.setting_textbox_blue = ini_read_real("textbox", "blue", DEFAULT_TEXT_BLUE);

// Read/create gameplay settings:
global.setting_gameplay_shields = ini_read_real("gameplay", "shields", DEFAULT_GAME_SHIELDS);
global.setting_gameplay_debuffs = ini_read_real("gameplay", "debuffs", DEFAULT_GAME_DEBUFF);
global.setting_gameplay_checkpoint = ini_read_real("gameplay", "checkpoint", DEFAULT_GAME_CHECKPOINT);

// Read/create Advance settings:
global.setting_advance_turn = ini_read_real("advance", "turn", DEFAULT_ADVANCE_TURN);
global.setting_advance_brake = ini_read_real("advance", "brake", DEFAULT_ADVANCE_BRAKE);
global.setting_advance_hurt = ini_read_real("advance", "hurt", DEFAULT_ADVANCE_HURT);
global.setting_advance_flicker = ini_read_real("advance", "flicker", DEFAULT_ADVANCE_FLICKER);

// Read/create misc. settings:
global.setting_misc_hud = ini_read_real("misc", "hud", DEFAULT_MISC_HUD);
global.setting_misc_status = ini_read_real("misc", "status", DEFAULT_MISC_STATUS);
global.setting_misc_feed = ini_read_real("misc", "feed", DEFAULT_MISC_FEED);
global.setting_misc_trails = ini_read_real("misc", "trails", DEFAULT_MISC_TRAILS);
global.setting_misc_reticle = ini_read_real("misc", "reticle", DEFAULT_MISC_RETICLE);
global.setting_misc_tally = ini_read_real("misc", "tally", DEFAULT_MISC_TALLY);

// Close settings file:
ini_close();

// Apply display settings:
global.display_width = 480;
global.display_height = 270;
global.display_mode = global.setting_display_mode;
global.display_ratio = global.setting_display_ratio;
global.display_scale = global.setting_display_scale;
global.display_fullscreen = global.setting_display_fullscreen;
global.display_vsync = global.setting_display_vsync;

// Apply audio settings:
global.audio_bgm = global.setting_audio_bgm;
global.audio_sfx = global.setting_audio_sfx;

// Apply keyboard settings:
for (i = INP_UP; i <= INP_HELP; i += 1)
{
    global.input_key[i] = global.setting_input_key[i];
}

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

// Apply textbox settings
global.textbox_red = global.setting_textbox_red;
global.textbox_green = global.setting_textbox_green;
global.textbox_blue = global.setting_textbox_blue;

// Apply gameplay settings:
global.gameplay_shields = global.setting_gameplay_shields;
global.gameplay_debuffs = global.setting_gameplay_debuffs;
global.gameplay_checkpoint = global.setting_gameplay_checkpoint;

// Apply Advance settings:
global.advance_turn = global.setting_advance_turn;
global.advance_brake = global.setting_advance_brake;
global.advance_hurt = global.setting_advance_hurt;
global.advance_flicker = global.setting_advance_flicker;

// Apply misc. settings:
global.misc_hud = global.setting_misc_hud;
global.misc_status = global.setting_misc_status;
global.misc_feed = global.setting_misc_feed;
global.misc_trails = global.setting_misc_trails;
global.misc_reticle = global.setting_misc_reticle;
global.misc_yally = global.setting_misc_tally;
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
transition_create(rm_basic_test_1);
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
/// Destroy Maps

ds_map_destroy(setting_map);
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
