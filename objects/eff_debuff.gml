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
depth = player_handle.depth - 1;

// Update angle:
image_angle = player_handle.mode * 90;

// Destroy:
if (player_handle.status_speed != SPEED_SLOW && player_handle.status_panic == false) {
    player_handle.debuff_handle = noone;
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Debuff

var draw_x, draw_y;

draw_x = x - (16 * player_handle.x_direction);
draw_y = y - (16 * player_handle.y_direction);

if (sprite_exists(sprite_index)) {
    draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, 1, 1, image_angle, c_white, 1);
}
