#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Swap Initialization

event_inherited();

sequence_set(sequence_swap);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

if (player_handle.swap_alarm == 0)
{
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Swap

if (sprite_exists(sprite_index))
{
    draw_sprite_ext(sprite_index, image_index + (8 * player_handle.character_id), x, y - 16, 1, 1, 0, c_white, 1);
}
