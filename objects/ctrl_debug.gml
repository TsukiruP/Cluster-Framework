#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debug Initialization

info_hide = false;
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

if (instance_exists(stage_get_player(0)) && keyboard_check_pressed(vk_f1)) other.info_hide = !other.info_hide;
if (keyboard_check_pressed(vk_f2)) room_speed = pick(room_speed == 60, 60, 30);

if (keyboard_check_pressed(vk_f5))
{
    if (game_get_save_index() != -1) game_write_save(game_get_save_index());
}

if (keyboard_check_pressed(vk_f6))
{
    if (game_get_save_index() == -1) game_set_save_index(0);
    game_read_save(game_get_save_index());
}

if (!info_hide)
{
    var menu_left; menu_left = keyboard_check_pressed(vk_pageup);
    var menu_right; menu_right = keyboard_check_pressed(vk_pagedown);
    var menu_direction; menu_direction = menu_right - menu_left;

    info_index += menu_direction;
    info_index = wrap(info_index, 0, 2);
}

with (obj_player)
{
    if (keyboard_check_pressed(vk_numpad2)) gravity_direction = 0;
    if (keyboard_check_pressed(vk_numpad4)) gravity_direction = 270;
    if (keyboard_check_pressed(vk_numpad6)) gravity_direction = 90;
    if (keyboard_check_pressed(vk_numpad8)) gravity_direction = 180;
    if (keyboard_check_pressed(ord('1'))) player_set_status(STATUS_SHIELD, wrap(status_shield + 1, SHIELD_NONE, SHIELD_LIGHTNING));
    if (keyboard_check_pressed(ord('2'))) player_set_status(STATUS_INVIN, INVIN_BUFF);
    if (keyboard_check_pressed(ord('3'))) player_set_status(STATUS_SPEED, SPEED_UP);
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
    var x_int; x_int = floor(x);
    var y_int; y_int = floor(y);

    // Bounding box:
    if (mask_direction mod 180 != 0) draw_rectangle_color(x_int - y_radius, y_int - x_radius, x_int + y_radius, y_int + x_radius, c_orange, c_orange, c_orange, c_orange, true);
    else draw_rectangle_color(x_int - x_radius, y_int - y_radius, x_int + x_radius, y_int + y_radius, c_orange, c_orange, c_orange, c_orange, true);

    // Wall radius:
    var sine; sine = dsin(mask_direction);
    var csine; csine = dcos(mask_direction);

    draw_line_color(x_int - (csine * wall_radius), y_int + (sine * wall_radius), x_int + (csine * wall_radius), y_int - (sine * wall_radius), c_white, c_white);

    // Hitboxes:
    draw_hitbox(hurtbox_left, hurtbox_top, hurtbox_right, hurtbox_bottom, hurtbox_offset_x, hurtbox_offset_y, mask_direction, c_maroon);
    draw_hitbox(attackbox_left, attackbox_top, attackbox_right, attackbox_bottom, attackbox_offset_x, attackbox_offset_y, mask_direction, c_green);

    // Homing range:
    if (game_save_get_skill(character_index, "homing") && character_index == CHAR_SONIC)
    {
        draw_line(x_int, y_int, x_int + lengthdir_x(homing_range * image_xscale, mask_direction + 45), y_int + lengthdir_y(homing_range * image_xscale, mask_direction + 45));
        draw_line(x_int, y_int, x_int + lengthdir_x(homing_range * image_xscale, mask_direction - 45), y_int + lengthdir_y(homing_range * image_xscale, mask_direction - 45));
        if (instance_exists(homing_inst)) draw_line(x_int, y_int, floor(homing_inst.x), floor(homing_inst.y));
    }

    draw_reset();
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Info

if (!game_get_debug() || info_hide) exit;

with (stage_get_player(0))
{
    var font_height; font_height = font_get_height(global.font_debug);
    var info_string; info_string = "";
    var info_x; info_x = view_xview[view_current] + screen_get_width() - 10;
    var info_y; info_y = view_yview[view_current] + 10;

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
            "Animation Prev: " + animation_previous + "#" +
            "Animation Moment: " + string(animation_moment) + "#" +
            "Animation Skip: " + string_bool(animation_skip) + "#" +
            "Animation Trigger: " + string_bool(animation_trigger) + "#" +
            "Animation Time: " + string(animation_time) + "#" +
            "Sequence: " + script_name(sequence_index) + "#" +
            "Sequence Speed: " + string(sequence_speed);
            break;

        default:
            info_string =
            "X Speed: " + string(x_speed) + "#" +
            "Y Speed: " + string(y_speed) + "#" +
            "State: " + script_name(state_current) + "#" +
            "State Prev: " + script_name(state_previous) + "#" +
            "Gravity: " + string(gravity_direction) + "#" +
            "Angle: " + string(angle) + "#" +
            "Relative Angle: " + string(relative_angle) + "#" +
            "Mask Direction: " + string(mask_direction) + "#" +
            "Input Allow: " + string_bool(input_allow) + "#" +
            "Input Lock: " + string(input_lock_alarm);
    }

    draw_set2(fa_right, fa_top);
    draw_text(info_x, info_y, info_string);
    draw_reset();
}
