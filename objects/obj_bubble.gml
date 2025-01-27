#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bubble Initialization

event_inherited();
image_speed = 0;
size = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (game_ispaused(mnu_pause)) exit;

y -= 0.5;

if (collision_point(x, y, obj_water_mask, false, false) == noone) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Bubble

draw_self();
event_inherited();
