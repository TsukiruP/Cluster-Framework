#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

if (input_get_check(INP_ALT, CHECK_HELD) && input_get_check(INP_SELECT, CHECK_PRESSED)) game_set_debug(!game_get_debug());
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
