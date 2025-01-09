#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Index

if (floor(player_handle.spin_dash_charge) > 0)
{
    if (ctl_index != ctl_spin_charge)
    {
        ctl_set(ctl_spin_charge);
    }
}
else
{
    if (ctl_index != ctl_spin_dash)
    {
        ctl_set(ctl_spin_dash);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

// Depth:
depth = player_handle.depth;

// Destroy:
if (player_handle.state_current != player_state_spin_dash)
{
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Dust

var player_rotation, sine, csine, draw_x, draw_y;

// Rotation:
player_rotation = player_handle.mask_rotation;
sine = dsin(player_handle.mask_rotation);
csine = dcos(player_handle.mask_rotation);

draw_x = x + sine * floor(player_handle.y_radius);
draw_y = y + csine * floor(player_handle.y_radius);

if (sprite_exists(sprite_index))
{
    draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, player_handle.image_xscale, 1, player_rotation, c_white, 1);
}
