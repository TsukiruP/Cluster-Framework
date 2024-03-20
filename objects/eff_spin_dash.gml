#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// React to Player

event_inherited();

// Update depth:
depth = player_handle.depth - 1;

// Update timeline:
if (floor(player_handle.spin_dash_charge) > 0) {
    if (timeline_index != tml_spin_charge) timeline_set(tml_spin_charge);
} else {
    if (timeline_index != tml_spin_dash) timeline_set(tml_spin_dash);
}

// Destroy:
if (player_handle.action_state != ACTION_SPIN_DASH) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Spin Dash Dust

if (sprite_exists(sprite_index)) draw_sprite(sprite_index, image_index, x, y + floor(player_handle.main_height));
