#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spike Initialization

event_inherited();
angle = pick(sign(image_xscale) == -1, ANGLE_RIGHT, ANGLE_LEFT);
hitbox_set_hurtbox(16, 16, 8, 15);
