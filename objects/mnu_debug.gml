#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu Initialization

menu_alarm = 0;
menu_index = debug_menu_home;
menu_cursor = 0;
menu_option = 0;
menu_scroll = 0;
menu_x_direction = 0;
menu_list = ds_list_create();
debug_set_menu(debug_menu_home);

transition_room = room_first;
transition_preview = TRANS_FADE;

rename_allow = false;
rename_backup = "";

history_stack = ds_stack_create();

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

if (visible != !instance_exists(mnu_save)) visible = !instance_exists(mnu_save);

if (game_ispaused(ctrl_text) || instance_exists(ctrl_transition) || instance_exists(mnu_save) || rename_allow)
{
    if (menu_alarm == 0) menu_alarm = 2;
    exit;
}

if (menu_alarm > 0)
{
    menu_alarm -= 1;
    exit;
}

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

if (input_get_check(INP_CONFIRM, CHECK_PRESSED))
{
    var option_confirm; option_confirm = script_execute(ds_list_find_value(menu_list, menu_option), 2);

    if (!is_undefined(option_confirm)) audio_play_sfx(pick(option_confirm, "snd_menu_cannot", "snd_menu_confirm"), true);
}

var menu_left; menu_left = (input_get_check(INP_LEFT, CHECK_PRESSED) || input_get_time(INP_LEFT, 30));
var menu_right; menu_right = (input_get_check(INP_RIGHT, CHECK_PRESSED) || input_get_time(INP_RIGHT, 30));

menu_x_direction = menu_right - menu_left;

if (menu_x_direction != 0)
{
    var option_update; option_update = script_execute(ds_list_find_value(menu_list, menu_option), 3);

    if (!is_undefined(option_update) && sfx_alarm == 0)
    {
        sfx_alarm = 8;
        audio_play_sfx(pick(option_update, "snd_menu_cannot", "snd_menu_move"), true);
    }
}

if (input_get_check(INP_CANCEL, CHECK_PRESSED))
{
    if (debug_set_previous()) audio_play_sfx("snd_menu_close", true);
}
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
        game_set_save("name", rename_backup);
        rename_allow = false;
        rename_backup = "";
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
draw_rect(view_xview[view_current] + screen_get_width() / 2 - 81, view_yview[view_current] + screen_get_height() / 2 - 52, 164, 78, game_get_interface_color(), game_get_config("interface_alpha"))

// Text:
for ({var i; i = 0}; i < min(ds_list_size(menu_list), 4); i += 1)
{
    var option_index; option_index = i + menu_scroll;
    var option_text; option_text = script_execute(ds_list_find_value(menu_list, option_index), 0);
    var option_value; option_value = script_execute(ds_list_find_value(menu_list, option_index), 1);
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

draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Rename

if (!rename_allow) exit;

var font_height; font_height = font_get_height(global.font_system);

// Box:
draw_rect(0, (screen_get_height() / 2) - (font_height / 2) - 2, screen_get_width(), font_height + 6, game_get_interface_color(), game_get_config("interface_alpha"));

// Rename:
draw_set_font(global.font_system);
draw_set1(c_white, 1);
draw_set2(fa_center, fa_middle);
draw_text(screen_get_width() / 2, screen_get_height() / 2, rename_backup);
draw_reset();
