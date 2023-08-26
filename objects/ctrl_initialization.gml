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
global.settings_display_mode       = ini_read_real("display", "mode", DEFAULT_DISPLAY_MODE);
global.settings_display_ratio      = ini_read_real("display", "ratio", DEFAULT_DISPLAY_RATIO);
global.settings_display_scale      = ini_read_real("display", "scale", DEFAULT_DISPLAY_SCALE);
global.settings_display_fullscreen = ini_read_real("display", "full", DEFAULT_DISPLAY_FULLSCREEN);
global.settings_display_vsync      = ini_read_real("display", "vsync", DEFAULT_DISPLAY_VSYNC);

// Read/create audio settings:
global.settings_audio_bgm_volume = ini_read_real("audio", "bgm", DEFAULT_AUDIO_BGM);
global.settings_audio_sfx_volume = ini_read_real("audio", "sfx", DEFAULT_AUDIO_SFX);

// Read/create key input settings:
global.settings_input_key_left    = ini_read_real("input", "key_left", DEFAULT_KEY_LEFT);
global.settings_input_key_right   = ini_read_real("input", "key_right", DEFAULT_KEY_RIGHT);
global.settings_input_key_up      = ini_read_real("input", "key_up", DEFAULT_KEY_UP);
global.settings_input_key_down    = ini_read_real("input", "key_down", DEFAULT_KEY_DOWN);

global.settings_input_key_jump    = ini_read_real("input", "key_jump", DEFAULT_KEY_JUMP);
global.settings_input_key_special = ini_read_real("input", "key_special", DEFAULT_KEY_SPECIAL);
global.settings_input_key_swap    = ini_read_real("input", "key_swap", DEFAULT_KEY_SWAP);
global.settings_input_key_tag     = ini_read_real("input", "key_tag", DEFAULT_KEY_TAG);
global.settings_input_key_super   = ini_read_real("input", "key_super", DEFAULT_KEY_SUPER);

global.settings_input_key_start   = ini_read_real("input", "key_start", DEFAULT_KEY_START);
global.settings_input_key_select  = ini_read_real("input", "key_select", DEFAULT_KEY_SELECT);
global.settings_input_key_accept  = ini_read_real("input", "key_accept", DEFAULT_KEY_ACCEPT);
global.settings_input_key_cancel  = ini_read_real("input", "key_cancel", DEFAULT_KEY_CANCEL);
global.settings_input_key_help    = ini_read_real("input", "key_help", DEFAULT_KEY_HELP);

// Read/create pad input settings:
/* [PLACEHOLDER]
global.settings_input_pad_jump     = ini_read_real("input", "pad_jump", default_pad_jump);
global.settings_input_pad_special  = ini_read_real("input", "pad_special", default_pad_special);
global.settings_input_pad_swap     = ini_read_real("input", "pad_swap", default_pad_swap);
global.settings_input_pad_tag      = ini_read_real("input", "pad_tag", default_pad_tag);
global.settings_input_pad_super    = ini_read_real("input", "pad_super", default_pad_super);

global.settings_input_pad_deadzone = ini_read_real("input", "pad_tag", default_pad_deadzone);
*/

// Read/create misc input settings:
global.settings_input_misc_style  = ini_read_real("input", "misc_style", DEFAULT_MISC_STYLE);
global.settings_input_misc_accept = ini_read_real("input", "misc_accept", DEFAULT_MISC_ACCEPT);

// Read/create textbox settings:
global.settings_textbox_red   = ini_read_real("textbox", "red", DEFAULT_TEXTBOX_RED);
global.settings_textbox_green = ini_read_real("textbox", "green", DEFAULT_TEXTBOX_GREEN);
global.settings_textbox_blue  = ini_read_real("textbox", "blue", DEFAULT_TEXTBOX_BLUE);

// Read/create gameplay settings:
global.settings_gameplay_uncurl     = ini_read_real("gameplay", "uncurl", false);
global.settings_gameplay_elemental  = ini_read_real("gameplay", "elemental", true);
global.settings_gameplay_debuffs    = ini_read_real("gameplay", "debuffs", false);
global.settings_gameplay_checkpoint = ini_read_real("gameplay", "checkpoint", true);

// Read/create misc settings:
global.settings_misc_hud     = ini_read_real("misc", "hud", 1);
global.settings_misc_status  = ini_read_real("misc", "status", 2);
global.settings_misc_feed    = ini_read_real("misc", "feed", true);
global.settings_misc_trails  = ini_read_real("misc", "trails", false);
global.settings_misc_lock_on = ini_read_real("misc", "lock_on", true);
global.settings_misc_results = ini_read_real("misc", "results", 1);

// Close settings file:
ini_close();

// Apply display settings:
global.display_width      = 480;
global.display_height     = 270;
global.display_mode       = global.settings_display_mode;
global.display_ratio      = global.settings_display_ratio;
global.display_scale      = global.settings_display_scale;
global.display_fullscreen = global.settings_display_fullscreen;
global.display_vsync      = global.settings_display_vsync;


// Apply audio settings:
global.audio_bgm_volume = global.settings_audio_bgm_volume;
global.audio_sfx_volume = global.settings_audio_sfx_volume;

// Apply key input settings:
global.input_key_left    = global.settings_input_key_left;
global.input_key_right   = global.settings_input_key_right;
global.input_key_up      = global.settings_input_key_up;
global.input_key_down    = global.settings_input_key_down;

global.input_key_jump    = global.settings_input_key_jump;
global.input_key_special = global.settings_input_key_special;
global.input_key_swap    = global.settings_input_key_swap;
global.input_key_tag     = global.settings_input_key_tag;
global.input_key_super   = global.settings_input_key_super;

global.input_key_start   = global.settings_input_key_start;
global.input_key_select  = global.settings_input_key_select;
global.input_key_accept  = global.settings_input_key_accept;
global.input_key_cancel  = global.settings_input_key_cancel;
global.input_key_help    = global.settings_input_key_help;

// Apply pad input settings:
/* [PLACEHOLDER]
global.input_pad_jump     = global.settings_input_pad_jump;
global.input_pad_special  = global.settings_input_pad_special;
global.input_pad_swap     = global.settings_input_pad_swap;
global.input_pad_tag      = global.settings_input_pad_tag;
global.input_pad_super    = global.settings_input_pad_super;

global.input_pad_accept   = gp_face1;
global.input_pad_cancel   = gp_face2;

global.input_pad_deadzone = global.settings_input_pad_deadzone;
*/

// Apply misc input settings:
global.input_misc_style  = global.settings_input_misc_style;
global.input_misc_accept = global.settings_input_misc_accept;

// Apply textbox settings
global.textbox_red   = global.settings_textbox_red;
global.textbox_green = global.settings_textbox_green;
global.textbox_blue  = global.settings_textbox_blue;

// Apply gameplay settings:
global.gameplay_uncurl     = global.settings_gameplay_uncurl;
global.gameplay_elemental  = global.settings_gameplay_elemental;
global.gameplay_debuffs    = global.settings_gameplay_debuffs;
global.gameplay_checkpoint = global.settings_gameplay_checkpoint;

// Apply misc settings:
global.misc_hud     = global.settings_misc_hud;
global.misc_status  = global.settings_misc_status;
global.misc_feed    = global.settings_misc_feed;
global.misc_trails  = global.settings_misc_trails;
global.misc_lock_on = global.settings_misc_lock_on;
global.misc_results = global.settings_misc_results;
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

// Gamepad variables:
global.gamepad_device = 0;
global.gamepad_exists = false;

// Fonts:
global.font_system       = font_add_sprite(fnt_system, ord(" "), true, 0);
global.font_title_card   = font_add_sprite(fnt_title_card_zone, ord(" "), true, -4);
global.font_hud          = font_add_sprite(fnt_hud, ord("0"), false, 1);

// Character related:
global.player_id       =  noone;
global.partner_id      =  noone;
global.player_data     =  CHAR_SONIC;
global.partner_data    =  CHAR_NONE;

global.gravity_angle   =  0;
global.checkpoint_x    = -1;
global.checkpoint_y    = -1;
global.checkpoint_time = -1;

// Set views:
room_view_set_all();

// Create controllers:
instance_create(x, y, ctrl_display);
instance_create(x, y, ctrl_audio);
instance_create(x, y, ctrl_input);
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_transition(rm_basic_test_1);
