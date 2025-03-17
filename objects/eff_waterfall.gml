#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Splash Initialization

event_inherited();
depth = -11;
sequence_set(seq_splash_6);
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset

if (game_ispaused(mnu_pause)) exit;

player_inst.waterfall_draw = false;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();
if (player_inst.waterfall_draw != true) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Splash

if (sprite_exists(sprite_index)) draw_sprite_ext(sprite_index, -1, x, y - 16, 1, 1, 0, c_white, 1);
