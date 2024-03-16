#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Prop Initialization

prop_width    = 0;
prop_height   = 0;
prop_offset_x = 0;
prop_offset_y = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Size

// Exit if not in debug mode:
if (debug_mode == false) exit;

draw_rectangle(x - prop_width, y - prop_height, x + prop_width, y + prop_height, true);
