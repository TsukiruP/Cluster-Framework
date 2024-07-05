#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debuff Initialization

event_inherited();

// Set index:
timeline_set(ctl_debuff);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

event_inherited();

// Update depth:
depth = player_handle.depth;

// Destroy:
if (player_handle.status_speed != SPEED_DOWN && player_handle.status_panic == false) {
    player_handle.status_handle = noone;
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Debuff

if (sprite_exists(sprite_index)) {
    draw_sprite_ext(sprite_index, image_index, x, y - 16, 1, 1, 0, c_white, 1);
}
