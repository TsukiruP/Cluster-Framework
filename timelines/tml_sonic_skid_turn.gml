#define 0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start Animation

sprite_index   = spr_sonic_skid_turn;
image_index    = 0;
timeline_loop  = false;
timeline_speed = 1;

// Set collision:
main_width  = 6;
main_height = 14;
roll_offset = 0;

// Set hitbox:
hitbox_width    = 0;
hitbox_height   = 0;
hitbox_offset_x = 0;
hitbox_offset_y = 0;

// Animation direction:
animation_direction *= -1;
#define 2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Frame

image_index = 1;
#define 4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Frame

image_index = 2;
#define 6
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Frame

image_index = 3;
#define 9
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Finish Animation

animation_finished = true;
