#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Prop Initialization

// Size:
prop_left     = 0;
prop_right    = 0;
prop_top      = 0;
prop_bottom   = 0;

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

draw_set_color(c_orange);

draw_rectangle(x - prop_width + prop_offset_x, y - prop_height + prop_offset_y, x + prop_width + prop_offset_x, y + prop_height + prop_offset_y, true);
