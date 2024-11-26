#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Decoration Initialization

// View Object:
view_object[view_current] = id;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

image_index = sync_rate(game_get_time(), 2, sprite_get_number(sprite_index));
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Fountain

// Fountain:
draw_self();
