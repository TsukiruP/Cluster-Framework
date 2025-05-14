#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Panel Initialization

event_inherited();
angle = pick(sign(image_yscale) == -1, ANGLE_RIGHT, ANGLE_LEFT);
hitbox_set_hurtbox(28, 0, 28, 7);
