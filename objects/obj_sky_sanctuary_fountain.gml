#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Decoration Initialization

event_inherited();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// View Object

if (room == rm_debug)
{
    if (view_xview[view_current] != x - screen_get_width() / 2)
    {
        view_xview[view_current] = x - screen_get_width() / 2;
    }
}
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
