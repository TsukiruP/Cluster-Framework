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
jawz_range = 128;
jawz_speed = 6;
jawz_alarm = 480;
player_inst = noone;
sequence_init(seq_jawz_move);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();

if (sequence_index == seq_jawz_move)
{
    x += sequence_speed * image_xscale;
    if (x < xstart - border_left || x > xstart + border_right) sequence_set(seq_jawz_move_turn);
    else
    {
        player_inst = enemy_get_player_front(jawz_range);

        if (instance_exists(player_inst))
        {
            if (player_inst.underwater) sequence_set(seq_jawz_charge);
        }
    }
}
else if (sequence_index == seq_jawz_chase)
{
    if (instance_exists(player_inst))
    {
        var jawz_angle; jawz_angle = direction_to_object(player_inst);

        if (sign(image_xscale) == -1) jawz_angle = angle_wrap(jawz_angle + 180);
        image_angle = approach_angle(image_angle, jawz_angle, jawz_speed - 2);
    }

    x += dcos(image_angle) * jawz_speed * image_xscale;
    y -= dsin(image_angle) * jawz_speed * image_xscale;
    jawz_alarm = roundto_step(jawz_alarm, -sequence_speed);
    if (jawz_alarm == 0 || position_meeting(x, y, par_solid) || !position_meeting(x, y, obj_water_mask)) enemy_destroy();
}

sequence_execute();
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
draw_enemy_border();

if (game_get_debug_visible() && sequence_index != seq_jawz_chase)
{
    var x_int; x_int = floor(x);
    var y_int; y_int = floor(y);

    draw_line(x_int, y_int, x_int + lengthdir_x(jawz_range * image_xscale, image_angle + 45), y_int + lengthdir_y(jawz_range * image_xscale, image_angle + 45));
    draw_line(x_int, y_int, x_int + lengthdir_x(jawz_range * image_xscale, image_angle - 45), y_int + lengthdir_y(jawz_range * image_xscale, image_angle - 45));
}
