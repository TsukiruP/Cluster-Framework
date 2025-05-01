#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Decoration Initialization

event_inherited();
if (room == rm_debug && view_object != id) view_object = id;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

image_index = mod_time(game_get_time(), 2, sprite_get_number(sprite_index));
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Fountain

draw_self();
