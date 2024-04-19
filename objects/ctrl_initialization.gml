#define Other_2
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

// Read/create display settings:
global.setting_display_mode       = ini_read_real("display", "mode", DEFAULT_DISPLAY_MODE);
global.setting_display_ratio      = ini_read_real("display", "ratio", DEFAULT_DISPLAY_RATIO);
global.setting_display_scale      = ini_read_real("display", "scale", DEFAULT_DISPLAY_SCALE);
global.setting_display_fullscreen = ini_read_real("display", "full", DEFAULT_DISPLAY_FULLSCREEN);
global.setting_display_vsync      = ini_read_real("display", "vsync", DEFAULT_DISPLAY_VSYNC);

// Read/create audio settings:
global.setting_audio_bgm = ini_read_real("audio", "bgm", DEFAULT_AUDIO_BGM);
global.setting_audio_sfx = ini_read_real("audio", "sfx", DEFAULT_AUDIO_SFX);

// Read/create keyboard settings:
global.setting_input_key[INP_LEFT]    = ini_read_real("input", "key_left", DEFAULT_KEY_LEFT);
global.setting_input_key[INP_RIGHT]   = ini_read_real("input", "key_right", DEFAULT_KEY_RIGHT);
global.setting_input_key[INP_UP]      = ini_read_real("input", "key_up", DEFAULT_KEY_UP);
global.setting_input_key[INP_DOWN]    = ini_read_real("input", "key_down", DEFAULT_KEY_DOWN);

global.setting_input_key[INP_JUMP]    = ini_read_real("input", "key_jump", DEFAULT_KEY_JUMP);
global.setting_input_key[INP_SPECIAL] = ini_read_real("input", "key_special", DEFAULT_KEY_SPECIAL);
global.setting_input_key[INP_SWAP]    = ini_read_real("input", "key_swap", DEFAULT_KEY_SWAP);
global.setting_input_key[INP_SUPER]   = ini_read_real("input", "key_super", DEFAULT_KEY_SUPER);
global.setting_input_key[INP_TAG]     = ini_read_real("input", "key_tag", DEFAULT_KEY_TAG);
global.setting_input_key[INP_ALT]     = ini_read_real("input", "key_tag", DEFAULT_KEY_ALT);

global.setting_input_key[INP_START]   = ini_read_real("input", "key_start", DEFAULT_KEY_START);
global.setting_input_key[INP_SELECT]  = ini_read_real("input", "key_select", DEFAULT_KEY_SELECT);
global.setting_input_key[INP_ACCEPT]  = ini_read_real("input", "key_accept", DEFAULT_KEY_ACCEPT);
global.setting_input_key[INP_CANCEL]  = ini_read_real("input", "key_cancel", DEFAULT_KEY_CANCEL);
global.setting_input_key[INP_HELP]    = ini_read_real("input", "key_help", DEFAULT_KEY_HELP);

// Read/create joystick settings:
for (i = 0; i < 2; i += 1) {
    global.setting_input_joy[INP_LEFT, i]    = JOY_LEFT;
    global.setting_input_joy[INP_RIGHT, i]   = JOY_RIGHT;
    global.setting_input_joy[INP_UP, i]      = JOY_UP;
    global.setting_input_joy[INP_DOWN, i]    = JOY_DOWN;
    global.setting_input_joy[INP_JUMP, i]    = ini_read_real("input", "joy" + string(i) + "_jump", JOY_FACE1);
    global.setting_input_joy[INP_SPECIAL, i] = ini_read_real("input", "joy" + string(i) + "_special", JOY_FACE3);
    global.setting_input_joy[INP_SWAP, i]    = ini_read_real("input", "joy" + string(i) + "_swap", JOY_FACE4);
    global.setting_input_joy[INP_SUPER, i]   = ini_read_real("input", "joy" + string(i) + "_super", JOY_FACE2);
    global.setting_input_joy[INP_TAG, i]     = ini_read_real("input", "joy" + string(i) + "_tag", JOY_BUMPERR);
    global.setting_input_joy[INP_ALT, i]     = ini_read_real("input", "joy" + string(i) + "_alt", JOY_BUMPERL);
    global.setting_input_joy[INP_START, i]   = JOY_START;
    global.setting_input_joy[INP_SELECT, i]  = JOY_SELECT;
    global.setting_input_joy[INP_ACCEPT, i]  = JOY_FACE1;
    global.setting_input_joy[INP_CANCEL, i]  = JOY_FACE2;
    global.setting_input_joy[INP_HELP, i]    = JOY_FACE4;

    // Other:
    global.setting_input_deadzone[i] = ini_read_real("input", "joy" + string(i) + "_deadzone", 0.05);
    global.setting_input_accept[i]   = ini_read_real("input", "joy" + string(i) + "_accept", 0);
}

// Read/create misc input settings:
global.setting_input_style  = ini_read_real("input", "misc_style", DEFAULT_MISC_STYLE);

// Read/create textbox settings:
global.setting_textbox_red   = ini_read_real("textbox", "red", DEFAULT_TEXTBOX_RED);
global.setting_textbox_green = ini_read_real("textbox", "green", DEFAULT_TEXTBOX_GREEN);
global.setting_textbox_blue  = ini_read_real("textbox", "blue", DEFAULT_TEXTBOX_BLUE);

// Read/create gameplay settings:
global.setting_gameplay_turn       = ini_read_real("gameplay", "turn", true);
global.setting_gameplay_skid       = ini_read_real("gameplay", "skid", true);
global.setting_gameplay_elemental  = ini_read_real("gameplay", "elemental", true);
global.setting_gameplay_debuffs    = ini_read_real("gameplay", "debuffs", false);
global.setting_gameplay_checkpoint = ini_read_real("gameplay", "checkpoint", true);

// Read/create misc. settings:
global.setting_misc_hud     = ini_read_real("misc", "hud", 0);
global.setting_misc_status  = ini_read_real("misc", "status", 1);
global.setting_misc_feed    = ini_read_real("misc", "feed", true);
global.setting_misc_trails  = ini_read_real("misc", "trails", false);
global.setting_misc_lock_on = ini_read_real("misc", "lock_on", true);
global.setting_misc_results = ini_read_real("misc", "results", 1);

// Close settings file:
ini_close();

// Apply display settings:
global.display_width      = 480;
global.display_height     = 270;
global.display_mode       = global.setting_display_mode;
global.display_ratio      = global.setting_display_ratio;
global.display_scale      = global.setting_display_scale;
global.display_fullscreen = global.setting_display_fullscreen;
global.display_vsync      = global.setting_display_vsync;

// Apply audio settings:
global.audio_bgm = global.setting_audio_bgm;
global.audio_sfx = global.setting_audio_sfx;

// Apply keyboard settings:
for (i = INP_LEFT; i <= INP_HELP; i += 1) {
    global.input_key[i] = global.setting_input_key[i];
}

// Apply joystick settings:
for (i = 0; i < 2; i += 1) {
    for (j = INP_LEFT; j <= INP_HELP; j += 1) {
        global.input_joy[j, i] = global.setting_input_joy[j, i];
    }

    // Other settings:
    global.input_deadzone[i] = global.setting_input_deadzone[i];
    global.input_accept[i]   = global.setting_input_accept[i];
}

// Apply misc input settings:
global.input_style = global.setting_input_style;

// Apply textbox settings
global.textbox_red   = global.setting_textbox_red;
global.textbox_green = global.setting_textbox_green;
global.textbox_blue  = global.setting_textbox_blue;

// Apply gameplay settings:
global.gameplay_turn       = global.setting_gameplay_turn;
global.gameplay_skid       = global.setting_gameplay_skid;
global.gameplay_elemental  = global.setting_gameplay_elemental;
global.gameplay_debuffs    = global.setting_gameplay_debuffs;
global.gameplay_checkpoint = global.setting_gameplay_checkpoint;

// Apply misc. settings:
global.misc_hud     = global.setting_misc_hud;
global.misc_status  = global.setting_misc_status;
global.misc_feed    = global.setting_misc_feed;
global.misc_trails  = global.setting_misc_trails;
global.misc_lock_on = global.setting_misc_lock_on;
global.misc_results = global.setting_misc_results;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Save Initialization

// Read/create Sonic skill settings:
global.save_sonic_skill_jump     = 0;
global.save_sonic_skill_special  = 0;
global.save_sonic_skill_peel_out = false;
global.save_sonic_skill_homing   = 0;
global.save_sonic_skill_shield   = false;

// Read/create Miles skill settings:
global.save_miles_skill_attack  = 0;
global.save_miles_skill_special = 0;
global.save_miles_skill_shield  = false;

// Read/create Knuckles skill settings:
global.save_knuckles_skill_attack     = false;
global.save_knuckles_skill_drill_claw = false;
global.save_knuckles_skill_headbutt   = false;
global.save_knuckles_skill_wall_dash  = false;
global.save_knuckles_skill_shield     = false;

// Read/create universal skill settings:
global.save_skill_tag_action = false;
global.save_skill_swap       = false;

// Apply Sonic skill settings:
global.sonic_skill_jump     = global.save_sonic_skill_jump;
global.sonic_skill_special  = global.save_sonic_skill_special;
global.sonic_skill_peel_out = global.save_sonic_skill_peel_out;
global.sonic_skill_homing   = global.save_sonic_skill_homing;
global.sonic_skill_shield   = global.save_sonic_skill_shield;

// Apply Miles skill settings:
global.miles_skill_attack  = global.save_miles_skill_attack;
global.miles_skill_special = global.save_miles_skill_special;
global.miles_skill_shield  = global.save_miles_skill_shield;

// Apply Knuckles skill settings:
global.knuckles_skill_attack     = global.save_knuckles_skill_attack;
global.knuckles_skill_drill_claw = global.save_knuckles_skill_drill_claw;
global.knuckles_skill_headbutt   = global.save_knuckles_skill_headbutt;
global.knuckles_skill_wall_dash  = global.save_knuckles_skill_wall_dash;
global.knuckles_skill_shield     = global.save_knuckles_skill_shield;

// Apply universal skill settings:
global.skill_tag_action = global.save_skill_tag_action;
global.skill_swap       = global.save_skill_swap;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Engine Initialization

// Randomize:
randomize();

// Player inisitalization:
global.player_instance[0]    =   noone;
global.player_instance[1]    =   noone;
global.player_data[0]        =   CHAR_SONIC;
global.player_data[1]        =  -1;

global.gravity_angle         =  0;
global.animation_grid        = -1;
global.animation_character   = -1;
global.animation_coordinates = -1;
global.animation_initialized = false;

global.checkpoint_x          = -1;
global.checkpoint_y          = -1;
global.checkpoint_time       = -1;

// Set views:
room_view_set_all();

// Create controllers:
instance_create(x, y, ctrl_display);
instance_create(x, y, ctrl_audio);
instance_create(x, y, ctrl_input);
instance_create(x, y, ctrl_text);
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
transition_create(rm_basic_test_1);
