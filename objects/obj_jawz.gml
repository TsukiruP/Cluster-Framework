#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Jawz Initialization

event_inherited();
border_left = 0;
border_right = 0;
chase_range = 128;
chase_speed = 6;
chase_alarm = 480;
player_inst = noone;
hitbox_set_hurtbox(24, 10, 30, 14);
hitbox_set_attackbox(22, 4, 28, 8);
sequence_init(sequence_jawz_move);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

event_inherited();

sequence_speed = game_get_speed();

if (sequence_index == sequence_jawz_move)
{
    x += sequence_speed * image_xscale;
    if (x < xstart - border_left || x > xstart + border_right) sequence_set(sequence_jawz_move_turn);
    else
    {
        player_inst = instance_nearest(x, y, obj_player);

        if (instance_exists(player_inst))
        {
            if (player_inst.underwater)
            {
                var chase_angle; chase_angle = image_angle;

                if (sign(image_xscale) == -1) chase_angle = angle_wrap(chase_angle + 180);
                if (distance_to_object(player_inst) < chase_range && abs(angle_difference(chase_angle, direction_to_object(player_inst))) < 45) sequence_set(sequence_jawz_charge);
            }
        }
    }
}
else if (sequence_index == sequence_jawz_chase)
{
    if (instance_exists(player_inst))
    {
        var chase_angle; chase_angle = direction_to_object(player_inst);

        if (sign(image_xscale) == -1) chase_angle = angle_wrap(chase_angle - 180);
        image_angle = approach_angle(image_angle, chase_angle, chase_speed - 2);
    }

    x += chase_speed * image_xscale * dcos(image_angle);
    y += chase_speed * dsin(image_angle);

    chase_alarm -= sequence_speed;
    chase_alarm = floorto(chase_alarm, pick(sequence_speed > 0, 1, sequence_speed));

    if (chase_alarm == 0 || collision_point(x, y, par_solid, false, false))
    {
        effect_create(x, y, sequence_explosion_enemy, -depth);
        instance_destroy();
    }
}

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field border_left: number
//field border_right: number

/*preview
draw_set_color(c_red);
draw_rectangle(floor(x) - Field("border_left", 0), floor(y) - 10, floor(x) + Field("border_right", 0), floor(y) + 14, true);
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Jawz

draw_self_floored();

if (game_get_debug() && sequence_index != sequence_jawz_chase)
{
    var x_int; x_int = floor(x);
    var y_int; y_int = floor(y);

    draw_line(x_int, y_int, x_int + lengthdir_x(chase_range * image_xscale, image_angle + 45), y_int + lengthdir_y(chase_range * image_xscale, image_angle + 45));
    draw_line(x_int, y_int, x_int + lengthdir_x(chase_range * image_xscale, image_angle - 45), y_int + lengthdir_y(chase_range * image_xscale, image_angle - 45));

    draw_set_color(c_red);
    draw_rectangle(floor(xstart) - border_left, floor(ystart) - 10, floor(xstart) + border_right, floor(ystart) + 14, true);
    draw_reset();
}
