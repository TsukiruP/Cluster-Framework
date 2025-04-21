#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();
angle = pick(sign(image_yscale) == -1, ANGLE_UP, ANGLE_DOWN);
hitbox_set_hurtbox(9, 6, 9, 7);
sequence_init(seq_switch_vert_inactive);
