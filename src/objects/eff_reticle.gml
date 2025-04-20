#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reticle Initialization

event_inherited();
sequence_set(pick(game_config_get("misc_reticle") == 2, seq_reticle, seq_reticle_colors));
homing_inst = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();
homing_inst = player_inst.homing_inst;
if (!instance_exists(homing_inst)) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Reticle

if (!instance_exists(homing_inst)) exit;

var draw_x; draw_x = floor(homing_inst.x);
var draw_y; draw_y = floor(homing_inst.y);

if (sprite_exists(sprite_index)) draw_sprite(sprite_index, -1, draw_x, draw_y);
