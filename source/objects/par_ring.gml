#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();
reaction_index = player_reaction_ring;
super = false;
rate = 8;
dropped = false;
hitbox_set_hurtbox(8, 8, 7, 7, 0, 0);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

image_index = mod_time(game_get_time(), rate / pick(dropped, 1, 2), sprite_get_number(sprite_index));
