#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reticle Initialization

event_inherited();

sequence_set(sequence_reticle);

if (game_get_config("misc_reticle") == 2)
{
    sequence_set(sequence_reticle_colors);
}

homing_handle = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

homing_handle = player_handle.homing_handle;

if (!instance_exists(homing_handle))
{
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Reticle

var draw_x, draw_y;

draw_x = floor(homing_handle.x);
draw_y = floor(homing_handle.y);

if (sprite_exists(sprite_index))
{
    draw_sprite(sprite_index, image_index, draw_x, draw_y);
}
