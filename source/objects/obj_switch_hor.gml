#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();
angle = pick(sign(image_xscale) == -1, ANGLE_RIGHT, ANGLE_LEFT);
switch_index[0] = seq_switch_hor_inactive;
switch_index[1] = seq_switch_hor_active;
hitbox_set_hurtbox(7, 9, 6, 9);
sequence_init(seq_switch_hor_inactive);
