#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reticle Initialization

event_inherited();
sequence_set(pick(game_get_config("misc_reticle") == 2, sequence_reticle, sequence_reticle_colors));
homing_id = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

homing_id = player_id.homing_id;
if (!instance_exists(homing_id)) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Reticle

var draw_x, draw_y;

draw_x = floor(homing_id.x);
draw_y = floor(homing_id.y);

if (sprite_exists(sprite_index)) draw_sprite(sprite_index, image_index, draw_x, draw_y);
