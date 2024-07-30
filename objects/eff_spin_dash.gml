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

// Destroy:
if (player_handle.action_current != player_action_spin_dash) {
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Spin Dash Dust

if (sprite_exists(sprite_index)) {
    draw_sprite_ext(sprite_index, image_index, x + (image_xscale < 0), y + floor(player_handle.main_bottom), image_xscale, 1, 0, c_white, 1);
}
