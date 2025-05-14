#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spike Initialization

event_inherited();
angle = pick(sign(image_yscale) == -1, ANGLE_UP, ANGLE_DOWN);
hitbox_set_hurtbox(16, 8, 15, 15);
