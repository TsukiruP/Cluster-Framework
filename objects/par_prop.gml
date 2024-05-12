#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Prop Initialization

// Size:
main_left     = 0;
main_right    = 0;
main_top      = 0;
main_bottom   = 0;
main_offset_x = 0;
main_offset_y = 0;
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

draw_rectangle(x - main_left + main_offset_x, y - main_top + main_offset_y, x + main_right + main_offset_x, y + main_bottom + main_offset_y, true);
