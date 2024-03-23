#define 0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start Animation

sprite_index  = spr_sonic_crouch;
image_index   = 1;
timeline_loop = false;

// Set collision:
main_width  = 6;
main_height = 14;
roll_offset = 0;

// Set hurtbox:
hurtbox_width    = 6;
hurtbox_height   = 10.5;
hurtbox_offset_x = 0;
hurtbox_offset_y = 5;

// Set hitbox:
hitbox_width    = 0;
hitbox_height   = 0;
hitbox_offset_x = 0;
hitbox_offset_y = 0;
#define 1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Frame

image_index = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Animation

player_set_animation("stand");
