#define 0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start Animation

sprite_index   = spr_sonic_spin_charge;
image_index    = 0;
timeline_loop  = false;
timeline_speed = 1;

// Set collision:
main_width  = 6;
main_height = 9;
roll_offset = 5;

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
#define 8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Timeline

animation_target = "spin_dash";
