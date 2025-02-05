#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Jump Panel Initialization

event_inherited();
reaction_index = player_reaction_jump_panel;
reaction_mask = true;
shape = SHAPE_SLANT;
is_mask = false;
force = 12;
hitbox_set_hurtbox(6, 16, 4, 0, 25);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

image_index = time_sync(game_get_time(), 3, sprite_get_number(sprite_index));
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field force: number
