#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu Initialization

// Menu variables:
menu_index = debug_list_home;
menu_cursor = 0;
menu_option = 0;
menu_scroll = 0;

menu_list = ds_list_create();
debug_menu_set_list(menu_index);

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

// Exit if text is active:
if (game_ispaused(mgr_text) || instance_exists(mgr_transition))
{
    exit;
}

var menu_left, menu_right, menu_x_direction, menu_up, menu_down, menu_y_direction, menu_size;

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

// Confirm:
if (input_get_check(INP_CONFIRM, CHECK_PRESSED))
{
    script_execute(ds_list_find_value(menu_list, menu_option), 2);
}

// Update:
if (menu_x_direction != 0)
{
    if (!is_undefined(script_execute(ds_list_find_value(menu_list, menu_option), 3)))
    {
        script_execute(ds_list_find_value(menu_list, menu_option), 4, menu_x_direction);
        audio_sfx_play("snd_jump");
    }
}

// Cancel:
if (input_get_check(INP_CANCEL, CHECK_PRESSED))
{
    debug_menu_set_previous();
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
draw_rectangle(screen_get_width() / 2 - 81, screen_get_height() / 2 - 52, screen_get_width() / 2 + 82, screen_get_height() / 2 + 25, false);

// Viewport:
d3d_set_viewport(screen_get_width() / 2 - 80, screen_get_height() / 2 - 41, 160, 57);

// Font:
draw_set_font(global.font_system);
draw_set_alpha(1);

// Text:
for (i = 0; i < ds_list_size(menu_list); i += 1)
{
    var option_text, option_value, option_x, option_y;

    option_text = script_execute(ds_list_find_value(menu_list, i), 0);
    option_value = script_execute(ds_list_find_value(menu_list, i), 1);
    option_y = -(menu_scroll * mgr_text.font_height) + mgr_text.font_height * i;

    draw_set_color(c_gray);

    if (menu_option == i)
    {
        draw_set_color(c_white);
    }

    if (!is_undefined(option_value))
    {
        draw_set_halign(fa_right);
        draw_text(150, option_y, string(option_value));

        option_x = 10;
        draw_set_halign(fa_left);
    }
    else
    {
        option_x = 80;
        draw_set_halign(fa_center);
    }

    draw_text(option_x, option_y, option_text);
}

// Reset:
draw_reset();
d3d_set_viewport(0, 0, screen_get_width(), screen_get_height());
