#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Index

if (floor(player_id.spin_dash_charge) > 0)
{
    if (sequence_index != sequence_spin_charge) sequence_set(sequence_spin_charge);
}
else
{
    if (sequence_index != sequence_spin_dash) sequence_set(sequence_spin_dash);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

if (player_id.state_current != player_state_spin_dash) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Dust

var player_rotation, sine, csine, draw_x, draw_y;

player_rotation = player_id.mask_rotation;
sine = dsin(player_rotation);
csine = dcos(player_rotation);

draw_x = x + (sine * floor(player_id.y_radius));
draw_y = y + (csine * floor(player_id.y_radius));

if (sprite_exists(sprite_index)) draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, player_id.image_xscale, 1, player_rotation, c_white, 1);
