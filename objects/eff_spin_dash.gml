#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Index

if (floor(player_handle.spin_dash_charge) > 0) {
    if (ctl_index != ctl_spin_charge) {
        timeline_set(ctl_spin_charge);
    }
} else {
    if (ctl_index != ctl_spin_dash) {
        timeline_set(ctl_spin_dash);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

event_inherited();

// Update depth:
depth = player_handle.depth;

// Update direction:
image_xscale = player_handle.image_xscale;

// Update angle:
image_angle = player_handle.mask_rotation;

// Destroy:
if (player_handle.state_current != player_state_spin_dash) {
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Spin Dash Dust

var player_rotation, sine, csine;

player_rotation = player_handle.mask_rotation;
sine            = dsin(player_handle.mask_rotation);
csine           = dcos(player_handle.mask_rotation);

if (sprite_exists(sprite_index)) {
    draw_sprite_ext(sprite_index, image_index, x + sine * floor(player_handle.y_radius), y + csine * floor(player_handle.y_radius), image_xscale, 1, image_angle, c_white, 1);
}
