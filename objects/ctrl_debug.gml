#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debug Initialization

info_index = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

if (input_get_check(INP_ALT, CHECK_HELD) && input_get_check(INP_SELECT, CHECK_PRESSED)) game_set_debug(!game_get_debug());

if (!game_get_debug()) exit;

var menu_left, menu_right, menu_direction;

menu_left = keyboard_check_pressed(vk_pageup);
menu_right = keyboard_check_pressed(vk_pagedown);
menu_direction = menu_right - menu_left;

info_index += menu_direction;
info_index = wrap(info_index, 0, 2);

with (obj_player)
{
    if (keyboard_check_pressed(vk_numpad2)) gravity_direction = 0;
    if (keyboard_check_pressed(vk_numpad4)) gravity_direction = 270;
    if (keyboard_check_pressed(vk_numpad6)) gravity_direction = 90;
    if (keyboard_check_pressed(vk_numpad8)) gravity_direction = 180;
    if (keyboard_check_pressed(ord('1'))) player_set_status(STATUS_SHIELD, SHIELD_NONE);
    if (keyboard_check_pressed(ord('2'))) player_set_status(STATUS_SHIELD, SHIELD_BASIC);
    if (keyboard_check_pressed(ord('3'))) player_set_status(STATUS_SHIELD, SHIELD_MAGNETIC);
    if (keyboard_check_pressed(ord('4'))) player_set_status(STATUS_SHIELD, SHIELD_BUBBLE);
    if (keyboard_check_pressed(ord('5'))) player_set_status(STATUS_SHIELD, SHIELD_FIRE);
    if (keyboard_check_pressed(ord('6'))) player_set_status(STATUS_SHIELD, SHIELD_LIGHTNING);
    if (keyboard_check_pressed(ord('7'))) player_set_status(STATUS_INVIN, INVIN_BUFF);
    if (keyboard_check_pressed(ord('8'))) player_set_status(STATUS_SPEED, SPEED_UP);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Stage Objects

if (!game_get_debug()) exit;

with (par_culled)
{
    // Hitboxes:
    draw_hitbox(hurtbox_left, hurtbox_top, hurtbox_right, hurtbox_bottom, hurtbox_offset_x, hurtbox_offset_y, gravity_direction, c_maroon);
    draw_hitbox(attackbox_left, attackbox_top, attackbox_right, attackbox_bottom, attackbox_offset_x, attackbox_offset_y, gravity_direction, c_green);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Player

if (!game_get_debug()) exit;

with (obj_player)
{
    var x_int, y_int, sine, csine;

    x_int = floor(x);
    y_int = floor(y);

    // Bounding box:
    if (mask_rotation mod 180 != 0) draw_rectangle_color(x_int - y_radius, y_int - x_radius, x_int + y_radius, y_int + x_radius, c_orange, c_orange, c_orange, c_orange, true);
    else draw_rectangle_color(x_int - x_radius, y_int - y_radius, x_int + x_radius, y_int + y_radius, c_orange, c_orange, c_orange, c_orange, true);

    // Wall radius:
    sine = dsin(mask_rotation);
    csine = dcos(mask_rotation);

    draw_line_color(x_int - (csine * wall_radius), y_int + (sine * wall_radius), x_int + (csine * wall_radius), y_int - (sine * wall_radius), c_white, c_white);

    // Hitboxes:
    draw_hitbox(hurtbox_left, hurtbox_top, hurtbox_right, hurtbox_bottom, hurtbox_offset_x, hurtbox_offset_y, mask_rotation, c_maroon);
    draw_hitbox(attackbox_left, attackbox_top, attackbox_right, attackbox_bottom, attackbox_offset_x, attackbox_offset_y, mask_rotation, c_green);

    // Homing range:
    if (game_save_get_skill(character_index, "homing") && character_index == CHAR_SONIC)
    {
        draw_line(x_int, y_int, x_int + lengthdir_x(homing_range * image_xscale, mask_rotation + 45), y_int + lengthdir_y(homing_range * image_xscale, mask_rotation + 45));
        draw_line(x_int, y_int, x_int + lengthdir_x(homing_range * image_xscale, mask_rotation - 45), y_int + lengthdir_y(homing_range * image_xscale, mask_rotation - 45));
        if (instance_exists(homing_handle)) draw_line(x_int, y_int, floor(homing_handle.x), floor(homing_handle.y));
    }

    draw_reset();
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Info

if (!game_get_debug()) exit;

with (stage_get_player(0))
{
    var info_string, info_x, info_y;

    draw_set_font(global.font_system);
    info_string = "";
    info_x = view_xview[view_current] + 10;
    info_y = view_yview[view_current] + screen_get_height() / 2;

    switch (other.info_index)
    {
        case 1:
            info_string = "Character: " + pick(character_index, "Sonic", "Miles", "Knuckles", "Amy", "Classic") + "#";

            switch (character_index)
            {
                case CHAR_SONIC:
                    info_string +=
                    "Air Dash Allow: " + string_bool(air_dash_allow) + "#" +
                    "Homing Alarm: " + string(homing_alarm) + "#" +
                    "Bound Count: " + string(bound_count) + "#" +
                    "Peel Out: " + string_bool(peel_out);
                    break;

                case CHAR_CLASSIC:
                    info_string +=
                    "Clock Up State: " + string(clock_up_state) + "#" +
                    "Clock Up Alarm: " + string(clock_up_alarm);
                    break;
            }
            break;

        case 2:
            info_string =
            "Animation: " + animation_current + "#" +
            "Animation Prev: " + animation_previous + "##" +
            "Animation Variant: " + string(animation_variant) + "#" +
            "Animation Moment: " + string(animation_moment) + "#" +
            "Animation Skip: " + string_bool(animation_skip) + "#" +
            "Animation Trigger: " + string_bool(animation_trigger) + "#" +
            "Animation Time: " + string(animation_time) + "#" +
            "Sequence: " + script_name(sequence_index) + "#" +
            "Sequence Speed: " + string(sequence_speed);
            break;

        default:
            info_string =
            "X: " + string(floor(x)) + "#" +
            "Y: " + string(floor(y)) + "#" +
            "X Prev: " + string(floor(xprevious)) + "#" +
            "Y Prev: " + string(floor(yprevious)) + "##" +
            "X Speed: " + string(x_speed) + "#" +
            "Y Speed: " + string(y_speed) + "##" +
            "State: " + script_name(state_current) + "#" +
            "State Prev: " + script_name(state_previous) + "##" +
            "Gravity: " + string(gravity_direction) + "#" +
            "Angle: " + string(angle) + "#" +
            "Relative Angle: " + string(relative_angle) + "#" +
            "Mask Rotation: " + string(mask_rotation) + "##" +
            "Input Allow: " + string_bool(input_allow) + "#" +
            "Input Lock: " + string(input_lock_alarm);
    }

    // Box:
    draw_rect(info_x - 5, info_y - string_height(info_string) / 2 - 5, ceil((string_width(info_string) + 5) / 70) * 70 + 5, string_height(info_string) + 10, game_get_interface_color(), game_get_config("interface_alpha"));

    // Info:
    draw_set2(fa_left, fa_center);
    draw_text(info_x, info_y, info_string);
    draw_reset();
}
#define KeyPress_116
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Write Save

if (game_get_save_index() != -1) game_write_save(game_get_save_index());
#define KeyPress_117
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Read Save

if (game_get_save_index() == -1) game_set_save_index(0);
game_read_save(game_get_save_index());
