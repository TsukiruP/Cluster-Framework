#define 0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start Animation

sprite_index   = spr_sonic_look;
image_index    = 1;
timeline_loop  = false;
timeline_speed = 1;

// Set collision:
main_width  = 6;
main_height = 14;
roll_offset = 0;

// Set hurtbox:
hurtbox_width    = 6;
hurtbox_height   = 14.5;
hurtbox_offset_x = 0;
hurtbox_offset_y = 1;

// Set hitbox:
hitbox_width    = 0;
hitbox_height   = 0;
hitbox_offset_x = 0;
hitbox_offset_y = 0;
#define 2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Frame

image_index = 0;
#define 3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Animation

player_set_animation("stand");
