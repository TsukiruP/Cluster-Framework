#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

var player_animation; player_animation = player_inst.animation_current;
var player_moment; player_moment = player_inst.sequence_moment;
var player_tag; player_tag = player_inst.state_current == player_state_interlink;

if ((player_animation == "roll" || (player_animation == "spin_flight" && player_moment > 6)) && !player_tag)
{
    if (sequence_index != seq_tails) sequence_set(seq_tails);
}
else if (sequence_index != noone)
{
    sprite_index = -1;
    image_angle = player_inst.image_angle;
    sequence_set(noone);
}

event_inherited();
if (player_inst.character_index != CHAR_MILES) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Tails

if (sequence_index != noone)
{
    var player_xscale; player_xscale = player_inst.image_xscale;
    var player_alpha; player_alpha = player_inst.image_alpha;
    var player_state; player_state = player_inst.state_current;
    var player_roll; player_roll = player_inst.state_current == player_state_roll;

    image_xscale = player_xscale;
    image_alpha = player_alpha;

    if (!player_inst.on_ground) image_angle = angle_wrap(point_direction(player_inst.xprevious, player_inst.yprevious, player_inst.x, player_inst.y) - 90);
    else
    {
        image_angle = angle_wrap(player_inst.angle - 90);
        if (sign(image_xscale) == -1) image_angle = angle_wrap(image_angle + 180);
    }
}

draw_self_floored();
