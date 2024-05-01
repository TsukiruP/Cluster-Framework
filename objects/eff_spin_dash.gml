#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// React to Player

// Update direction:
image_xscale = player_handle.animation_direction;

// Update depth:
depth = player_handle.depth - 1;

// Update timeline:
if (floor(player_handle.spin_dash_charge) > 0) {
    if (ctl_index != ctl_spin_charge) timeline_set(ctl_spin_charge);
} else {
    if (ctl_index != ctl_spin_dash) timeline_set(ctl_spin_dash);
}

// Animate:
event_inherited();

// Destroy:
if (player_handle.action_state != ACTION_SPIN_DASH) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Spin Dash Dust

if (sprite_exists(sprite_index)) draw_sprite_ext(sprite_index, image_index, x + (image_xscale < 0), y + floor(player_handle.main_height), image_xscale, 1, 0, c_white, 1);
