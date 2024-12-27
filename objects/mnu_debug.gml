#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu Initialization

// Menu variables:
menu_x_direction = 0;
menu_index = debug_list_home;
menu_cursor = 0;
menu_option = 0;
menu_scroll = 0;

menu_list = ds_list_create();
debug_menu_set_list(menu_index);

menu_room = room;

// History stack:
history_stack = ds_stack_create();
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

var i;

ds_list_destroy(menu_list);

for (i = 0; i < ds_stack_size(history_stack); i += 1)
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
/// Menu

// Reset x direction:
menu_x_direction = 0;

// Exit if text is active:
if (game_ispaused(mgr_text) || instance_exists(mgr_transition))
{
    exit;
}

var menu_left, menu_right, menu_up, menu_down, menu_y_direction, menu_size, option_confirm, option_update;

// Menu direction:
menu_left = input_get_check(INP_LEFT, CHECK_PRESSED);
menu_right = input_get_check(INP_RIGHT, CHECK_PRESSED);
menu_x_direction = menu_right - menu_left;

menu_up = input_get_check(INP_UP, CHECK_PRESSED);
menu_down = input_get_check(INP_DOWN, CHECK_PRESSED);
menu_y_direction = menu_down - menu_up;

// Menu option:
menu_option += menu_y_direction;
menu_size = ds_list_size(menu_list) - 1;

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
    if ((menu_cursor == 0 && sign(menu_y_direction) == -1) || (menu_cursor == 3 && sign(menu_y_direction) == 1))
    {
        menu_scroll += menu_y_direction;
    }
    else
    {
        menu_cursor += menu_y_direction;
    }
}

// Play sound:
if (menu_y_direction != 0)
{
    audio_sfx_play("snd_menu_move", true);
}

// Confirm:
if (input_get_check(INP_CONFIRM, CHECK_PRESSED))
{
    option_confirm = script_execute(ds_list_find_value(menu_list, menu_option), 2);

    // Play sound:
    if (!is_undefined(option_confirm))
    {
        audio_sfx_play(pick(option_confirm, "snd_menu_cannot", "snd_menu_confirm"), true);
    }
}

// Update:
if (menu_x_direction != 0)
{
    option_update = script_execute(ds_list_find_value(menu_list, menu_option), 3);

    // Play sound:
    if (!is_undefined(option_update))
    {
        audio_sfx_play(pick(option_update, "snd_menu_cannot", "snd_menu_move"), true);
    }
}

// Cancel:
if (input_get_check(INP_CANCEL, CHECK_PRESSED))
{
    debug_menu_set_previous();

    // Play sound:
    audio_sfx_play("snd_menu_close", true);
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu

var i;

// Box:
draw_set1(game_get_interface_color(), game_setting_get("interface_alpha"));
draw_rectangle(view_xview[view_current] + screen_get_width() / 2 - 81, view_yview[view_current] + screen_get_height() / 2 - 52, view_xview[view_current] + screen_get_width() / 2 + 82, view_yview[view_current] + screen_get_height() / 2 + 25, false);

// Text:
for (i = 0; i < min(ds_list_size(menu_list), 4); i += 1)
{
    var option_id, option_text, option_value, option_x, option_y;

    option_id = i + menu_scroll;
    option_text = script_execute(ds_list_find_value(menu_list, option_id), 0);
    option_value = script_execute(ds_list_find_value(menu_list, option_id), 1);
    option_x = view_xview[view_current] + screen_get_width() / 2;
    option_y = view_yview[view_current] + screen_get_height() / 2 - 41 + mgr_text.font_height * i;

    // Font:
    draw_set_font(global.font_system);
    draw_set1(c_gray, 1);

    if (menu_option == option_id)
    {
        draw_set_color(c_white);
    }

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

// Reset:
draw_reset();
#define KeyPress_32
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
text_body_set(string_input(INP_CONFIRM) + " Confirm " + string_input(INP_CANCEL) + "Cancel");
