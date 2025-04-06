#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Constant Initialization

OPTION_TEXT = 0;
OPTION_VALUE = 1;
OPTION_SELECT = 2;
OPTION_CHANGE = 3;
OPTION_CONFIRM = 4;

MENU_INIT = 0;
MENU_DEVICE = 1;
MENU_START = 2;
MENU_CANCEL = 3;
MENU_FUNCTION = 4;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu Initialization

menu_alarm = 0;
menu_index = debug_menu_top;
menu_cursor = 0;
menu_option = 0;
menu_scroll = 0;
menu_x_direction = 0;
menu_list = ds_list_create();
menu_fade = 0;
history_stack = ds_stack_create();
debug_set_menu(debug_menu_top);

transition_room = room_first;
transition_preview = TRANS_FADE;

rename_allow = false;
rename_backup = "";

rebind_input = INP_ANY;
rebind_device = DEV_KEYBOARD;

sfx_alarm = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_list_destroy(menu_list);

for ({var i; i = 0}; i < ds_stack_size(history_stack); i += 1)
{
    ds_list_destroy(ds_stack_pop(history_stack));
}

ds_stack_destroy(history_stack);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

menu_x_direction = 0;

if (visible != !instance_exists(mnu_debug_save)) visible = !instance_exists(mnu_debug_save);

if (game_ispaused(ctrl_text) || instance_exists(ctrl_transition) || instance_exists(mnu_debug_save))
{
    if (menu_alarm == 0) menu_alarm = 2;
    exit;
}

if (menu_alarm > 0)
{
    menu_alarm -= 1;
    exit;
}

if (menu_fade != 0) exit;

var menu_up; menu_up = (input_get_check(INP_UP, CHECK_PRESSED) || input_get_time(INP_UP, 30));
var menu_down; menu_down = (input_get_check(INP_DOWN, CHECK_PRESSED) || input_get_time(INP_DOWN, 30));
var menu_y_direction; menu_y_direction = menu_down - menu_up;

if (menu_y_direction != 0 && sfx_alarm == 0)
{
    sfx_alarm = 8;
    audio_play_sfx("snd_menu_move", true);
}

menu_option += menu_y_direction;
var menu_size; menu_size = ds_list_size(menu_list) - 1;

if (menu_option < 0)
{
    menu_cursor = min(3, menu_size);
    menu_option = menu_size;
    menu_scroll = max(0, menu_size - 3);
}
else if (menu_option > menu_size)
{
    menu_cursor = 0;
    menu_option = 0;
    menu_scroll = 0;
}
else
{
    if ((menu_cursor == 0 && sign(menu_y_direction) == -1) || (menu_cursor == 3 && sign(menu_y_direction) == 1)) menu_scroll += menu_y_direction;
    else menu_cursor += menu_y_direction;
}

// Start:
if (input_get_check(INP_START, CHECK_PRESSED)) debug_get_menu(MENU_START);

// Select:
if (input_get_check(INP_SELECT, CHECK_PRESSED))
{
    var option_select; option_select = debug_get_option(menu_option, OPTION_SELECT);

    if (!is_undefined(option_select)) audio_play_sfx("snd_menu_confirm", true);
}

// Change:
var menu_left; menu_left = (input_get_check(INP_LEFT, CHECK_PRESSED) || input_get_time(INP_LEFT, 30));
var menu_right; menu_right = (input_get_check(INP_RIGHT, CHECK_PRESSED) || input_get_time(INP_RIGHT, 30));

menu_x_direction = menu_right - menu_left;

if (menu_x_direction != 0)
{
    var option_change; option_change = debug_get_option(menu_option, OPTION_CHANGE);

    if (!is_undefined(option_change) && sfx_alarm == 0)
    {
        sfx_alarm = 8;
        audio_play_sfx(pick(option_change, "snd_menu_cannot", "snd_menu_move"), true);
    }
}

// Confirm:
if (input_get_check(INP_CONFIRM, CHECK_PRESSED))
{
    var option_confirm; option_confirm = debug_get_option(menu_option, OPTION_CONFIRM);

    if (!is_undefined(option_confirm)) audio_play_sfx(pick(option_confirm, "snd_menu_cannot", "snd_menu_confirm"), true);
}

// Cancel:
if (input_get_check(INP_CANCEL, CHECK_PRESSED))
{
    if (debug_set_previous()) audio_play_sfx("snd_menu_close", true);
}

// Function:
if (input_get_check(INP_FUNC, CHECK_PRESSED)) debug_get_menu(MENU_FUNCTION);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Rename

if (!rename_allow) exit;

if (!window_has_focus())
{
    if (keyboard_string == "" && keyboard_string != rename_backup) keyboard_string = rename_backup;
}
else
{
    if (string_length(keyboard_string) > 10) keyboard_string = string_delete_end(keyboard_string, string_length(keyboard_string) - 10);

    rename_backup = keyboard_string;

    if (keyboard_check_pressed(vk_enter))
    {
        game_save_set("name", rename_backup);
        rename_allow = false;
        rename_backup = "";
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Rebind

if (menu_alarm != 0 || rebind_input == INP_ANY) exit;

if (rebind_device == DEV_KEYBOARD)
{
    if (keyboard_key != vk_nokey)
    {
        keyboard_clear(vk_anykey);

        // Merge modifier keys:
        if (keyboard_key == vk_lshift || keyboard_key == vk_rshift) keyboard_key = vk_shift;
        if (keyboard_key == vk_lcontrol || keyboard_key == vk_rcontrol) keyboard_key = vk_control;
        if (keyboard_key == vk_lalt || keyboard_key == vk_ralt) keyboard_key = vk_alt;

        // Global keys:
        if (rebind_input <= INP_RIGHT || rebind_input == INP_START || rebind_input == INP_SELECT)
        {
            for ({var i; i = INP_UP}; i <= INP_HIDE; i += 1)
            {
                if (keyboard_key == game_config_get_key(i)) game_config_set_key(i, game_config_get_key(rebind_input));
            }
        }

        // Gameplay keys:
        else if (rebind_input >= INP_JUMP && rebind_input <= INP_ALT)
        {
            var input_global; input_global = false;

            // First go through global and gameplay keys:
            for ({var i; i = INP_UP}; i <= INP_SELECT; i += 1)
            {
                if (keyboard_key == game_config_get_key(i))
                {
                    if (i <= INP_RIGHT || i == INP_START || i == INP_SELECT) input_global = true;
                    game_config_set_key(i, game_config_get_key(rebind_input));
                }
            }

            // If we've matched a global key, then we check the menu keys just in case:
            if (input_global)
            {
                for ({var i; i = INP_CONFIRM}; i <= INP_HIDE; i += 1)
                {
                    if (game_config_get_key(rebind_input) == game_config_get_key(i)) game_config_set_key(i, keyboard_key);
                }
            }
        }

        // Menu keys:
        else if (rebind_input >= INP_CONFIRM && rebind_input <= INP_HIDE)
        {
            var input_global; input_global = false;

            // First we go through the globals and menu keys, skipping around the gameplay keys:
            for ({var i; i = INP_UP}; i <= INP_HIDE; i += 1)
            {
                if (i == INP_JUMP) i = INP_START; // We skip to Start.

                if (keyboard_key == game_config_get_key(i))
                {
                    if (i <= INP_RIGHT || i == INP_START || i == INP_SELECT) input_global = true;
                    game_config_set_key(i, game_config_get_key(rebind_input));
                }
            }

            // Again, if we've matched a global key, we check the gameplay keys properly now:
            if (input_global)
            {
                for ({var i; i = INP_JUMP}; i <= INP_ALT; i += 1)
                {
                    if (game_config_get_key(rebind_input) == game_config_get_key(i)) game_config_set_key(i, keyboard_key);
                }
            }
        }

        game_config_set_key(rebind_input, keyboard_key);
        debug_set_rebind(INP_ANY);
    }
}
else if (rebind_device > DEV_KEYBOARD)
{
    var player_index; player_index = rebind_device - DEV_GAMEPAD0;
    var gamepad_button; gamepad_button = gamepad_get_any(player_index, CHECK_PRESSED);

    if (gamepad_button != PAD_NONE)
    {
        // Gamepad is restricted in what inputs it can change and what buttons can be used:
        if (rebind_input >= INP_JUMP && rebind_input <= INP_ALT && gamepad_button >= PAD_FACE1 && gamepad_button <= PAD_TRIGGERR)
        {
            for ({var i; i = INP_JUMP}; i <= INP_ALT; i += 1)
            {
                if (gamepad_button == game_config_get_button(player_index, i)) game_config_set_button(player_index, i, game_config_get_button(player_index, rebind_input));
            }

            game_config_set_button(player_index, rebind_input, gamepad_button);
        }

        debug_set_rebind(INP_ANY);
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (sfx_alarm > 0) sfx_alarm -= 1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alpha

if (rename_allow || rebind_input != INP_ANY) menu_fade = 0.6;
else menu_fade = 0;
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu

var font_height; font_height = font_get_height(global.font_system);

// Box:
draw_rect(view_xview[view_current] + screen_get_width() / 2 - 81, view_yview[view_current] + screen_get_height() / 2 - 52, 164, 78, game_get_interface_color(), game_config_get("interface_alpha"))

// Text:
for ({var i; i = 0}; i < min(ds_list_size(menu_list), 4); i += 1)
{
    var option_index; option_index = i + menu_scroll;
    var option_text; option_text = debug_get_option(option_index, 0);
    var option_value; option_value = debug_get_option(option_index, 1);
    var option_x; option_x = view_xview[view_current] + screen_get_width() / 2;
    var option_y; option_y = view_yview[view_current] + screen_get_height() / 2 - 41 + font_height * i;

    // Font:
    draw_set_font(global.font_system);
    draw_set1(pick(menu_option == option_index, c_gray, c_white), 1);
    draw_set_halign(fa_center);

    if (!is_undefined(option_value))
    {
        draw_set_halign(fa_right);
        draw_text(option_x + 70, option_y, string(option_value));

        option_x -= 70;
        draw_set_halign(fa_left);
    }

    draw_text(option_x, option_y, option_text);
}

// Fade:
draw_rectangle_view(c_black, menu_fade);
draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Entry

var font_height; font_height = font_get_height(global.font_system);
var entry_string; entry_string = "";

// Entry:
draw_set_font(global.font_system);
draw_set1(c_white, 1);
draw_set2(fa_center, fa_middle);

if (rename_allow) entry_string = "Enter a name#" + rename_backup;
else if (rebind_input != INP_ANY)
{
    entry_string = "Enter a " + pick(rebind_device == DEV_KEYBOARD, "button", "key") + " to bind to " + input_get_name(rebind_input);
    if (rebind_device > DEV_KEYBOARD) entry_string += "#Disclaimer: Some buttons cannot be used for binding.";
}

draw_text(view_xview[view_current] + screen_get_width() / 2, view_yview[view_current] + screen_get_height() / 2, entry_string);
draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Guide

var font_height; font_height = font_get_height(global.font_system);
var guide_string; guide_string = "";

if (rename_allow) guide_string = "Enter Finish";
else
{
    var guide_input;

    guide_input[0] = ""; // Change
    guide_input[1] = ""; // Start
    guide_input[2] = ""; // Select
    guide_input[3] = ""; // Function
    guide_input[4] = ""; // Confirm
    guide_input[5] = ""; // Cancel

    if (!is_undefined(debug_get_option(menu_option, OPTION_CHANGE, false))) guide_input[0] = string_input(INP_LEFT) + " / " + string_input(INP_RIGHT) + " Change";
    if (!is_undefined(debug_get_menu(MENU_START, false))) guide_input[1] = string_input(INP_START) + " " + debug_get_menu(MENU_START, false);
    if (!is_undefined(debug_get_option(menu_option, OPTION_SELECT, false))) guide_input[2] = string_input(INP_SELECT) + " Help";
    if (!is_undefined(debug_get_menu(MENU_FUNCTION, false))) guide_input[3] = string_input(INP_FUNC) + " " + debug_get_menu(MENU_FUNCTION, false);
    if (!is_undefined(debug_get_option(menu_option, OPTION_CONFIRM, false))) guide_input[4] = string_input(INP_CONFIRM) + " Confirm";
    if (!ds_stack_empty(history_stack)) guide_input[5] = string_input(INP_CANCEL) + " Back";

    for ({var i; i = 0}; i <= 5; i += 1)
    {
        if (guide_input[i] != "")
        {
            if (guide_string != "") guide_string += "#";
            guide_string += guide_input[i];
        }
    }
}

draw_set2(fa_left, fa_bottom);
draw_text(view_xview[view_current] + font_height / 2, view_yview[view_current] + screen_get_height(), guide_string);
draw_reset();
