#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Culled Initialization

depth = 10;
image_speed = 0;
gravity_direction = 0;
hurtbox_set();
hitbox_set();
collision = true;
reaction_index = -1;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Collision

if (!game_get_debug()) exit;

draw_collision(hurtbox_left, hurtbox_top, hurtbox_right, hurtbox_bottom, hurtbox_offset_x, hurtbox_offset_y, image_xscale, gravity_direction, c_maroon);
draw_collision(hitbox_left, hitbox_top, hitbox_right, hitbox_bottom, hitbox_offset_x, hitbox_offset_y, image_xscale, gravity_direction, c_green);
