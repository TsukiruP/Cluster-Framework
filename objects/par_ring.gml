#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

// Image speed:
image_speed = 0;

// Size:
prop_width    = 8;
prop_height   = 8;
prop_offset_x = 0;
prop_offset_y = 0;

// Dropped:
dropped     = false;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

image_index = floor(global.object_time) div (8 / (1 + dropped));
