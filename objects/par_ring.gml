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
main_left     = 8;
main_right    = 8;
main_top      = 8;
main_bottom   = 8;
main_offset_x = 0;
main_offset_y = 0;

// Dropped:
dropped = false;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

// Don't bother if the game is paused:
if (game_paused(ctrl_pause)) exit;

image_index = floor(global.object_time) div (8 / (1 + dropped));
