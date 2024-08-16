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

var player_rotation, sine, csine, draw_x, draw_y;

player_rotation = player_handle.mask_rotation;
sine            = dsin(player_handle.mask_rotation);
csine           = dcos(player_handle.mask_rotation);

draw_x = x - sine * 16;
draw_y = y - csine * 16;

if (sprite_exists(sprite_index)) {
    draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, 1, 1, player_rotation, c_white, 1);
}
