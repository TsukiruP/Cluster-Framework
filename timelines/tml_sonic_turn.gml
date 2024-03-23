#define 0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start Animation

sprite_index  = spr_sonic_turn;
image_index   = 0;
timeline_loop = false;

// Set collision:
main_width  = 6;
main_height = 14;
roll_offset = 0;

// Set hurtbox:
hurtbox_width    =  6;
hurtbox_height   =  15.5;
hurtbox_offset_x = -2;
hurtbox_offset_y =  0;

// Set hitbox:
hitbox_width    = 0;
hitbox_height   = 0;
hitbox_offset_x = 0;
hitbox_offset_y = 0;

// Set direction:
animation_direction *= -1;
#define 1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Frame

image_index      = 1;

// Set hitbox:
hurtbox_offset_x = 2;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Finish Animation

animation_finished = true;
