#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debug Initialization

info_id = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

if (input_get_check(INP_ALT, CHECK_HELD) && input_get_check(INP_SELECT, CHECK_PRESSED)) game_set_debug(!game_get_debug());

if (!game_get_debug()) exit;

with (obj_player)
{
    switch (keyboard_lastkey)
    {
        case vk_numpad2:
            gravity_direction = 0;
            break;

        case vk_numpad4:
            gravity_direction = 270;
            break;

        case vk_numpad6:
            gravity_direction = 90;
            break;

        case vk_numpad8:
            gravity_direction = 180;
            break;
    }
}

var info_char;

info_char = string_digits(keyboard_lastchar);
if (string_length(info_char))
{
    if (keyboard_lastkey == vk_numpad2 || keyboard_lastkey == vk_numpad4 || keyboard_lastkey == vk_numpad6 || keyboard_lastkey == vk_numpad8) exit;
    info_id = real(info_char) - 1;
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
    if (game_save_get_skill(character_id, "homing") && character_id == CHAR_SONIC)
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

    switch (other.info_id)
    {
        case 1:
            info_string =
            "Input X: " + string(input_x_direction) + "#" +
            "Input Y: " + string(input_y_direction) + "##" +
            "Input Allow: " + string_bool(input_allow) + "#" +
            "Input Lock: " + string(input_lock_alarm);
            break;

        case 2:
            info_string =
            "Animation: " + string(input_x_direction);
            break;

        case 3:
            info_string = "Character: " + pick(character_id, "Sonic", "Miles", "Knuckles", "Amy", "Classic") + "#";

            switch (character_id)
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

        default:
            info_string =
            "Gravity: " + string(gravity_direction) + "#" +
            "X: " + string(floor(x)) + "#" +
            "Y: " + string(floor(y)) + "#" +
            "X Prev: " + string(floor(xprevious)) + "#" +
            "Y Prev: " + string(floor(yprevious)) + "##" +
            "X Speed: " + string(x_speed) + "#" +
            "Y Speed: " + string(y_speed) + "##" +
            "State: " + script_name(state_current) + "#" +
            "State Prev: " + script_name(state_previous) + "##" +
            "Angle: " + string(angle) + "#" +
            "Relative Angle: " + string(relative_angle) + "#" +
            "Mask Rotation: " + string(mask_rotation);
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

if (game_get_save_id() != -1) game_write_save(game_get_save_id());
#define KeyPress_117
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Read Save

if (game_get_save_id() == -1) game_set_save_id(0);
game_read_save(game_get_save_id());
